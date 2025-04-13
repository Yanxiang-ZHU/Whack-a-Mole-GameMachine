`timescale 1ns / 1ps

module GameControl(
    input clk,
    input rst,
    input start,
    input [7:0] btn,
    input [7:0] random_num,
    output reg [1:0] game_state,
    output reg [2:0] round,
    output reg [31:0] max_time,
    output reg [7:0] target_led,
    output reg [2:0] score
    );

    // 参数定义
    parameter IDLE = 2'b00, PLAY = 2'b01, END = 2'b10;
    parameter ROUND1_TIME = 32'd60000000; // 6秒
    parameter ROUND2_TIME = 32'd40000000; // 4秒
    parameter ROUND3_TIME = 32'd20000000; // 2秒

    reg [31:0] timer;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            game_state <= IDLE;
            round <= 3'b0;
            score <= 3'b0;
            timer <= 32'b0;
            max_time <= ROUND1_TIME;
            target_led <= 8'b0;
        end else begin
            case (game_state)
                IDLE: begin
                    if (start) begin
                        game_state <= PLAY;
                        round <= 3'b1;
                        score <= 3'b0;
                        max_time <= ROUND1_TIME;
                        timer <= 32'b0;
                    end
                end
                PLAY: begin
                    timer <= timer + 1;
                    if (timer >= max_time) begin
                        timer <= 32'b0;
                        target_led <= 1 << (random_num % 8); // 随机点亮一个 LED
                    end

                    if (btn & target_led) begin
                        score <= score + (round == 3'b1 ? 3'b001 : (round == 3'b2 ? 3'b010 : 3'b011));
                        target_led <= 8'b0;
                        timer <= 32'b0;
                    end

                    if (round == 3'b1 && score >= 3'd8) begin
                        round <= 3'b2;
                        max_time <= ROUND2_TIME;
                    end else if (round == 3'b2 && score >= 3'd16) begin
                        round <= 3'b3;
                        max_time <= ROUND3_TIME;
                    end else if (round == 3'b3 && score >= 3'd24) begin
                        game_state <= END;
                    end
                end
                END: begin
                    if (start) begin
                        game_state <= IDLE;
                    end
                end
            endcase
        end
    end

endmodule