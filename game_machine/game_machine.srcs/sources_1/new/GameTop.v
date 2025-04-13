`timescale 1ns / 1ps

module GameTop(
    input clk,
    input rst,
    input start,              // Start button
    input [7:0] btn,          // 8 button inputs
    output [7:0] led,         // 8 LED outputs
    output [2:0] score,       // 3-bit score display
    output sound              // Sound output
    );

    wire [7:0] target_led;    // Current target LED
    wire [31:0] max_time;     // Maximum time for the current round
    wire [1:0] game_state;    // Game state
    wire [2:0] round;         // Current round
    wire [7:0] random_num;    // Random number

    // Random number generator module
    RandomGen random_gen(
        .clk(clk),
        .rst(rst),
        .random_num(random_num)
    );

    // Game state control module
    GameControl game_control(
        .clk(clk),
        .rst(rst),
        .start(start),
        .btn(btn),
        .random_num(random_num),
        .game_state(game_state),
        .round(round),
        .max_time(max_time),
        .target_led(target_led),
        .score(score)
    );

    // Lighting and sound effects module
    Effects effects(
        .clk(clk),
        .rst(rst),
        .game_state(game_state),
        .target_led(target_led),
        .led(led),
        .sound(sound)
    );

endmodule
