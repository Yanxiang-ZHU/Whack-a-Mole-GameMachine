`timescale 1ns / 1ps

module GameTop_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg start;
    reg [7:0] btn;

    // Outputs
    wire [7:0] led;
    wire [6:0] seg1;
    wire [6:0] seg0;
    wire buzzer;

    // Instantiate the Unit Under Test (UUT)
    GameTop uut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .btn(btn),
        .led(led),
        .seg1(seg1),
        .seg0(seg0),
        .buzzer(buzzer)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #50 clk = ~clk; // 100ns clock period (10 MHz)
    end

    integer i;
    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        start = 0;
        btn = 8'b0;

        // Reset the system
        #200000000; // Wait for 0.2 seconds, switch the rst_n button
        rst_n = 1;

        // Start the game
        #200000000; // Wait for 0.2 seconds
        start = 1;
        #100000000; // hold start button for 1 second
        start = 0;

        // Simulate button presses
        for (i = 0; i < 24; i = i + 1) begin
            #300000000;
        btn = 8'b00000001; // Press button 0
            #200000000;
        btn = 8'b00000000; // Release button
            #300000000;
        btn = 8'b00000010; // Press button 1
            #200000000;
            btn = 8'b00000000; // Release button
            #300000000;
            btn = 8'b00000100; // Press button 2
            #200000000;
            btn = 8'b00000000; // Release button
            #300000000;
            btn = 8'b00001000; // Press button 3
            #200000000;
            btn = 8'b00000000; // Release button
            #300000000;
            btn = 8'b00010000; // Press button 4
            #200000000;
            btn = 8'b00000000; // Release button
            #300000000;
            btn = 8'b00100000; // Press button 5
            #200000000;
            btn = 8'b00000000; // Release button
            #300000000;
            btn = 8'b01000000; // Press button 6
            #200000000;
            btn = 8'b00000000; // Release button
            #300000000;
            btn = 8'b10000000; // Press button 7
            #200000000;
        btn = 8'b00000000; // Release button
        end

        // Wait for some time to observe the game behavior
        #5000000000; // Wait for 5 seconds

        // End simulation
        $stop;
    end

endmodule