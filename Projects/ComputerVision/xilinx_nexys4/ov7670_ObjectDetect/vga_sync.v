//------------------------------------------------------------------------------
// Felipe Machado Sanchez
// Departameto de Tecnologia Electronica
// Universidad Rey Juan Carlos
// https://github.com/felipe-m
//

module vga_sync
  #(parameter
    c_pxl_visible    = 640,
    c_pxl_fporch     = 16,
    // from 0 to front porch
    c_pxl_2_fporch   = c_pxl_visible + c_pxl_fporch, // 656
    c_pxl_synch      = 96,
    // from 0 to synch
    c_pxl_2_synch    = c_pxl_2_fporch + c_pxl_synch, // 752
    // total horizontal pixels
    c_pxl_total      = 800,
    // number of pixels of the backporch
    c_pxl_bporch     = c_pxl_total - c_pxl_2_synch,  //  48
    // --------------- Number of rows (Vertical) ----------
    c_line_visible   = 480,
    c_line_fporch    = 9,
    // from 0 to front porch (vertical)
    c_line_2_fporch  = c_line_visible + c_line_fporch, // 489
    c_line_synch     = 2,
    // from init to synchro (vertical)
    c_line_2_synch   = c_line_2_fporch + c_line_synch, // 491
    // total number of lines
    c_line_total     = 520,
    // number of lines of the back porch
    c_line_bporch    = c_line_total - c_line_2_synch,  //  29

    // number of bits for each count
    c_nb_pxls        = 10,  //c_pxl_total      :  800, 
    c_nb_lines       = 10,  //c_line_total   :  520,

    // number of bits for each color RGB
    c_nb_red         = 4,
    c_nb_green       = 4,
    c_nb_blue        = 4,

    // VGA frequency
    c_freq_vga       = 25*10**6, // VGA 25MHz

    // active level of synchronization
    c_synch_act      = 0
   )
   (
    input           rst,
    input           clk,
    output          visible,
    output          new_pxl,
    output  reg     hsync,
    output  reg     vsync,
    output [10-1:0] col,
    output [10-1:0] row
   );
  

  reg     [1:0]  cnt_clk; // count 0 to 3: 4 clk cycles, from 100MHz to 15MHz
  reg  [10-1:0]  cnt_pxl;
  reg  [10-1:0]  cnt_line;

  wire   end_cnt_pxl;
  wire   end_cnt_line;
  wire   new_line;

  reg    visible_pxl;  
  reg    visible_line;

  // count 4 clock cycles to get a pixel cycle
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      cnt_clk <= 2'd0;
    else begin
      if (new_pxl) 
        cnt_clk <= 2'd0;
      else
        cnt_clk <= cnt_clk + 1'b1;
    end
  end 

  assign new_pxl =  (cnt_clk==3) ? 1'b1 : 1'b0; 

  assign col     = cnt_pxl;
  assign row     = cnt_line;
  assign visible = visible_pxl && visible_line;

  // counting 800 pixels (columns)
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      cnt_pxl <= 10'd0;
    else begin
      if (new_pxl) begin
        if (end_cnt_pxl) 
          cnt_pxl <= 10'd0;
        else
          cnt_pxl <= cnt_pxl + 1'b1;
      end
    end
  end 

  // end of pixel count
  assign end_cnt_pxl =  (cnt_pxl == c_pxl_total-1) ? 1'b1 : 1'b0;
  // nueva linea: cuando es el fin de cuenta y llega un nuevo pixel
  assign new_line = end_cnt_pxl && new_pxl;

  // combinational outputs of pixel count (horizontal)
  always @ (rst or cnt_pxl)
  begin
    if (rst) begin
      visible_pxl = 1'b0;
      hsync = ~c_synch_act;
    end
    else if (cnt_pxl < c_pxl_visible) begin
      visible_pxl = 1'b1;
      hsync = ~c_synch_act;
    end
    else if (cnt_pxl < c_pxl_2_fporch) begin
      visible_pxl = 1'b0;
      hsync = ~c_synch_act;
    end
    else if (cnt_pxl < c_pxl_2_synch) begin
      visible_pxl = 1'b0;
      hsync = c_synch_act; // synch active
    end
    else begin
      visible_pxl = 1'b0;
      hsync = ~c_synch_act; 
    end
  end

  // counting 520 lines (rows)
  always @ (posedge rst, posedge clk)
  begin
    if (rst)
      cnt_line <= 10'd0;
    else begin
      if (new_line) begin
        if (end_cnt_line) 
          cnt_line <= 10'd0;
        else
          cnt_line <= cnt_line + 1'b1;
      end
    end
  end 

  // end of pixel count
  assign end_cnt_line =  (cnt_line == c_line_total-1) ? 1'b1 : 1'b0;

  // combinational outputs of line count (vertical)
  always @ (rst or cnt_line)
  begin
    if (rst) begin
      visible_line = 1'b0;
      vsync = ~c_synch_act;
    end
    else if (cnt_line < c_line_visible) begin
      visible_line = 1'b1;
      vsync = ~c_synch_act;
    end
    else if (cnt_line < c_line_2_fporch) begin
      visible_line = 1'b0;
      vsync = ~c_synch_act;
    end
    else if (cnt_line < c_line_2_synch) begin
      visible_line = 1'b0;
      vsync = c_synch_act; // synch active
    end
    else begin
      visible_line = 1'b0;
      vsync = ~c_synch_act; 
    end
  end

endmodule
