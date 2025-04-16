`timescale 1ns / 1ps

module GameTop(
    input clk,
    input rst_n,
    input start,              // Start button
    input [7:0] btn,          // 8 button inputs
    output [7:0] led,         // 8 LED outputs
    output [6:0] seg1,        // Tens place 7-segment display
    output [6:0] seg0,        // Ones place 7-segment display
    output buzzer,            // Buzzer output
    output [7:0] lcd_data,    // LCD data output
    output lcd_enable,        // LCD enable signal
    output lcd_rs,            // LCD register select signal
    output lcd_rw             // LCD read/write signal
    );

    wire [5:0] score;         // 6-bit score display
    wire [7:0] target_led;    // Current target LED
    wire [31:0] max_time;     // Maximum time for the current round
    wire [1:0] game_state;    // Game state
    wire [2:0] round;         // Current round
    wire [7:0] random_num;    // Random number
    wire false_press; 
    wire true_press;

    reg [5:0] max_score;      // 6-bit maximum score

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            max_score <= 6'b0; // Reset max score to 0
        end else if (game_state == 2'b10) begin // Assuming SOUNDEND indicates the end of a game
            if (score > max_score) begin
                max_score <= score; // Update max score if current score is higher
            end
        end
    end

    // Random number generator module
    RandomGen random_gen(
        .clk(clk),
        .rst_n(rst_n),
        .random_num(random_num)
    );

    // Game state control module
    GameControl game_control(
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .btn(btn),
        .random_num(random_num),
        .game_state(game_state),
        .round(round),
        .max_time(max_time),
        .target_led(target_led),
        .score(score),
        .false_press(false_press),
        .true_press(true_press)
    );

    // Lighting and sound effects module
    Effects effects(
        .clk(clk),
        .rst_n(rst_n),
        .game_state(game_state),
        .target_led(target_led),
        .led(led)
    );

    // Score display module
    ScoreDisplay score_display(
        .score(score),
        .seg1(seg1),
        .seg0(seg0)
    );

    // Sound player module
    SoundPlayer sound_player(
        .clk(clk),
        .rst_n(rst_n),
        .game_state(game_state),
        .false_press(false_press),
        .true_press(true_press),
        .buzzer(buzzer)
    );

    // TextLCD module
    TextLCD text_lcd(
        .clk(clk),
        .rst_n(rst_n),
        .max_score(max_score),
        .lcd_data(lcd_data),
        .lcd_enable(lcd_enable),
        .lcd_rs(lcd_rs),
        .lcd_rw(lcd_rw)
    );

endmodule