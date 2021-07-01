//------------------------------------------------------------------------------
//   Felipe Machado Sanchez
//   Area de Tecnologia Electronica
//   Universidad Rey Juan Carlos
//   https://github.com/felipe-m
//
//   sccb_master.v
//   Module in charge of the SCCB communication with the OmniVision OV7670
//   camera.
//   SCCB (Serial Camera Control Bus) is like the I2C
//   This module is the master.
//   For this first version, it will only write to the camera, therefore
//   it will be a 3-phase write transmission cycle
//   As explained in the Register Set section of the datasheet, the camera
//   slave address is x"42" (0x42, hexadecimal) for writting and and x"43" for
//   reading
//
//   Instead of generics, constants are defined in packages
//
//                 0 1 2 3
//       :________:     ___:     ___:
//  SCL  :        :\___/   :\___/   :
//       :        :        :        :
//       :__      :   _____:__ _____:
//  SDA  :  \_____:__/__d7_:__X__d6_:
//       :0 1 2 3 :0 1 2 3 :0 1 2 3
//                :        :
//                :.Tsccb..:

//          init                                  dont   Another phase
//        sequence 0 1 2 3                        care    OR end bit
//       :______  :   ___  :   ___  : :   ___  :   ___  :  ______
//  SCL  :      \_:__/   \_:__/   \_: :__/   \_:__/   \_:_/
//       :        :        :        : :        :        :
//       :__      : _______: _______: : _______: _______:    ____
//  SDA  :  \_____:/__d7___:X__d6___: :X__d0___:X___Z___:___/    
//       :0 1 2 3 :0 1 2 3 :0 1 2 3
//                :        :
//                :.Tsccb..:                     DNTC_ST:END_SEQ_ST
//       INIT_SEQ_ST
//
//     The period Tsccb is divided in 4 parts.
//     SCL changes at the end of 1st and 3rd quarters
//     SDA changes at the end of the peridod (end of last (4th) quarter)
//     When transmiting bits, SDA must not change when SCL is high
//     Max frequency of the sccb clock 400 KHz: Period 2.5 us
//     Half of the time will be high, the other half low: 1.25 us
//     However, the minimum clok low period for the sccb_clk is 1.3 us
//     making low and high the same time, would be 2.6 us (~384,6 KHz)
//     We will make a divider of the 1/4 the period, to be able to change
//     the signals at the quarter. That would be 650 ns.

//


