module shifter 
#(
    parameter shift1 = 8,
    parameter shift2 = 8
)
(
    input clk,
    input rst,
    input data,
    output out1,
    output out2
);

    localparam regsize = (shift1 > shift2) ? shift1 : shift2;

    reg [regsize:0] bits;

    always @ (posedge clk) begin
        if (rst)
            bits = 0;
        else begin
            bits = {bits[regsize-1:0], data};
        end
    end

    assign out1 = bits[shift1];
    assign out2 = bits[shift2];

endmodule
