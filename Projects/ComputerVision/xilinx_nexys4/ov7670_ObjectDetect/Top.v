`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:58 06/10/2021 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(
	  input        rst,  //sw1
     input        clk,
     output       ov7670_sioc,
     output       ov7670_siod,
     output       ov7670_rst_n,
	  output			ov7670_pwdn,

     input        ov7670_vsync,
     input        ov7670_href,
     input        ov7670_pclk,
     output       ov7670_xclk,
     input [8-1:0] ov7670_d, 


     output [15:0] led,
	  input sw2,


     output [3:0] vga_red, 
     output [3:0] vga_green,
     output [3:0] vga_blue,
     output       vga_hsync,
     output       vga_vsync
    );


   wire rgbmode, testmode;
	wire [3-1:0] rgbfilter;
	
	wire    swap_r_b;
	assign  swap_r_b = 1'b1;
	
	wire [13-1:0] capture_addr;
	wire [12-1:0] capture_data;
	wire capture_we;
	
	wire    resend;
	assign  resend = 1'b0;
	//wire	  ov7670_cfgdone;
	wire [6-1:0] cnt_reg_test;
	wire	  sdat_on;
	wire    sdat_out;
	wire	  s_ov7670_xclk;
	assign ov7670_xclk = s_ov7670_xclk;

	wire [12:0] s_addrb, s_addrb_post;
	wire [11:0] s_doutb, s_doutb_post;
	
	wire    s_proc_we;
   wire [12:0]  s_proc_img_addr;
   wire [11:0]  s_proc_img_pxl;
	
	wire visible, new_pxl;
	wire s_vga_hsync, s_vga_vsync;
	wire [9:0] col;
	wire [9:0] row;


// Nombre archivo Nombre_proyecto
   //archivo   //señal o variable
	mode_sel	Mode_selecc
	(
		.rst		(rst),
      .clk     (clk),
      .sig_in  (sw2),
      .rgbmode (rgbmode),
      .testmode(testmode),
      .rgbfilter (rgbfilter)
	);
	
	
	ov7670_capture Captura_OV7670
	(
		.rst		(rst),
		.clk		(clk),
		.pclk		(ov7670_pclk),
		.href		(ov7670_href),
		.vsync	(ov7670_vsync),
		.rgbmode	(rgbmode),
		.swap_r_b(swap_r_b), 
      .data 	(ov7670_d), /////////////////////////////////
      .addr		(capture_addr),
		.dout    (capture_data),
		.we		(capture_we)
	);
	
	
	ov7670_top_ctrl TOP_Control_OV7670
	(
		.rst		(rst),
		.clk		(clk),
		.rgbmode	(rgbmode),
		.testmode(testmode),
		.resend	(resend),    
		//.done		(ov7670_cfgdone),   
		.sclk		(ov7670_sioc),
		.sdat_on	(sdat_on),         
		.sdat_out(sdat_out),
		.ov7670_rst_n (ov7670_rst_n),
		.ov7670_clk	(s_ov7670_xclk),       
      .ov7670_pwdn (ov7670_pwdn)  	
	);
	
	
	assign ov7670_siod = sdat_on ? sdat_out : 1'bz;
	
	framebuf_80x60_12b  Buffer_preproc
	(
		.clk		(s_ov7670_xclk),
		.wea		(capture_we),
		.addra	(capture_addr),
		.dina		(capture_data),
		.addrb	(s_addrb),
      .doutb   (s_doutb)
	);
	
	
	color_proc	Filtro_color
	(
		.rst		(rst),
		.clk     (clk),
      .rgbfilter  (rgbfilter),
		
		.orig_addr  (s_addrb),
      .orig_pxl   (s_doutb),
	  
      .proc_we    (s_proc_we),
      .proc_addr  (s_proc_img_addr),
      .proc_pxl   (s_proc_img_pxl),
      .leds (led)
	);
	
	
   framebuf_80x60_12b  Buffer_postproc
	(
		.clk		(clk),
		.wea		(s_proc_we),
		.addra	(s_proc_img_addr),
		.dina		(s_proc_img_pxl),
		.addrb	(s_addrb_post),
      .doutb   (s_doutb_post)
	);
	
	
	vga_sync sincro
	(
		.rst		(rst),
		.clk		(clk),
		.visible (visible),
		.new_pxl (new_pxl),
		.hsync   (vga_hsync),
		.vsync	(vga_vsync),
		.col		(col),
		.row		(row)
   );
	
	
	vga_display pinta
	(
		.rst		(rst),
		.clk		(clk),
		.visible	(visible),
		.new_pxl (new_pxl),
		.rgbmode	(rgbmode),
		.testmode(testmode),
		.rgbfilter(rgbfilter),
		.col		(col),
		.row		(row),
		.frame_pixel (s_doutb_post), 
		.frame_addr	(s_addrb_post),
		.vga_red	(vga_red),
		.vga_green(vga_green),
		.vga_blue(vga_blue)
	);

endmodule
