`timescale 1ns / 1ps

module SoundPlayer(
    input clk,                // 50 MHz Clock
    input rst_n,              // Active-low Reset
    input [1:0] game_state,   // Game state: IDLE=0, PLAY=1, SOUNDEND=2
    input false_press,
    input true_press,
    output reg buzzer         // Output to passive buzzer
);

    // Game state encoding
    parameter IDLE = 2'b00;
    parameter PLAY = 2'b01;
    parameter SOUNDEND = 2'b10;

    // Frequency table (indexes to define musical notes)
    localparam [2:0] IDLE_SEQ0 = 3'd2;
    localparam [2:0] IDLE_SEQ1 = 3'd3;
    localparam [2:0] IDLE_SEQ2 = 3'd4;

    localparam [2:0] FALSE_SEQ0 = 3'd1;
    localparam [2:0] FALSE_SEQ1 = 3'd0;

    localparam [2:0] TRUE_SEQ0 = 3'd3;
    localparam [2:0] TRUE_SEQ1 = 3'd4;
    localparam [2:0] TRUE_SEQ2 = 3'd5;

    localparam [2:0] END_SEQ0 = 3'd3;
    localparam [2:0] END_SEQ1 = 3'd2;
    localparam [2:0] END_SEQ2 = 3'd1;

    // Frequencies in Hz (standard musical tones)
    localparam [31:0] FREQ_C5  = 32'd523;  // C5
    localparam [31:0] FREQ_D5  = 32'd587;  // D5
    localparam [31:0] FREQ_E5  = 32'd659;  // E5
    localparam [31:0] FREQ_F5  = 32'd698;  // F5
    localparam [31:0] FREQ_G5  = 32'd784;  // G5
    localparam [31:0] FREQ_A5  = 32'd880;  // A5
    localparam [31:0] FREQ_B5  = 32'd988;  // B5
    localparam [31:0] FREQ_C6  = 32'd1046; // C6

    reg [2:0] sequence [0:2];
    reg [1:0] seq_length;
    reg [1:0] seq_index;
    reg [31:0] tone_counter;
    reg [31:0] tone_half_period;
    reg [31:0] tone_duration_counter;
    reg playing;

    reg [1:0] prev_game_state;
    reg prev_false_press;
    reg prev_true_press;

    // Tone duration per note: 0.5 second at 50MHz
    localparam [31:0] NOTE_DURATION = 32'd25000000;

    // Detect trigger
    wire trigger = (game_state != prev_game_state) ||
                   (false_press && !prev_false_press) ||
                   (true_press && !prev_true_press);

    // Function to map sequence index to frequency
    function [31:0] get_freq;
        input [2:0] seq_val;
        begin
            case (seq_val)
                3'd0: get_freq = FREQ_C5;
                3'd1: get_freq = FREQ_D5;
                3'd2: get_freq = FREQ_E5;
                3'd3: get_freq = FREQ_F5;
                3'd4: get_freq = FREQ_G5;
                3'd5: get_freq = FREQ_A5;
                3'd6: get_freq = FREQ_B5;
                3'd7: get_freq = FREQ_C6;
                default: get_freq = FREQ_C5;
            endcase
        end
    endfunction

    // Buzzer tone generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            buzzer <= 0;
            tone_counter <= 0;
            tone_half_period <= 0;
            tone_duration_counter <= 0;
            seq_index <= 0;
            playing <= 0;
            prev_game_state <= IDLE;
            prev_false_press <= 0;
            prev_true_press <= 0;
        end else begin
            prev_game_state <= game_state;
            prev_false_press <= false_press;
            prev_true_press <= true_press;

            if (trigger) begin
                seq_index <= 0;
                playing <= 1;
                tone_duration_counter <= 0;
                case (game_state)
                    IDLE: begin
                        sequence[0] <= IDLE_SEQ0;
                        sequence[1] <= IDLE_SEQ1;
                        sequence[2] <= IDLE_SEQ2;
                        seq_length <= 3;
                    end
                    PLAY: begin
                        if (false_press) begin
                            sequence[0] <= FALSE_SEQ0;
                            sequence[1] <= FALSE_SEQ1;
                            sequence[2] <= 0;
                            seq_length <= 2;
                        end else if (true_press) begin
                            sequence[0] <= TRUE_SEQ0;
                            sequence[1] <= TRUE_SEQ1;
                            sequence[2] <= TRUE_SEQ2;
                            seq_length <= 3;
                        end else begin
                            seq_length <= 0;
                        end
                    end
                    SOUNDEND: begin
                        sequence[0] <= END_SEQ0;
                        sequence[1] <= END_SEQ1;
                        sequence[2] <= END_SEQ2;
                        seq_length <= 3;
                    end
                    default: seq_length <= 0;
                endcase

                if (seq_length > 0)
                    tone_half_period <= 25000000 / (get_freq(sequence[0]) * 2);
            end

            if (playing && seq_length > 0) begin
                // Toggle buzzer
                if (tone_counter >= tone_half_period) begin
                    buzzer <= ~buzzer;
                    tone_counter <= 0;
                end else begin
                    tone_counter <= tone_counter + 1;
                end

                // Advance to next note
                if (tone_duration_counter >= NOTE_DURATION) begin
                    tone_duration_counter <= 0;
                    seq_index <= seq_index + 1;
                    if (seq_index < seq_length) begin
                        tone_half_period <= 25000000 / (get_freq(sequence[seq_index]) * 2);
                    end else begin
                        playing <= 0;
                        buzzer <= 0;
                    end
                end else begin
                    tone_duration_counter <= tone_duration_counter + 1;
                end
            end else begin
                buzzer <= 0;
            end
        end
    end

endmodule