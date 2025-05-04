`timescale 1ns / 1ps

module ScoreDisplay(
    input [5:0] score,       // 6-bit score input (max value: 48)
    output reg [6:0] seg1,   // 7-segment display for tens place
    output reg [6:0] seg0    // 7-segment display for ones place
    );

    reg [3:0] tens;          // Tens place (4 bits to hold 0-9)
    reg [3:0] ones;          // Ones place (4 bits to hold 0-9)

    // Split score into tens and ones
    always @(*) begin
        tens = score / 10;
        ones = score % 10;
    end

    // 7-segment encoding
    always @(*) begin
        case (tens)
            4'd0: seg1 = 7'b0000001;
            4'd1: seg1 = 7'b1001111;
            4'd2: seg1 = 7'b0010010;
            4'd3: seg1 = 7'b0000110;
            4'd4: seg1 = 7'b1001100;
            4'd5: seg1 = 7'b0100100;
            4'd6: seg1 = 7'b0100000;
            4'd7: seg1 = 7'b0001111;
            4'd8: seg1 = 7'b0000000;
            4'd9: seg1 = 7'b0000100;
            default: seg1 = 7'b1111111; // Blank
        endcase

        case (ones)
            4'd0: seg0 = 7'b0000001;
            4'd1: seg0 = 7'b1001111;
            4'd2: seg0 = 7'b0010010;
            4'd3: seg0 = 7'b0000110;
            4'd4: seg0 = 7'b1001100;
            4'd5: seg0 = 7'b0100100;
            4'd6: seg0 = 7'b0100000;
            4'd7: seg0 = 7'b0001111;
            4'd8: seg0 = 7'b0000000;
            4'd9: seg0 = 7'b0000100;
            default: seg0 = 7'b1111111; // Blank
        endcase
    end

endmodule