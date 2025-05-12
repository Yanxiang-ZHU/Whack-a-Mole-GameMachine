`timescale 1ns / 1ps

module  ScoreDisplay(
    input sclk,       
    input s_rst_n,       
    input [5:0] score,  
    output reg [5:0] sel,       
    output reg [7:0] seg_led                 
);

reg [3:0] tens;
reg [3:0] ones;

always @(*) begin
    if (score >= 40) begin
        tens = 4;
        ones = score - 40;
    end else if (score >= 30) begin
        tens = 3;
        ones = score - 30;
    end else if (score >= 20) begin
        tens = 2;
        ones = score - 20;
    end else if (score >= 10) begin
        tens = 1;
        ones = score - 10;
    end else begin
        tens = 0;
        ones = score;
    end
end

localparam DELAY_1MS = 50_000;
localparam SEG_ZERO  = 8'b1100_0000;
localparam SEG_ONE   = 8'b1111_1001;
localparam SEG_TWO   = 8'b1010_0100;
localparam SEG_THREE = 8'b1011_0000;
localparam SEG_FOUR  = 8'b1001_1001;
localparam SEG_FIVE  = 8'b1001_0010;
localparam SEG_SIX   = 8'b1000_0010;
localparam SEG_SEVEN = 8'b1111_1000;
localparam SEG_EIGHT = 8'b1000_0000;
localparam SEG_NINE  = 8'b1001_0000;
                                       
reg [15:0] cnt_1ms;    
   
reg [3:0] seg_led_temp;

always  @(posedge sclk or negedge s_rst_n) begin
    if(s_rst_n == 1'b0)
        cnt_1ms <= 'd0;
    else if(cnt_1ms == (DELAY_1MS-1))
        cnt_1ms <= 'd0;
    else
        cnt_1ms <= cnt_1ms + 1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
    if(s_rst_n == 1'b0)
        sel <= 6'b11_1110;
    else if(cnt_1ms == (DELAY_1MS-1))
        sel <= {sel[4:0], sel[5]};
end

always  @(*) begin
    case(sel)
        6'b01_1111: seg_led_temp = ones;
        6'b10_1111: seg_led_temp = tens;
        6'b11_0111: seg_led_temp = 4'd0;
        6'b11_1011: seg_led_temp = 4'd0;
        6'b11_1101: seg_led_temp = 4'd0;
        6'b11_1110: seg_led_temp = 4'd0;
    endcase
end

always @ (posedge sclk or negedge s_rst_n) begin
    if (s_rst_n == 1'b0) 
        seg_led <= SEG_ZERO; 
    else case(seg_led_temp)              
        4'd0:     seg_led <= SEG_ZERO;                                                        
        4'd1:     seg_led <= SEG_ONE  ;                            
        4'd2:     seg_led <= SEG_TWO  ;                            
        4'd3:     seg_led <= SEG_THREE;                            
        4'd4:     seg_led <= SEG_FOUR ;                            
        4'd5:     seg_led <= SEG_FIVE ;                            
        4'd6:     seg_led <= SEG_SIX  ;                            
        4'd7:     seg_led <= SEG_SEVEN;      
        4'd8:     seg_led <= SEG_EIGHT;      
        4'd9:     seg_led <= SEG_NINE ;    
        default:  seg_led <= SEG_ZERO;
    endcase
end

endmodule
