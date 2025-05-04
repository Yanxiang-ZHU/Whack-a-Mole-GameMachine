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
    parameter NOTE_DURATION = 32'd1135; // 50 MHz / 44.1 kHz
    parameter SAMPLE_LENGTH = 17'd120000;

    // Internal registers
    reg [31:0] duration_counter;
    reg [16:0] note_index;
    reg [15:0] pwm_counter;
    reg [15:0] current_sample;
    reg playing;
    reg [1:0] prev_game_state;  
    reg prev_false_press;  
    reg prev_true_press;

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
            current_sample <= 16'h8000;
            pwm_counter <= 16'b0;
            buzzer <= 1'b0;
            playing <= 1'b0;
            prev_game_state <= IDLE;
            prev_false_press <= 0;
            prev_true_press <= 0;
        end else begin
            if (game_state != prev_game_state || 
                false_press != prev_false_press || 
                true_press != prev_true_press) begin
                note_index <= 17'b0;
                playing <= 1'b1;
            end
            
            prev_game_state <= game_state;
            prev_false_press <= false_press;
            prev_true_press <= true_press;

            // Handle music playback
            if (duration_counter >= NOTE_DURATION && playing) begin
                // Select new music based on game_state and control signals
                case (game_state)
                    IDLE: current_sample <= music_idle_sample;
                    PLAY: begin
                        if (false_press) current_sample <= music_false_sample;
                        else if (true_press) current_sample <= music_true_sample;
                        else current_sample <= 16'h8000;
                    end
                    SOUNDEND: current_sample <= music_end_sample;
                    default: current_sample <= music_idle_sample;
                endcase

                // Reset counter and move to the next note
                duration_counter <= 32'b0;
                if (note_index == SAMPLE_LENGTH - 1) begin
                    playing <= 1'b0;
                    note_index <= 17'b0;
                end else begin
                    note_index <= note_index + 1;
                end
            end else begin
                duration_counter <= duration_counter + 1;
            end

            // Generate PWM signal
            pwm_counter <= pwm_counter + 1;
            buzzer <= (pwm_counter < current_sample[15:8]) ? 1'b1 : 1'b0;
        end
    end

endmodule