`timescale 1ns / 1ps

module SoundPlayer(
    input clk,                // Clock signal (10 MHz)
    input rst_n,              // Reset signal
    input [1:0] game_state,   // Game state
    input false,              // False signal
    input true,               // True signal
    output reg buzzer         // Buzzer output
    );

    // Parameters
    parameter IDLE = 2'b00, PLAY = 2'b01, SOUNDEND = 2'b10;
    parameter NOTE_DURATION = 32'd10000000; // Fixed duration for each note (1 second at 10 MHz)

    // Internal registers
    reg [31:0] tone_counter;        // Counter for tone generation
    reg [31:0] duration_counter;    // Counter for note duration
    reg [7:0] note_index;           // Current note index
    reg [31:0] current_tone;        // Current tone frequency
    reg playing;                    // Music playing flag

    wire [31:0] music_idle_tone;
    wire [31:0] music_true_tone;
    wire [31:0] music_false_tone;
    wire [31:0] music_end_tone;

    MusicIdle music_idle(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_idle_tone)
    );
    MusicTrue music_true(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_true_tone)
    );
    MusicFalse music_false(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_false_tone)
    );
    MusicEnd music_end(
        .wea(0),
        .dina(0),
        .clka(clk),
        .addra(note_index),
        .douta(music_end_tone)
    );

    // Music playback logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tone_counter <= 32'b0;
            duration_counter <= 32'b0;
            note_index <= 8'b0;
            current_tone <= 32'b0;
            buzzer <= 1'b0;
            playing <= 1'b0;
        end else begin
            // Handle music playback
            if (duration_counter >= NOTE_DURATION || !playing) begin
                // Select new music based on game_state and control signals
                case (game_state)
                    IDLE: begin
                        current_tone <= music_idle_tone;
                    end
                    PLAY: begin
                        if (false) begin
                            current_tone <= music_false_tone;
                        end else if (true) begin
                            current_tone <= music_true_tone;
                        end
                    end
                    SOUNDEND: begin
                        current_tone <= music_end_tone;
                    end
                    default: begin
                        current_tone <= music_idle_tone;
                    end
                endcase

                // Reset counters and move to the next note
                duration_counter <= 32'b0;
                note_index <= (note_index + 1) % 256; // Assuming each IP core has 256 entries
                playing <= 1'b1;
            end else begin
                duration_counter <= duration_counter + 1;
            end

            // Generate PWM signal for the current tone
            if (tone_counter >= current_tone) begin
                tone_counter <= 32'b0;
                buzzer <= ~buzzer; // Toggle buzzer signal
            end else begin
                tone_counter <= tone_counter + 1;
            end
        end
    end

endmodule