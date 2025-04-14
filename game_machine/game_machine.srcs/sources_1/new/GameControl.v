`timescale 1ns / 1ps

module GameControl(
    input clk,
    input rst_n,
    input start,
    input [7:0] btn,
    input [7:0] random_num,
    output reg [1:0] game_state,
    output reg [2:0] round,
    output reg [47:0] max_time,
    output reg [7:0] target_led,
    output reg [5:0] score,
    output reg false,
    output reg true
    );

    parameter IDLE = 2'b00, PLAY = 2'b01, GEND = 2'b10;
    // FPGA 10MHz
    parameter ROUND1_TIME = 48'd60000000; // 6 seconds
    parameter ROUND2_TIME = 48'd40000000; // 4 seconds
    parameter ROUND3_TIME = 48'd20000000; // 2 seconds

    reg [47:0] timer;
    reg [3:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            game_state <= IDLE;
            round <= 3'b000;
            score <= 6'b000000; // Reset score
            timer <= 48'b0;
            max_time <= ROUND1_TIME;
            target_led <= 8'b0;
            count <= 4'b0;
            false <= 0;
            true <= 0;
        end else begin
            case (game_state)
                IDLE: begin
                    if (start) begin
                        game_state <= PLAY;
                        round <= 3'b001;
                        score <= 6'b000000; // Reset score
                        max_time <= ROUND1_TIME;
                        timer <= 32'b0;
                        count <= 4'b0;
                        target_led <= 1 << (random_num % 8);
                        false <= 0;
                        true <= 0;
                    end
                end
                PLAY: begin
                    timer <= timer + 1;
                    if (true || false) begin
                        true <= 0;
                        false <= 0;
                    end
                    
                    if (timer >= max_time) begin
                        timer <= 32'b0;
                        target_led <= 1 << (random_num % 8);
                        count <= count + 1;
                    end else if (btn == target_led) begin
                        score <= score + (round == 3'b001 ? 6'd1 : (round == 3'b010 ? 6'd2 : 6'd3));
                        target_led <= 1 << (random_num % 8);
                        timer <= 32'b0;
                        count <= count + 1;
                        true <= 1;
                    end else if ((btn != 8'b0) && (btn != target_led)) begin
                        false <= 1;
                    end

                    if (round == 3'b001 && count == 8) begin
                        round <= 3'b010;
                        count <= 0;
                        max_time <= ROUND2_TIME;
                    end else if (round == 3'b010 && count == 8) begin
                        round <= 3'b011;
                        count <= 0;
                        max_time <= ROUND3_TIME;
                    end else if (round == 3'b011 && count == 8) begin
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