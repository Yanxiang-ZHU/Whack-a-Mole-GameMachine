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
    parameter NOTE_WIDTH = 32;       // Width of each note (frequency or duration)
    parameter MAX_NOTES = 128;       // Maximum number of notes per music

    // Registers for music data
    reg [NOTE_WIDTH-1:0] music_idle [0:MAX_NOTES-1];    // Idle music
    reg [NOTE_WIDTH-1:0] music_false [0:MAX_NOTES-1];   // Dejected music
    reg [NOTE_WIDTH-1:0] music_true [0:MAX_NOTES-1];    // Happy music
    reg [NOTE_WIDTH-1:0] music_end [0:MAX_NOTES-1];     // End music

    // Internal registers
    reg [31:0] tone_counter;        // Counter for tone generation
    reg [31:0] duration_counter;    // Counter for note duration
    reg [7:0] note_index;           // Current note index
    reg [31:0] current_tone;        // Current tone frequency
    reg [31:0] current_duration;    // Current note duration
    reg playing;                    // Music playing flag

    // Load music data from external files
    initial begin
        $readmemh("music_idle.mem", music_idle);       // Load idle music
        $readmemh("music_false.mem", music_false);    // Load dejected music
        $readmemh("music_true.mem", music_true);      // Load happy music
        $readmemh("music_end.mem", music_end);        // Load end music
    end

    // Music playback logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tone_counter <= 32'b0;
            duration_counter <= 32'b0;
            note_index <= 8'b0;
            current_tone <= 32'b0;
            current_duration <= 32'b0;
            buzzer <= 1'b0;
            playing <= 1'b0;
        end else begin
            // Handle music playback
            if (duration_counter >= current_duration || !playing) begin
                // Select new music based on game_state and control signals
                case (game_state)
                    IDLE: begin
                        current_tone <= music_idle[note_index * 2];
                        current_duration <= music_idle[note_index * 2 + 1];
                    end
                    PLAY: begin
                        if (false) begin
                            current_tone <= music_false[note_index * 2];
                            current_duration <= music_false[note_index * 2 + 1];
                        end else if (true) begin
                            current_tone <= music_true[note_index * 2];
                            current_duration <= music_true[note_index * 2 + 1];
                        end
                    end
                    SOUNDEND: begin
                        current_tone <= music_end[note_index * 2];
                        current_duration <= music_end[note_index * 2 + 1];
                    end
                    default: begin
                        current_tone <= music_idle[note_index * 2];
                        current_duration <= music_idle[note_index * 2 + 1];
                    end
                endcase

                // Reset counters and move to the next note
                duration_counter <= 32'b0;
                note_index <= (note_index + 1) % MAX_NOTES;
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