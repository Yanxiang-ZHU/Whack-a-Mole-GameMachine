`timescale 1ns / 1ps

module RandomGen(
    input clk,
    input rst,
    output reg [7:0] random_num
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            random_num <= 8'b10101010;
        end else begin
            random_num <= {random_num[6:0], random_num[7] ^ random_num[5]};
        end
    end

endmodule