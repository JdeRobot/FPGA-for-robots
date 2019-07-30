module ppm_encoder(
    clk,
    //tecla,
    //tecla_rdy,
    ppm_output

);

input clk;
output ppm_output;
//input [2:0] tecla;
//input tecla_rdy;


//************************************************//
localparam ppm_min_pulses = 15'd8262;
localparam ppm_middle_pulses = 15'd14412;
localparam ppm_max_pulses = 15'd20556;
localparam pulses_separator = 15'd3600;
reg [18:0] init_pulses = 19'd0;
reg [14:0] throttle = ppm_min_pulses;   //1
reg [14:0] aileron = ppm_min_pulses;      //2
reg [14:0] elevator = ppm_min_pulses;     //3
reg [14:0] rudder = ppm_min_pulses;           //4
reg [2:0] tecla_reg = 3'd6;
//***********************************************//
reg [14:0] pulses2count = 15'd0;
reg [14:0] counter = 15'd0;
reg ppm_output_reg = 0;
//*************STATES DECLARATION****************//

localparam A=3'd0, W=3'd1, S=3'd2, D=3'd3, SPACE=3'd4, B=3'd6;

reg [1:0] CHANNEL = 2'd0;
reg [1:0] GENERATE_CHANNEL = 2'd1;
reg [1:0] SEPARATOR = 2'd2;
reg [1:0] WAIT = 2'd3;
//reg [1:0] PPM_STATE = CHANNEL;
reg [1:0] PPM_STATE = 2'd0;	// CHANNEL


reg [3:0] INIT_PROTOCOL = 4'd0;
reg [3:0] CH1 = 4'd1; //throttle
reg [3:0] CH2 = 4'd2; //aileron
reg [3:0] CH3 = 4'd3; //elevator
reg [3:0] CH4 = 4'd4; //rudder
reg [3:0] CH5 = 4'd5;
reg [3:0] CH6 = 4'd6;
reg [3:0] CH7 = 4'd7;
reg [3:0] CH8 = 4'd8;
reg [3:0] CH9 = 4'd9;
reg [3:0] CH10 = 4'd10;
reg [3:0] CH11 = 4'd11;
reg [3:0] CH12 = 4'd12;
//reg [3:0] CHOOSE_CHANNEL = INIT_PROTOCOL;
reg [3:0] CHOOSE_CHANNEL = 4'd0;	// INIT_PROTOCOL

//**********************************************//

/*begin
    if( tecla_rdy == 1 )
        tecla_reg <= tecla;
end*/



always @(posedge clk)
begin
        case ( tecla_reg )

        B:              //bind
            begin
                throttle <= ppm_min_pulses;
                aileron <= ppm_max_pulses;
                elevator <= ppm_min_pulses;
                rudder <= ppm_max_pulses;
            end
        A:
            begin

                if ( rudder >= ppm_max_pulses- 2 )
                    rudder <= ppm_max_pulses;
                else
                    rudder <= rudder + 1;
            end
        W:
            begin
                if ( throttle >= ppm_max_pulses - 2 )
                    throttle <= ppm_max_pulses;
                else
                    throttle <= throttle + 1;
            end
        S:
            begin
                if ( throttle >= ppm_max_pulses - 2 )
                    throttle <= ppm_max_pulses;
                else
                    throttle <= throttle + 1;
            end
        D:
            begin
                if ( rudder <= ppm_min_pulses + 2 )
                    rudder <= ppm_min_pulses;
                else
                    rudder <= rudder - 1;
            end
        SPACE:
            begin
                if ( throttle >= ppm_max_pulses - 2 )
                    throttle <= ppm_max_pulses;
                else
                    throttle <= throttle + 1;
            end
        B:
            begin
                if ( throttle >= ppm_max_pulses - 2 )
                    throttle <= ppm_max_pulses;
                else
                    throttle <= throttle + 1;
            end
        default:
            begin
                throttle <= throttle;
                aileron <= aileron;
                elevator <= elevator;
                rudder <= rudder;
            end
        endcase
