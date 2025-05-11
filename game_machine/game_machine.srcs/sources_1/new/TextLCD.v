module TextLCD (
    input wire clk,             // 50MHz clock
    input wire rst_n,           // Active low reset
    input wire [7:0] max_score, // 0–255 max score
    output reg [7:0] lcd_data,
    output reg lcd_enable,
    output reg lcd_rs,
    output wire lcd_rw          // always 0: write mode
);

assign lcd_rw = 1'b0;

reg [19:0] clk_div;
wire slow_clk = clk_div[19];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        clk_div <= 0;
    else
        clk_div <= clk_div + 1;
end

reg [7:0] char_buffer [0:31];
reg [4:0] char_index;
reg [3:0] state;
reg [7:0] score_bcd [2:0];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        char_buffer[0]  <= "M";
        char_buffer[1]  <= "a";
        char_buffer[2]  <= "x";
        char_buffer[3]  <= " ";
        char_buffer[4]  <= "S";
        char_buffer[5]  <= "c";
        char_buffer[6]  <= "o";
        char_buffer[7]  <= "r";
        char_buffer[8]  <= "e";
        char_buffer[9]  <= ":";
        char_buffer[10] <= " ";
        char_buffer[11] <= "0";
        char_buffer[12] <= "0";
        char_buffer[13] <= "0";
        char_buffer[14] <= " ";
        char_buffer[15] <= " ";
        char_buffer[16] <= " ";
        char_buffer[17] <= " ";
        char_buffer[18] <= " ";
        char_buffer[19] <= " ";
        char_buffer[20] <= " ";
        char_buffer[21] <= " ";
        char_buffer[22] <= " ";
        char_buffer[23] <= " ";
        char_buffer[24] <= "A";
        char_buffer[25] <= "S";
        char_buffer[26] <= "I";
        char_buffer[27] <= "C";
        char_buffer[28] <= "2";
        char_buffer[29] <= "0";
        char_buffer[30] <= "2";
        char_buffer[31] <= "5";
    end else begin
        score_bcd[0] <= "0" + (max_score / 100);
        score_bcd[1] <= "0" + ((max_score / 10) % 10);
        score_bcd[2] <= "0" + (max_score % 10);

        char_buffer[11] <= score_bcd[0];
        char_buffer[12] <= score_bcd[1];
        char_buffer[13] <= score_bcd[2];
    end
end

localparam WAIT_POWER_ON = 4'd0,
           INIT_0  = 4'd1,
           INIT_1  = 4'd2,
           INIT_2  = 4'd3,
           INIT_3  = 4'd4,
           INIT_4  = 4'd5,
           IDLE    = 4'd6,
           WRITE   = 4'd7,
           DELAY   = 4'd8;

reg [7:0] command;
reg [3:0] delay_flag;
reg [15:0] delay_cnt;
reg [1:0] enable_phase;
reg [19:0] power_on_cnt;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= WAIT_POWER_ON;
        lcd_enable <= 0;
        lcd_rs <= 0;
        lcd_data <= 8'h00;
        char_index <= 0;
        delay_cnt <= 0;
        delay_flag <= 0;
        enable_phase <= 0;
        power_on_cnt <= 0;
    end else begin
        case (state)
            WAIT_POWER_ON: begin
                if (power_on_cnt < 20'd750_000)
                    power_on_cnt <= power_on_cnt + 1;
                else
                    state <= INIT_0;
            end
            INIT_0: begin
                lcd_rs <= 0;
                lcd_data <= 8'h38; // Function set: 2 lines, 5x8 font
                state <= DELAY;
                delay_flag <= INIT_1;
            end
            INIT_1: begin
                lcd_rs <= 0;
                lcd_data <= 8'h0C; // Display ON
                state <= DELAY;
                delay_flag <= INIT_2;
            end
            INIT_2: begin
                lcd_rs <= 0;
                lcd_data <= 8'h06; // Entry mode set
                state <= DELAY;
                delay_flag <= INIT_3;
            end
            INIT_3: begin
                lcd_rs <= 0;
                lcd_data <= 8'h01; // Clear display
                state <= DELAY;
                delay_flag <= INIT_4;
            end
            INIT_4: begin
                lcd_rs <= 0;
                lcd_data <= 8'h80; // Set DDRAM address to 0x00
                state <= DELAY;
                delay_flag <= IDLE;
            end
            IDLE: begin
                if (slow_clk) begin
                    char_index <= 0;
                    state <= WRITE;
                end
                lcd_enable <= 0;
            end
            WRITE: begin
                lcd_rs <= 1; // Data mode
                lcd_data <= char_buffer[char_index];
                lcd_enable <= 1;
                state <= DELAY;
                delay_flag <= (char_index < 31) ? WRITE : IDLE;
                char_index <= char_index + 1;
            end
            DELAY: begin
                case (enable_phase)
                    2'd0: begin
                        lcd_enable <= 1;
                        enable_phase <= 2'd1;
                    end
                    2'd1: begin
                        lcd_enable <= 0;
                        enable_phase <= 2'd2;
                    end
                    2'd2: begin
                        if (delay_cnt < 16'd5000) begin
                            delay_cnt <= delay_cnt + 1;
                        end else begin
                            delay_cnt <= 0;
                            enable_phase <= 0;
                            state <= delay_flag;
                        end
                    end
                endcase
            end
        endcase
    end
end

endmodule
