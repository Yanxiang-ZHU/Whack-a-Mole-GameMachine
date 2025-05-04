`timescale 1ns / 1ps

module GameTop(
    input clk,
    input rst_n,
    input start,              // Start button
    input [3:0] row,          // 4 rows for key matrix
    input [3:0] column,       // 4 columns for key matrix
    output [7:0] led,         // 8 LED outputs
    output [7:0] seg,         // 7-segment display segments
    output [5:0] select,      // Select signal for 7-segment display
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

    wire buzzer_n;         // Buzzer signal (active low)
    assign buzzer = ~buzzer_n; // Invert the buzzer signal for active high

    // Button matrix logic
    always @(*) begin
        if (row[0] == 1'b0) begin
            if (column[0] == 1'b0) begin
                btn = 8'b00000001; // Button 1 pressed
            end else if (column[1] == 1'b0) begin
                btn = 8'b00000010; // Button 2 pressed
            end else if (column[2] == 1'b0) begin
                btn = 8'b00000100; // Button 3 pressed
            end else if (column[3] == 1'b0) begin
                btn = 8'b00001000; // Button 4 pressed
            end
        end else if (row[1] == 1'b0) begin
            if (column[0] == 1'b0) begin
                btn = 8'b00010000; // Button 5 pressed
            end else if (column[1] == 1'b0) begin
                btn = 8'b00100000; // Button 6 pressed
            end else if (column[2] == 1'b0) begin
                btn = 8'b01000000; // Button 7 pressed
            end else if (column[3] == 1'b0) begin
                btn = 8'b10000000; // Button 8 pressed
            end
        end else 
            btn = 8'b00000000; // No button pressed
    end

    // 7-segment display logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            refresh_counter <= 16'b0;
            select_reg <= 6'b111110;
        end else begin
            refresh_counter <= refresh_counter + 1;
            if (refresh_counter == 16'd50000) begin
                refresh_counter <= 16'b0;
                if (select_reg == 6'b111110) begin
                    select_reg <= 6'b111101;
                end else if (select_reg == 6'b111101) begin
                    select_reg <= 6'b111011;
                end else if (select_reg == 6'b111011) begin
                    select_reg <= 6'b111110;
                end
            end
        end
    end

    always @(*) begin
        case (select_reg)
            6'b111110: seg_reg = {seg0, 1'b1}; // Display seg0
            6'b111101: seg_reg = {seg1, 1'b1}; // Display seg1
            6'b111011: seg_reg = {row, column};
            default: seg_reg = 8'b11111111; // Default off
        endcase
    end

    assign select = select_reg;
    assign seg = seg_reg;

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
        .buzzer(buzzer_n)
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