//================================================ START FILE HEADER ================================================
// Filename : frame_decoder.v
// Module Name : frame_decoder
// Module ID : SP8PI1
// Description : Decodes Input frame, and outputs CHn and OFFn values.
// Description : Frame: STX1|STX2|CH1|CH2|CH3|CH4|OFF1|OFF2|OFF3|OFF4|RSV1|RSV2|RSV3|RSV4|RSV5|RSV6
// Description : STX1 value = 0xff = 255, STX2 value = 0x5a = 90
//================================================= VERSION CONTROL =================================================
// $Revision: 2911 $
// $Author: enavarro $
// $Date: $
// $URL: $
//================================================= MAINTENANCE LOG =================================================
//
//================================================ MODULE DECLARATION ===============================================
module frame_decoder 
// GLOBAL PARAMETER DECLARATION
#(	parameter BR_PERIOD = 220,
	parameter BR_PERIOD_HALF = 110
)
(
// INPUT PORT DECLARATION
	input	reset,
	input	clk,
	input	sink_data_valid,
	input	[7:0]	sink_data,
// OUTPUT PORT DECLARATION
	/*output source_data_valid,
	output [7:0] source_CH1data,
	output [7:0] source_CH2data,
	output [7:0] source_CH3data,
	output [7:0] source_CH4data,
	output [7:0] source_offset1data,
	output [7:0] source_offset2data,
	output [7:0] source_offset3data,
	output [7:0] source_offset4data*/
	output reg source_data_valid = 0,
	output reg [7:0] source_CH1data = 8'd0,
	output reg [7:0] source_CH2data = 8'd0,
	output reg [7:0] source_CH3data = 8'd0,
	output reg [7:0] source_CH4data = 8'd0,
	output reg [7:0] source_offset1data = 8'd0,
	output reg [7:0] source_offset2data = 8'd0,
	output reg [7:0] source_offset3data = 8'd0,
	output reg [7:0] source_offset4data = 8'd0
);

// INPUT/OUTPUT PORT DECLARATION
/*reg source_data_valid = 0;
reg [7:0] source_CH1data = 8'd0;
reg [7:0] source_CH2data = 8'd0;
reg [7:0] source_CH3data = 8'd0;
reg [7:0] source_CH4data = 8'd0;
reg [7:0] source_offset1data = 8'd0;
reg [7:0] source_offset2data = 8'd0;
reg [7:0] source_offset3data = 8'd0;
reg [7:0] source_offset4data = 8'd0;*/
// LOCAL PARAMETER DECLARATION
// ======================= State machine Parameters ======================= //
localparam S_WF_STX1 = 4'd0, S_CH1_ADQ = 4'd1, S_CH2_ADQ = 4'd2, S_CH3_ADQ = 4'd3, S_CH4_ADQ = 4'd4;
localparam S_OFF1_ADQ = 4'd5, S_OFF2_ADQ = 4'd6, S_OFF3_ADQ = 4'd7, S_OFF4_ADQ = 4'd8;
localparam S_WF_STX2 = 4'd9, S_RSV = 4'd10;

// INTERNAL REGISTERS DECLARATION
//(* syn_encoding = "safe" *) reg [2:0] state;
reg [3:0] state = S_WF_STX1;
reg [31:0] count = 32'd0;

//reg unsigned [31:0]	timer_Count;

// TASK DECLARATION
task treset;
begin
	state <= S_WF_STX1;
	count <= 32'd0;
	source_data_valid <= 0;
	source_CH1data <= 8'd0;
	source_CH2data <= 8'd0;
	source_CH3data <= 8'd0;
	source_CH4data <= 8'd0;
	source_offset1data <= 8'd0;
	source_offset2data <= 8'd0;
	source_offset3data <= 8'd0;
	source_offset4data <= 8'd0;
end
endtask

// ALWAYS CONSTRUCT BLOCK
always @(posedge clk)
begin
	if (reset) begin
		treset();
	end else begin
	
		case (state)
			
			S_WF_STX1: begin	// 0
				if (sink_data_valid && (sink_data==8'hff)) begin
					state <= S_WF_STX2;
				end else begin
					state <= S_WF_STX1;
				end
				source_data_valid <= 0;
			end
			S_WF_STX2: begin	// 9
				if (sink_data_valid && (sink_data==8'h5a)) begin
					state <= S_CH1_ADQ;
				end else begin
					state <= S_WF_STX2;
				end
			end
			S_CH1_ADQ: begin	// 1
				if (sink_data_valid) begin
					source_CH1data <= sink_data;
					state <= S_CH2_ADQ;
				end else begin
					state <= S_CH1_ADQ;
				end
			end
			S_CH2_ADQ: begin	// 2
				if (sink_data_valid) begin
					source_CH2data <= sink_data;
					state <= S_CH3_ADQ;
				end else begin
					state <= S_CH2_ADQ;
				end
			end
			S_CH3_ADQ: begin	// 3
				if (sink_data_valid) begin
					source_CH3data <= sink_data;
					state <= S_CH4_ADQ;
				end else begin
					state <= S_CH3_ADQ;
				end
			end
			S_CH4_ADQ: begin	// 4
				if (sink_data_valid) begin
					source_CH4data <= sink_data;
					state <= S_OFF1_ADQ;
				end else begin
					state <= S_CH4_ADQ;
				end
			end
			S_OFF1_ADQ: begin	// 5
				if (sink_data_valid) begin
					source_offset1data <= sink_data;
					state <= S_OFF2_ADQ;
				end else begin
					state <= S_OFF1_ADQ;
				end
			end
			S_OFF2_ADQ: begin	// 6
				if (sink_data_valid) begin
					source_offset2data <= sink_data;
					state <= S_OFF3_ADQ;
				end else begin
					state <= S_OFF2_ADQ;
				end
			end
			S_OFF3_ADQ: begin	// 7
				if (sink_data_valid) begin
					source_offset3data <= sink_data;
					state <= S_OFF4_ADQ;
				end else begin
					state <= S_OFF3_ADQ;
				end
			end
			S_OFF4_ADQ: begin	// 8
				if (sink_data_valid) begin
					source_offset4data <= sink_data;
					state <= S_RSV;
				end else begin
					state <= S_OFF4_ADQ;
				end
			end
			S_RSV: begin		// 10
				if (sink_data_valid) begin
					if (count < 5) begin
						count <= count + 32'd1;
						state <= S_RSV;
					end else begin
						count <= 32'd0;
						state <= S_WF_STX1;
						source_data_valid <= 1;
					end
				end else begin
					state <= S_RSV;
				end
			end
			
			default: begin
				treset();
			end
				
		endcase
		
		// ********* Debug only *********
		//debug_only_state <= state;
		//debug_only_bit_count <= bit_Count;
		
	end // reset end
end // always end


// CONTINOUS ASSIGNMENT

// END OF MODULE
endmodule





