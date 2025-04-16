module TextLCD(
    input clk,                  // Clock signal
    input rst_n,                // Reset signal
    input [5:0] max_score,      // Maximum score to display
    output reg [7:0] lcd_data,  // LCD data output
    output reg lcd_enable,      // LCD enable signal
    output reg lcd_rs,          // LCD register select (0 = command, 1 = data)
    output reg lcd_rw           // LCD read/write (0 = write, 1 = read)
);

    // Internal states for LCD control
    reg [3:0] state;
    reg [7:0] char_data [0:15]; // Buffer for "Max Score: xxx"
    reg [3:0] char_index;

    // Initialize the message
    initial begin
        char_data[0]  = "M";
        char_data[1]  = "a";
        char_data[2]  = "x";
        char_data[3]  = " ";
        char_data[4]  = "S";
        char_data[5]  = "c";
        char_data[6]  = "o";
        char_data[7]  = "r";
        char_data[8]  = "e";
        char_data[9]  = ":";
        char_data[10] = " "; // Space
        char_data[11] = "0"; // Placeholder for hundreds digit
        char_data[12] = "0"; // Placeholder for tens digit
        char_data[13] = "0"; // Placeholder for ones digit
        char_data[14] = " "; // Padding
        char_data[15] = " "; // Padding
    end

    // Update the score digits
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            char_data[11] <= "0";
            char_data[12] <= "0";
            char_data[13] <= "0";
        end else begin
            char_data[11] <= "0" + (max_score / 100);       // Hundreds digit
            char_data[12] <= "0" + ((max_score / 10) % 10); // Tens digit
            char_data[13] <= "0" + (max_score % 10);        // Ones digit
        end
    end

    // LCD control logic (simplified for demonstration)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= 4'b0;
            char_index <= 4'b0;
            lcd_enable <= 1'b0;
            lcd_rs <= 1'b0;
            lcd_rw <= 1'b0;
            lcd_data <= 8'b0;
        end else begin
            case (state)
                4'b0000: begin
                    lcd_rs <= 1'b0; // Command mode
                    lcd_rw <= 1'b0; // Write mode
                    lcd_data <= 8'b0011_1000; // Function set
                    lcd_enable <= 1'b1;
                    state <= 4'b0001;
                end
                4'b0001: begin
                    lcd_enable <= 1'b0;
                    state <= 4'b0010;
                end
                4'b0010: begin
                    lcd_rs <= 1'b1; // Data mode
                    lcd_data <= char_data[char_index];
                    lcd_enable <= 1'b1;
                    state <= 4'b0011;
                end
                4'b0011: begin
                    lcd_enable <= 1'b0;
                    if (char_index < 15) begin
                        char_index <= char_index + 1;
                        state <= 4'b0010;
                    end else begin
                        state <= 4'b0000; // Restart
                    end
                end
            endcase
        end
    end

endmodule