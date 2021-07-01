`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:24:50 06/10/2021 
// Design Name: 
// Module Name:    framebuf_80x60_12b 
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
module framebuf_80x60_12b(
    input clk,
    input wea,
    input [12:0] addra,
    input [11:0] dina,
    input [12:0] addrb,
    output reg [11:0] doutb
    );
	 
	 
  parameter c_img_cols = 80; // # cols
  parameter c_img_rows = 60; // # rows
  parameter c_img_pxls = c_img_cols * c_img_rows; //4800=80x60
  parameter c_nb_img_pxls =  13;  //80*60=4800 -> 2^13
  parameter c_nb_buf = 12; //4 bits for each color
  
  //reg doutb;    //CAMBIO
  reg  [c_nb_buf-1:0] ram[c_img_pxls-1:0];

  always @ (posedge clk)
  begin
    if (wea)
      ram[addra] <= dina;
      doutb <= ram[addrb];
  end


endmodule
