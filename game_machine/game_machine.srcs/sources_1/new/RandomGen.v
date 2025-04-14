`timescale 1ns / 1ps

module RandomGen(
    input clk,
    input rst_n,
    output reg [7:0] random_num
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            random_num <= 8'b10101010;
        end else begin
            random_num <= {random_num[6:0], random_num[7] ^ random_num[5]};
        end
    end

endmodule