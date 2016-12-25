`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:54:57 12/24/2016
// Design Name:   serial_adder
// Module Name:   /home/mihailo/development/projects/etchnet/etchnet/t_serial_adder.v
// Project Name:  etchnet
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: serial_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_serial_adder;

	// Inputs
	reg clk;
	reg in1;
	reg in2;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	serial_adder uut (
		.clk(clk), 
		.in1(in1), 
		.in2(in2), 
		.sum(out)
	);

    always 
        #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		in1 = 0;
		in2 = 0;

        #5
        #2  in1 = 1;
            in2 = 0;
        #2  in1 = 1;
            in2 = 1;
        #2  in1 = 0;
            in2 = 0;
        #2  in1 = 1;
            in2 = 0;
        #2  in1 = 0;
            in2 = 0;
        #2  in1 = 0;
            in2 = 1;
        #2  in1 = 1;
            in2 = 1;
        #2  in1 = 1;
            in2 = 1;
        #2  in1 = 0;
            in2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