module sccb_master
  #(parameter
    c_off                  = 1'b0, // push button off
    c_on                   = ~c_off, // push button on
    c_clk_period           = 10, // fpga clk peridod in ns
    // quarter of a period in ns
    c_sclk_period_div4     = 650, // see explanation above
    // frequency divider counter end value. Divided by 4 to have it divided
    // in 4 slots
    // we use div_ceil, to avoid having a smaller end count,
    // which would mean higher frequency
    c_sclk_div4_endcnt     = 65, // div_ceil(c_sclk_period_div4,c_clk_period);
    // number of bits necessary to represent c_sclk_endcont in binary
    c_nb_cnt_sclk_div4     =  7  // log2i(c_sclk_div4_endcnt-1) + 1;
   )
   (
    input         rst,       //reset, active high
    input         clk,       //fpga clock
    input         start_tx,  //start transmission
    input  [6:0]  id,        //id of the slave
    input  [7:0]  addr,      //address to be written
    input  [7:0]  data_wr,   //data to write to slave
    output        ready,     //ready to send
    //output reg    finish_tx, //transmission finished(pulse
    output reg    sclk,      //sccb clock
    output reg    sdat_on,   //transmitting serial ('1')
    //input         sdat_in, //sccb serial data in
    output reg    sdat_out   //sccb serial data out
   );


  // saving in registers the slave ID, address or the register
  // and data to be written. 8x3 = 24 bits
  //signal id_rg    : std_logic_vector(7 downto 0); //id of the slave
  //signal addr_rg  : std_logic_vector(7 downto 0); //address to be written
  //signal data_rg  : std_logic_vector(7 downto 0); //data to write to slave
  reg [24-1:0] send_rg; //id, addr and data


  // frequency divider, but 4 time faster than the sccb period
  reg [c_nb_cnt_sclk_div4-1:0] cnt_sclk_div4;
  // indicates that the count reached the end: end of a quarter
  wire       sclk_div4_end;

  // count of the four quarters of the scc clock
  reg  [1:0] cnt_4sclk;
  wire       sclk_end; // end of a sccb_clk cycle

  // count the 3 phases of the sending:
  //   0: slave ID
  //   1: address of the register to be written
  //   2: data to be written
  reg  [1:0] cnt_phases;
  reg        new_phase;  // end of a phase, starting a new one
  wire       phases_end; // end of the 3 phases

  reg        ready_aux;  // not busy, ready to receive

  // sccb_states:
  parameter IDLE_ST      = 0, // waiting to send, not busy
            INIT_SEQ_ST  = 1, // sending the initial sequence
            SEND_BYTE_ST = 2, // sending the byte of any of the 3 phases
            DNTC_ST      = 3, // dont care bit, in i2c would be ack
            END_SEQ_ST   = 4; // sending the end sequence

  reg  [2:0]  pr_sccb_st; // present state
  reg  [2:0]  nx_sccb_st; // next state

  // enable the counter of bits to send data and shifting the registers
  // in any of the 3 phases: ID_ADDR_ST, REG_ADDR_ST, SEND_BYTE_ST
  reg        send_data;
  // counter 
  reg  [2:0] cnt_8bits; // 3 bits to count 0 to 7
  // end of the 8 bit count
  wire       cnt_8bits_end;

  // indication to save id, address and data to write
  reg        save_indata;
  //clear registers where the data to send is saved
  reg        clr_datarg;

  assign ready = (rst == c_off) ? ready_aux : 1'b0; // if reset, not ready

  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      // the line is inactive at '1'
      send_rg   <= {24{1'b1}}; // '1' in all 24 bits
    else begin
      if (clr_datarg)
        send_rg  <= {24{1'b1}}; // all to '1'
      else if (save_indata)
        //'0' indicates we are writting in the slave. Reading not implemented
        // id has 7 bits
        send_rg   <= {id, 1'b0, addr, data_wr};
      else if (send_data) begin
        if (sclk_end)
          // rotate left, fillings with '1'
          send_rg <= {send_rg[23-1:0], 1'b1};
      end
    end
  end

  // counting a quarter of the sccb clk period
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      cnt_sclk_div4 <= 0;
    else begin
      if (ready_aux)
        cnt_sclk_div4 <= 0;
      else begin
        if (sclk_div4_end)
          cnt_sclk_div4 <= 0;
        else
          cnt_sclk_div4 <= cnt_sclk_div4 + 1'b1;
      end
    end
  end

  assign sclk_div4_end = (cnt_sclk_div4 == c_sclk_div4_endcnt-1)? 1'b1 : 1'b0;

  // counting the 4 quarters of the sccb clk period
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      cnt_4sclk <= 0;
    else begin
      if (ready_aux) // if inactive, no count and start counting
        cnt_4sclk <= 0;
      else if (sclk_end)
        cnt_4sclk <= 0;
      else if (sclk_div4_end)
        cnt_4sclk <= cnt_4sclk + 1'b1;
    end
  end

  assign sclk_end = (sclk_div4_end==1'b1 && cnt_4sclk == 4-1)? 1'b1 : 1'b0;

  // counting the 8 bits of each of the 3 phases
  // counting down to keep track of the bits, the first is the bit 7
  // the last the bit 0
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      cnt_8bits <= 3'b111;
    else begin
      // send_data active in any of the 3 phases (SEND_BYTE_ST)
      if (send_data==1'b0) // if inactive, no count and start counting
        cnt_8bits <= 3'b111;
      else if (cnt_8bits_end)
        cnt_8bits <= 3'b111;
      else if (sclk_end)
        cnt_8bits <= cnt_8bits - 1'b1;
    end
  end

  assign cnt_8bits_end = (sclk_end==1'b1 && cnt_8bits == 0)? 1'b1 : 1'b0;

  // counting the 3 phases of a SCCB write
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      cnt_phases <= 2'd0;
    else begin
      if (ready_aux)
        cnt_phases <= 2'd0;
      else if (phases_end)
        cnt_phases <= 2'd0;
      else if (new_phase)
        cnt_phases <= cnt_phases + 1'b1;
    end
  end

  // 3 phases for writting
  assign phases_end = (cnt_phases == 3-1 && new_phase ==1'b1) ? 1'b1 : 1'b0;

  // FSM sequential process
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      pr_sccb_st <= IDLE_ST;
    else
      pr_sccb_st <= nx_sccb_st;
  end

  // FSM combinatorial process
  always @ (pr_sccb_st or start_tx or cnt_4sclk or sclk_end or send_rg or
            cnt_8bits  or  cnt_phases or cnt_8bits_end)
  begin
    // default values
    ready_aux   = 1'b0;  // only ready in IDLE
    sdat_on     = 1'b0;
    sdat_out    = 1'b1;
    nx_sccb_st  = pr_sccb_st;
    save_indata = 1'b0;
    clr_datarg  = 1'b0;
    send_data   = 1'b0;
    new_phase   = 1'b0;
    //finish_tx   = 1'b0;
	//<SC> 
	sclk		= 1'b1;
    case (pr_sccb_st)
      IDLE_ST: begin  // waiting to send, not busy
        ready_aux = 1'b1;  // ready to send
        sclk      = 1'b1;
        sdat_on   = 1'b0;  //Z
        sdat_out  = 1'b1;
        if (start_tx) begin
          nx_sccb_st   = INIT_SEQ_ST;
          save_indata  = 1'b1;  //id, address and data to write have to be saved
        end
      end
      INIT_SEQ_ST: begin   // sending the initial sequence
        sclk    = 1'b1;
        sdat_on = 1'b1;
        case (cnt_4sclk)
          2'b00 : begin
            sclk     = 1'b1;
            sdat_out = 1'b1;
          end
          2'b01, 2'b10 : begin
            sclk     = 1'b1;
            sdat_out = 1'b0;
          end
          default : begin //3
            sclk     = 1'b0;
            sdat_out = 1'b0;
          end
        endcase
        if (sclk_end)
          nx_sccb_st = SEND_BYTE_ST;
      end
      SEND_BYTE_ST: begin // sending the bytes of any of the 3 phases
        send_data = 1'b1;  // enable the 8 bit counter
        sdat_on   = 1'b1;
        case (cnt_4sclk)
          2'b00, 2'b11:
            sclk  = 1'b0;
          default: //1, 2
            sclk  = 1'b1;
        endcase
        sdat_out = send_rg[23];
        if (cnt_8bits_end)
          nx_sccb_st = DNTC_ST;
      end
      DNTC_ST: begin     // dont care bit, in i2c would be ack
        sdat_on   = 1'b0;  // it will be Z
        case (cnt_4sclk)
          2'b00, 2'b11:
            sclk = 1'b0;
          default: //1, 2
            sclk = 1'b1;
        endcase
        if (sclk_end) begin
          new_phase   = 1'b1;
          if (cnt_phases == 3-1)
            nx_sccb_st = END_SEQ_ST; // end of the transimission
          else
            nx_sccb_st = SEND_BYTE_ST; // new phase
        end
      end
      END_SEQ_ST: begin   // sending the end sequence
        clr_datarg = 1'b1; //clear registers where the data to send is saved
        sdat_on    = 1'b1;
        case (cnt_4sclk)
          2'b00: begin
            sclk     = 1'b0;
            sdat_out = 1'b0;
          end
          2'b01: begin
            sclk     = 1'b1;
            sdat_out = 1'b0;
          end
          default: begin // 2 or 3
            sclk     = 1'b1;
            sdat_out = 1'b1;
          end
        endcase
        if (sclk_end) begin
          nx_sccb_st = IDLE_ST;
         // finish_tx  = 1'b1; // pulse to tell that transimission is done
        end
      end
    endcase
  end
    
endmodule
