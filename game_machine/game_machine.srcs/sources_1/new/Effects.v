`timescale 1ns / 1ps

module Effects(
    input clk,
    input rst_n,
    input [1:0] game_state,
    input [7:0] target_led,
    output reg [7:0] led
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            led <= 8'b0;
        end else begin
            case (game_state)
                2'b01: begin
                    led <= target_led;
                end
                2'b10: begin
                    led <= 8'b11111111;
                end
                default: begin
                    led <= 8'b0;
                end
            endcase
        end
    end

endmodule