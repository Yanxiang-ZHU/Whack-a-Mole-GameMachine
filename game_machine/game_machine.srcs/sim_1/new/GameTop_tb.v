`timescale 1ns / 1ps

module GameTop_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg start;
    reg [3:0] row; 

    // Outputs
    wire [3:0] column;
    wire [7:0] led;
    wire [6:0] seg;
    wire [5:0] select;
    wire buzzer;
    wire [7:0] lcd_data;
    wire lcd_enable;
    wire lcd_rs;
    wire lcd_rw;

    // Instantiate the Unit Under Test (UUT)
    GameTop uut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .row(row),
        .column(column),
        .led(led),
        .seg_led(seg),
        .sel(select),
        .buzzer(buzzer),
        .lcd_data(lcd_data),
        .lcd_enable(lcd_enable),
        .lcd_rs(lcd_rs),
        .lcd_rw(lcd_rw)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #50 clk = ~clk; // 100ns clock period (10 MHz)
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        start = 0;
        row = 4'b0000;
        #500000000;
        // Reset the system
        rst_n = 1;
        row = 4'b1111;

        // Start the game
        #500000000;
        start = 1;
        #500000000;
        start = 0;

        // Simulate button presses using row and column
        #300000000;
        if (column == 4'b1110) begin
            row = 4'b1110; // Simulate button 0
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        #300000000;
        if (column == 4'b1101) begin
            row = 4'b1110; // Simulate button 1
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        #300000000;
        if (column == 4'b1011) begin
            row = 4'b1110; // Simulate button 2
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        #300000000;
        if (column == 4'b0111) begin
            row = 4'b1110; // Simulate button 3
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        #300000000;
        if (column == 4'b1110) begin
            row = 4'b1101; // Simulate button 4
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        #300000000;
        if (column == 4'b1101) begin
            row = 4'b1101; // Simulate button 5
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        #300000000;
        if (column == 4'b1011) begin
            row = 4'b1101; // Simulate button 6
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        #300000000;
        if (column == 4'b0111) begin
            row = 4'b1101; // Simulate button 7
        end else begin
            row = 4'b1111;
        end
        #200000000;
        row = 4'b1111;

        // Wait to observe
        #5000;

        $stop;
    end

endmodule
