`timescale 1ns / 1ps

module GameTop(
    input clk,                // 时钟信号
    input rst,                // 复位信号
    input start,              // 开始按键
    input [7:0] btn,          // 8 个按键输入
    output [7:0] led,         // 8 个 LED 输出
    output [2:0] score,       // 3 位得分显示
    output sound              // 音效输出
    );

    wire [7:0] target_led;    // 当前目标 LED
    wire [31:0] max_time;     // 当前轮次最大时间
    wire [1:0] game_state;    // 游戏状态
    wire [2:0] round;         // 当前轮次
    wire [7:0] random_num;    // 随机数

    // 随机数生成模块
    RandomGen random_gen(
        .clk(clk),
        .rst(rst),
        .random_num(random_num)
    );

    // 游戏状态控制模块
    GameControl game_control(
        .clk(clk),
        .rst(rst),
        .start(start),
        .btn(btn),
        .random_num(random_num),
        .game_state(game_state),
        .round(round),
        .max_time(max_time),
        .target_led(target_led),
        .score(score)
    );

    // 灯光和音效模块
    Effects effects(
        .clk(clk),
        .rst(rst),
        .game_state(game_state),
        .target_led(target_led),
        .led(led),
        .sound(sound)
    );

endmodule
