`timescale 1ns/1ns

module KeyPress(
    input sclk,
    input s_rst_n,
    output reg [3:0] col,
    input [3:0] row,
    output reg [3:0] key_val,
    output reg key_val_vld
);

parameter DELAY_1MS   = 'd49_999;
parameter DELAY_10MS  = 'd499_999;

reg [15:0] cnt_1ms;
reg [18:0] cnt_10ms;

wire key_and;
reg key_and_d1;
reg key_and_d2;

assign key_and = &row;

always @(posedge sclk) begin
    key_and_d1 <= key_and;
    key_and_d2 <= key_and_d1;
end

always @(posedge sclk or negedge s_rst_n) begin
    if(s_rst_n == 1'b0)
        cnt_1ms <= 'd0;
    else if(cnt_1ms >= DELAY_1MS)
        cnt_1ms <= 'd0;
    else if(key_and_d2 == 1'b1)
        cnt_1ms <= cnt_1ms + 1'b1;
end

always @(posedge sclk or negedge s_rst_n) begin
    if(s_rst_n == 1'b0)
        col <= 4'b1110;
    else if(cnt_1ms >= DELAY_1MS)
        col <= {col[2:0], col[3]};
end

always @(posedge sclk or negedge s_rst_n) begin
    if(s_rst_n == 1'b0)
        cnt_10ms <= 'd0;
    else if(key_and_d2 == 1'b1)
        cnt_10ms <= 'd0;
    else if(cnt_10ms <= DELAY_10MS)
        cnt_10ms <= cnt_10ms + 1'b1;
end

always @(posedge sclk or negedge s_rst_n) begin
    if(s_rst_n == 1'b0)
        key_val <= 'd0;
    else if(cnt_10ms == DELAY_10MS && key_and_d2 == 1'b0)
        case({row, col})
            8'hee:  key_val <= 'd0;
            8'hed:  key_val <= 'd1;
            8'heb:  key_val <= 'd2;
            8'he7:  key_val <= 'd3;
            8'hde:  key_val <= 'd4;
            8'hdd:  key_val <= 'd5;
            8'hdb:  key_val <= 'd6;
            8'hd7:  key_val <= 'd7;
            8'hbe:  key_val <= 'd8;
            8'hbd:  key_val <= 'd9;
            8'hbb:  key_val <= 'd10;
            8'hb7:  key_val <= 'd11;
            8'h7e:  key_val <= 'd12;
            8'h7d:  key_val <= 'd13;
            8'h7b:  key_val <= 'd14;
            8'h77:  key_val <= 'd15;
            default:key_val <= 'd0;
        endcase
end

always @(posedge sclk or negedge s_rst_n) begin
    if(s_rst_n == 1'b0)
        key_val_vld <= 1'b0;
    else if(cnt_10ms == DELAY_10MS && key_and_d2 == 1'b0)
        key_val_vld <= 1'b1;
    else
        key_val_vld <= 1'b0;
end

endmodule
