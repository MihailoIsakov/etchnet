module serial_adder(
    input clk,
    // TODO how to lose the reset?
    input rst,
    input in1,
    input in2,
    // TODO can we do without the reg?
    output reg sum
);

    reg cout; 

    always @ (posedge clk) 
        if (rst) begin
            sum = 0;
            cout = 0;
        end
        else
            {cout, sum} = in1 + in2 + cout;

endmodule
