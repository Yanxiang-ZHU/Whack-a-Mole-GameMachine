`timescale 1ns / 1ps

module GameTop_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg start;
    reg [3:0] row;
    reg [3:0] column;

    // Outputs
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
        .seg(seg),
        .select(select),
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
        column = 4'b0000;

        // Reset the system
        #1000000000;
        rst_n = 1;

        // Start the game
        #1000000000;
        start = 1;
        #1000000000;
        start = 0;

        // Simulate button presses using row and column
        #300000000;
        row = 4'b0001; column = 4'b0001; // Simulate button 0
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button
        #300000000;
        row = 4'b0001; column = 4'b0010; // Simulate button 1
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button
        #300000000;
        row = 4'b0001; column = 4'b0100; // Simulate button 2
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button
        #300000000;
        row = 4'b0001; column = 4'b1000; // Simulate button 3
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button
        #300000000;
        row = 4'b0010; column = 4'b0001; // Simulate button 4
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button
        #300000000;
        row = 4'b0010; column = 4'b0010; // Simulate button 5
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button
        #300000000;
        row = 4'b0010; column = 4'b0100; // Simulate button 6
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button
        #300000000;
        row = 4'b0010; column = 4'b1000; // Simulate button 7
        #200000000;
        row = 4'b0000; column = 4'b0000; // Release button

        // Wait for some time to observe the game behavior
        #5000; // Wait for 5 microseconds

        // End simulation
        $stop;
    end

endmodule