module serial_adder(
    input clk,
    input in1,
    input in2,
    // TODO can we do without the reg?
    output reg sum
);

    reg carry; 
    initial carry = 0;

    always @ (posedge clk) 
        {carry, sum} = in1 + in2 + carry;

endmodule
