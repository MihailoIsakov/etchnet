`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:31:27 12/24/2016
// Design Name:   shifter
// Module Name:   /home/mihailo/development/projects/etchnet/etchnet/t_shifter.v
// Project Name:  etchnet
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_shifter;

	// Inputs
	reg clk;
	reg rst;
	reg data;

	// Outputs
	wire out1;
	wire out2;

	// Instantiate the Unit Under Test (UUT)
	shifter #(0, 3) uut (
		.clk(clk), 
		.rst(rst), 
		.data(data), 
		.out1(out1), 
		.out2(out2)
	);

    always 
        #1 clk = ~clk;

    always
        #2 data = $random%2;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 0;
		data = 0;

        #10 rst = 1;
        #10 rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

