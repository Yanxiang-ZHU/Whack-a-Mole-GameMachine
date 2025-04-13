`timescale 1ns / 1ps

module GameTop_tb;

    // Inputs
    reg clk;
    reg rst;
    reg start;
    reg [7:0] btn;

    // Outputs
    wire [7:0] led;
    wire [2:0] score;
    wire sound;

    // Instantiate the Unit Under Test (UUT)
    GameTop uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .btn(btn),
        .led(led),
        .score(score),
        .sound(sound)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period (100 MHz)
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        start = 0;
        btn = 8'b0;

        // Reset the system
        #20;
        rst = 0;

        // Start the game
        #20;
        start = 1;
        #10;
        start = 0;

        // Simulate button presses
        #100;
        btn = 8'b00000001; // Press button 0
        #20;
        btn = 8'b00000000; // Release button

        #100;
        btn = 8'b00000010; // Press button 1
        #20;
        btn = 8'b00000000; // Release button

        // Wait for some time to observe the game behavior
        #500;

        // End simulation
        $stop;
    end

endmodule