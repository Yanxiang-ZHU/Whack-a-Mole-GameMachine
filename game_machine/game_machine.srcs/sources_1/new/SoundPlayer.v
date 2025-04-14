`timescale 1ns / 1ps

module SoundPlayer(
    input clk,                // Clock signal (10 MHz)
    input rst_n,              // Reset signal
    input [1:0] game_state,   // Game state
    input false_press,        // False signal
    input true_press,         // True signal
    output reg buzzer         // Buzzer output (1-bit)
);

    // Parameters
    parameter IDLE = 2'b00, PLAY = 2'b01, SOUNDEND = 2'b10;
    parameter NOTE_DURATION = 32'd227; // 10 MHz / 44.1 kHz ≈ 227 cycles per sample

    // Internal registers
    reg [31:0] duration_counter;    // Counter for note duration
    reg [16:0] note_index;          // Current note index
    reg [15:0] pwm_counter;         // Counter for PWM generation
    reg [15:0] current_sample;      // Current audio sample (16-bit amplitude)
    reg playing;                    // Music playing flag

    // Wires for music data output from IP cores
    wire [15:0] music_idle_sample;
    wire [15:0] music_true_sample;
    wire [15:0] music_false_sample;
    wire [15:0] music_end_sample;

    // Instantiate MusicIdle IP core
    MusicIdle music_idle(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_idle_sample) // Output is the audio sample (16-bit amplitude)
    );

    // Instantiate MusicTrue IP core
    MusicTrue music_true(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_true_sample)
    );

    // Instantiate MusicFalse IP core
    MusicFalse music_false(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_false_sample)
    );

    // Instantiate MusicEnd IP core
    MusicEnd music_end(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_end_sample)
    );

    // Music playback and PWM logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            duration_counter <= 32'b0;
            note_index <= 17'b0;
            current_sample <= 16'h8000; // Silent (zero amplitude)
            pwm_counter <= 16'b0;
            buzzer <= 1'b0;
            playing <= 1'b0;
        end else begin
            // Handle music playback
            if (duration_counter >= NOTE_DURATION || !playing) begin
                // Select new music based on game_state and control signals
                case (game_state)
                    IDLE: begin
                        current_sample <= music_idle_sample;
                    end
                    PLAY: begin
                        if (false_press) begin
                            current_sample <= music_false_sample;
                        end else if (true_press) begin
                            current_sample <= music_true_sample;
                        end else begin
                            current_sample <= 16'h8000; // Silent if no press
                        end
                    end
                    SOUNDEND: begin
                        current_sample <= music_end_sample;
                    end
                    default: begin
                        current_sample <= music_idle_sample;
                    end
                endcase

                // Reset counters and move to the next note
                duration_counter <= 32'b0;
                note_index <= (note_index + 1) % 80000; // Each IP core has 80000 entries
                playing <= 1'b1;
            end else begin
                duration_counter <= duration_counter + 1;
            end

            // Generate PWM signal
            pwm_counter <= pwm_counter + 1;
            buzzer <= (pwm_counter < current_sample) ? 1'b1 : 1'b0;
        end
    end

endmodule