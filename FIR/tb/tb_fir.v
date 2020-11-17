//`timescale 1ns

module tb_fir ();
//the number of bit is 8
//the number of corfficients is N+1. N=10. Number of coefficients=11.
   wire CLK_i;
   wire RST_n_i;
   
   wire [7:0] DIN_i; //data_in
   
   wire VIN_i; //validation:signal_in
   
   //signal for every coefficients
   wire [7:0] H0_i;
   wire [7:0] H1_i;
   wire [7:0] H2_i;
   wire [7:0] H3_i;
   wire [7:0] H4_i;
   wire [7:0] H5_i;
   wire [7:0] H6_i;
   wire [7:0] H7_i;
   wire [7:0] H8_i;
   wire [7:0] H9_i;
   wire [7:0] H10_i;
   
   wire [7:0] DOUT_i; //data_out
   
   wire VOUT_i;//validation_signal_out
	
   wire PAUSE_i;
   
   wire END_SIM_i;// è necessario???
   
   
   //clock generator
   clk_gen CG(.END_SIM(END_SIM_i),
  	      .CLK(CLK_i),
		  .PAUSE(PAUSE_i),
	      .RST_n(RST_n_i));
   //produce sia i coefficienti che il dato di ingresso. Il data out del datamaker deve essere il 
   //data_in del DUT
   data_maker SM(.CLK(CLK_i),
		 .PAUSE(PAUSE_i),
	     .RST_n(RST_n_i),
		 .VOUT(VIN_i),
		 .DOUT(DIN_i),
		 .H0(H0_i),
		 .H1(H1_i),
		 .H2(H2_i),
		 .H3(H3_i),
		 .H4(H4_i),
	     .H5(H5_i),
	     .H6(H6_i),
	     .H7(H7_i),
	     .H8(H8_i),
	     .H9(H9_i),
	     .H10(H10_i),
		 .END_SIM(END_SIM_i));
		 
   //this is the design under test (FIR filter)
   myfir UUT(.CLK(CLK_i),
	     .RST_n(RST_n_i),
	     .DIN(DIN_i),
         .VIN(VIN_i),
	     .H0(H0_i),
	     .H1(H1_i),
	     .H2(H2_i),
	     .H3(H3_i),
	     .H4(H4_i),
	     .H5(H5_i),
	     .H6(H6_i),
	     .H7(H7_i),
	     .H8(H8_i),
	     .H9(H9_i),
	     .H10(H10_i),
         .DOUT(DOUT_i),
         .VOUT(VOUT_i));
   //
   data_sink DS(.CLK(CLK_i),
		.RST_n(RST_n_i),
		.VIN(VOUT_i),
		.DIN(DOUT_i));   

endmodule
