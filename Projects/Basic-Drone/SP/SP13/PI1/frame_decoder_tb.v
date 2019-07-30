`timescale 1ns/10ps		//$GC: Para la simulaci�n se utilizará una granuralidad de 1ns
								//$GC: Para la simulaci�n se utlizará una resolución temporal de 1ps
// ======================= Port declarations I/Os ======================= //
module frame_decoder_tb();

// ======================= Inputs al MUT =======================
reg reset;
reg clk;
reg sink_data_valid;
reg [7:0] sink_data;

// ======================= Outputs del MUT =======================
wire  source_data_valid;
wire  [7:0]	source_CH1data;
wire  [7:0]	source_CH2data;
wire  [7:0]	source_CH3data;
wire  [7:0]	source_CH4data;
wire  [7:0]	source_offset1data;
wire  [7:0]	source_offset2data;
wire  [7:0]	source_offset3data;
wire  [7:0]	source_offset4data;


// ======================= Parámetros Sistema =======================
parameter T_main=83;	//$CLOCK: Aprox 12MHz
parameter T_main2=41;	//$CLOCK: Aprox 12MHz
// ======================= Parámetros del MUT =======================
parameter MODULO_REVISADO  = "frame_decoder";
parameter VERSION_REVISADA = "V 0.x";
//===================AUX REGS FOR TESTS
reg [8*21:0] NombreTest;	// Usado para identificar el test en curso
// ======================= Instanciación MUTs=======================
frame_decoder	 MUT(	.reset(reset),
							.clk(clk),
							.sink_data_valid(sink_data_valid),
							.sink_data(sink_data),
							.source_data_valid(source_data_valid),
							.source_CH1data(source_CH1data),
							.source_CH2data(source_CH2data),
							.source_CH3data(source_CH3data),
							.source_CH4data(source_CH4data),
							.source_offset1data(source_offset1data),
							.source_offset2data(source_offset2data),
							.source_offset3data(source_offset3data),
							.source_offset4data(source_offset4data)
							);

// ======================= Reset and clock =======================
always #(T_main2) clk = ~clk;
// ======================= Tasks =======================
// ======================= Test Sequence =======================
	initial begin
		/**********************************************************/           
		//$TCINDEX: 1          
		//$TCDESC:  Resets and releases module
		/**********************************************************/ 
		$display("Starts T_1");
		NombreTest = "TEST_1";
		// ------------ MUT Init + Test ------------ //
		reset    			= 1;     //$PT: CLK iddle high and reset asserted
		sink_data_valid	= 0;
	   sink_data = 0;	
		clk = 0;
		#(100);
		reset    			= 0;     
		@(posedge clk);	
		#(100);
		$display("T_1 ended");


		/**********************************************************/           
		//$TCINDEX: 2          
		//$TCDESC:  Sends 0x ff 5a 1 2 3 4 5 6 7 8 9 a b c d e
		/**********************************************************/  
		$display("Starts T_2");
		NombreTest = "TEST_2";
		// Send byte
	   sink_data = 8'hff;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge	
		// Send byte
	   sink_data = 8'h5a;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h01;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h02;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h03;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h04;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h05;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h06;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h07;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h08;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h09;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h0a;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h0b;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h0c;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h0d;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		// Send byte
	   sink_data = 8'h0e;	
		sink_data_valid	= 1;
		#(T_main);
		sink_data_valid	= 0;
		#(100*T_main);
		wait(clk==0);		//$PT: Waits for main clk deassertion
		wait(clk==1);		//$PT: Waits for main clk assertion
		wait(clk==0);		//$PT: Waits for main clk negedge
		
		
		$display("T_2 ended");
	end
endmodule
