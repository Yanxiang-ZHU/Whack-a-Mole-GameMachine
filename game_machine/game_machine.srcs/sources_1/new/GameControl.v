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
    output reg [4:0] score // Changed to 5 bits to handle larger scores
    );

    parameter IDLE = 2'b00, PLAY = 2'b01, GEND = 2'b10;
    parameter ROUND1_TIME = 32'd60000000; // 6 seconds
    parameter ROUND2_TIME = 32'd40000000; // 4 seconds
    parameter ROUND3_TIME = 32'd20000000; // 2 seconds

    reg [31:0] timer;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            game_state <= IDLE;
            round <= 3'b000;
            score <= 5'b00000; // Reset score
            timer <= 32'b0;
            max_time <= ROUND1_TIME;
            target_led <= 8'b0;
        end else begin
            case (game_state)
                IDLE: begin
                    if (start) begin
                        game_state <= PLAY;
                        round <= 3'b001;
                        score <= 5'b00000; // Reset score
                        max_time <= ROUND1_TIME;
                        timer <= 32'b0;
                    end
                end
                PLAY: begin
                    timer <= timer + 1;
                    if (timer >= max_time) begin
                        timer <= 32'b0;
                        target_led <= 1 << (random_num % 8);
                    end

                    if (btn & target_led) begin
                        score <= score + (round == 3'b001 ? 5'd1 : (round == 3'b010 ? 5'd2 : 5'd3));
                        target_led <= 8'b0;
                        timer <= 32'b0;
                    end

                    if (round == 3'b001 && score >= 5'd8) begin
                        round <= 3'b010;
                        max_time <= ROUND2_TIME;
                    end else if (round == 3'b010 && score >= 5'd16) begin
                        round <= 3'b011;
                        max_time <= ROUND3_TIME;
                    end else if (round == 3'b011 && score >= 5'd24) begin
                        game_state <= GEND;
                    end
                end

                GEND: begin
                    if (start) begin
                        game_state <= IDLE;
                    end
                end
            endcase
        end
    end

endmodule