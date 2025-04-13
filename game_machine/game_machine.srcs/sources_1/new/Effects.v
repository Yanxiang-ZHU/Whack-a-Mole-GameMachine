`timescale 1ns / 1ps

module Effects(
    input clk,
    input rst,
    input [1:0] game_state,
    input [7:0] target_led,
    output reg [7:0] led,
    output reg sound
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led <= 8'b0;
            sound <= 1'b0;
        end else begin
            case (game_state)
                2'b01: begin // PLAY 状态
                    led <= target_led;
                    sound <= 1'b1; // 播放音效
                end
                2'b10: begin // END 状态
                    led <= 8'b11111111; // 所有灯亮
                    sound <= 1'b1; // 播放结束音效
                end
                default: begin
                    led <= 8'b0;
                    sound <= 1'b0;
                end
            endcase
        end
    end

endmodule