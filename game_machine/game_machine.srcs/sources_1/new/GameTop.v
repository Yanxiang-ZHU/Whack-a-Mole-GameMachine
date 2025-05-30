`timescale 1ns / 1ps

module GameTop(
    input clk,
    input rst_n,
    input start,              // Start button
    input [3:0] row,          // 4 rows for key matrix
    output [3:0] column,      // 4 columns for key matrix
    output [7:0] led,         // 8 LED outputs
    output [7:0] seg_led,         // 7-segment display segments
    output [5:0] sel,      // Select signal for 7-segment display
    output buzzer,            // Buzzer output
    output [7:0] lcd_data,    // LCD data output
    output lcd_enable,        // LCD enable signal
    output lcd_rs,            // LCD register select signal
    output lcd_rw             // LCD read/write signal
    );

    // Internal signals
    wire [5:0] score;         // 6-bit score display
    wire [7:0] target_led;    // Current target LED
    wire [31:0] max_time;     // Maximum time for the current round
    wire [1:0] game_state;    // Game state
    wire [2:0] round;         // Current round
    wire [7:0] random_num;    // Random number
    wire false_press; 
    wire true_press;

    reg [5:0] max_score;      // 6-bit maximum score
    reg [7:0] btn;            // 8 button inputs generated from row and column
    reg [5:0] select_reg;     // Register for select signal
    reg [7:0] seg_reg;        // Register for segment signal
    reg [15:0] refresh_counter; // Counter for refreshing 7-segment display

    wire [3:0] key_val;
    wire key_val_vld;
    KeyPress KeyPress_u (
        .sclk(clk),
        .s_rst_n(rst_n),
        .row(row),
        .col(column),
        .key_val(key_val),
        .key_val_vld(key_val_vld)
    );

    always @(*) begin
        case (key_val)
            4'd0: btn = 8'b00000001; // Button 1 pressed
            4'd1: btn = 8'b00000010; // Button 2 pressed
            4'd2: btn = 8'b00000100; // Button 3 pressed
            4'd3: btn = 8'b00001000; // Button 4 pressed
            4'd4: btn = 8'b00010000; // Button 5 pressed
            4'd5: btn = 8'b00100000; // Button 6 pressed
            4'd6: btn = 8'b01000000; // Button 7 pressed
            4'd7: btn = 8'b10000000; // Button 8 pressed
            default: btn = 8'b00000000; // No button pressed
        endcase
    end

    // Max score logic
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
        .sclk(clk),
        .s_rst_n(rst_n),
        .score(score),
        .sel(sel),
        .seg_led(seg_led)
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


    ila_0 ila_0_inst0 (
    .clk(clk),
    .probe0(row),
    .probe1(key_val),
    .probe2(btn),
    .probe3(key_val_vld)
    );

endmodule