end

always @(posedge clk)
begin

    case(PPM_STATE)

        CHANNEL:
        begin
            case(CHOOSE_CHANNEL)
                INIT_PROTOCOL:
                    begin
                    pulses2count <= init_pulses;
                    CHOOSE_CHANNEL <= CH1;
                    //init_pulses <= 19'd366195;
                    end
                CH1:
                    begin
                    pulses2count <= throttle;
                    CHOOSE_CHANNEL <= CH2;
                    init_pulses <= init_pulses + throttle;
                    end
                CH2:
                    begin
                    pulses2count <= aileron;
                    CHOOSE_CHANNEL <= CH3;
                    init_pulses <= init_pulses + aileron;
                    end
                CH3:
                    begin
                    pulses2count <= elevator;
                    CHOOSE_CHANNEL <= CH4;
                    init_pulses <= init_pulses + elevator;
                    end
                CH4:
                    begin
                    pulses2count <= rudder;
                    CHOOSE_CHANNEL <= CH5;
                    init_pulses <= init_pulses + rudder;
                    end
                CH5:
                    begin
                    pulses2count <= ppm_min_pulses;
                    CHOOSE_CHANNEL <= CH6;
                    init_pulses <= init_pulses + ppm_min_pulses;
                    end
                CH6:
                    begin
                    pulses2count <= ppm_min_pulses;
                    CHOOSE_CHANNEL <= CH7;
                    init_pulses <= init_pulses + ppm_min_pulses;
                    end
                CH7:
                    begin
                    pulses2count <= ppm_middle_pulses;
                    CHOOSE_CHANNEL <= CH8;
                    init_pulses <= init_pulses + ppm_min_pulses;
                    end
                CH8:
                    begin
                    pulses2count <= ppm_middle_pulses;
                    CHOOSE_CHANNEL <= CH9;
                    init_pulses <= init_pulses + ppm_min_pulses;
                    end
                CH9:
                    begin
                    pulses2count <= ppm_middle_pulses;
                    CHOOSE_CHANNEL <= CH10;
                    init_pulses <= init_pulses + ppm_min_pulses;
                    end
                CH10:
                    begin
                    pulses2count <= ppm_middle_pulses;
                    CHOOSE_CHANNEL <= CH11;
                    init_pulses <= init_pulses + ppm_min_pulses;
                    end
                CH11:
                    begin
                    pulses2count <= ppm_middle_pulses;
                    CHOOSE_CHANNEL <= CH12;
                    init_pulses <= init_pulses + ppm_min_pulses;
                    end
                CH12:
                    begin
                    pulses2count <= ppm_middle_pulses;
                    CHOOSE_CHANNEL <= INIT_PROTOCOL;
                    init_pulses <= (19'd366195) - (init_pulses + ppm_middle_pulses + 19'd46800);
                    end
            endcase
            PPM_STATE <= SEPARATOR;
        end


        SEPARATOR:
        begin
            if (counter == pulses_separator-2)
            begin
                counter <= 0;
                PPM_STATE <= GENERATE_CHANNEL;
                ppm_output_reg <= !ppm_output_reg;
            end
            else
            begin
                counter <= counter + 1;
                PPM_STATE <= SEPARATOR;
            end
        end


        GENERATE_CHANNEL:
        begin
            if ( counter == pulses2count)
            begin
                counter <= 0;
                
                ppm_output_reg <= !ppm_output_reg;
                if ( CHOOSE_CHANNEL == CH1 )
                begin
                    init_pulses <= 19'd0;
                end
					 
					 if (CHOOSE_CHANNEL == INIT_PROTOCOL) begin
							PPM_STATE <= WAIT;
					 end else begin
							PPM_STATE <= CHANNEL;
					 end
            end
            else
            begin
                counter <= counter + 1;
                PPM_STATE <= GENERATE_CHANNEL;
            end
        end
		  
        WAIT:
        begin
				PPM_STATE <= WAIT;
		  end

    endcase

end

assign ppm_output = ppm_output_reg;

endmodule
