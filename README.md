# FPGA 打地鼠游戏机

本项目是复旦大学 2025 春季学期专用集成电路设计方法课程的项目，实现了一个简易的打地鼠游戏机，基于 FPGA 开发板。游戏使用 8 个 LED 灯模拟地鼠，8 个按键用于敲击地鼠。游戏共三轮，难度递增，每轮有 8 小局，时间分别为 6 秒、4 秒和 2 秒。打中地鼠可得分，分别加 1 分、2 分和 3 分。项目还扩展了七段数码管显示实时分数、1602 LCD 显示历史最高分，以及无源蜂鸣器提供音效，增强游戏体验。

## 功能特性

- **模块化设计：** 游戏逻辑、显示、声音和输入处理等功能独立模块化。
- **游戏玩法：** 三轮游戏，每轮 8 局，难度随轮次增加。
- **随机地鼠生成：** 使用 LFSR 生成伪随机地鼠位置。
- **实时反馈：** 七段数码管显示当前分数，LCD 显示历史最高分。
- **音效：** 无源蜂鸣器在不同游戏事件中播放音调。
- **暂停/恢复：** 游戏中可通过 start 按键暂停和恢复游戏。

## 硬件要求

- **FPGA 开发板：** 正点原子达芬奇 Pro，搭载 Xilinx XC7A200T。
- **外接键盘：** 集成七段数码管、8 个 LED 和矩阵键盘。
- **1602 LCD：** 显示历史最高分。
- **无源蜂鸣器：** 用于音效。
- **下载器：** 用于加载比特流文件。

## 软件要求

- **Vivado 2023.2：** 用于设计、仿真和生成比特流文件。  

## 项目结构主体部分

- **`game_machine/game_machine.srcs/`**
  - **`constrs_1/new/constraints.xdc`:** FPGA 引脚分配和约束文件。
  - **`sim_1/new/GameTop_tb.v`:** 仿真测试文件。
  - **`sources_1/new/`:** Verilog 源文件，包含所有模块：
    - `GameTop.v`：顶层模块。
    - `GameControl.v`：游戏逻辑和状态机。
    - `RandomGen.v`：伪随机数生成器。
    - `Effects.v`：LED 灯控制。
    - `ScoreDisplay.v`：七段数码管控制。
    - `SoundPlayer.v`：无源蜂鸣器音效。
    - `TextLCD.v`：1602 LCD 控制。
    - `KeyPress.v`：矩阵键盘输入处理。
  - **`ip/`:** Block RAM IP 核，用于存储音频数据（例如 `MusicIdle`、`MusicTrue`）。
 
## 模块设计与流程
![模块框图](https://github.com/user-attachments/assets/3201a039-4586-4532-9885-e925a7b14e50)

![设计流程图](https://github.com/user-attachments/assets/7ea0a5cd-3ec2-406c-a457-8ea63888417e)

## 使用说明

### 硬件连接
1. 将集成外设（七段数码管、LED、矩阵键盘）连接到 FPGA 板上，参考 `constraints.xdc` 文件。
2. 将 1602 LCD 和无源蜂鸣器连接到指定的 FPGA 引脚。
3. 给 FPGA 板上电，并通过下载器连接到电脑。

### 加载比特流文件
1. 打开 Vivado 2023.2 并加载项目。
2. 生成比特流文件。
3. 使用 Vivado 的 Hardware Manager 将比特流文件烧录到 FPGA 中。

### 游戏操作
- **复位：** 按下复位键，初始化游戏（分数和最高分清零，LED 熄灭）。
- **开始：** 按下 start 键开始游戏，LED 灯随机亮起一个作为地鼠。
- **游戏过程：** 按下矩阵键盘上对应的按键来敲击地鼠。打中地鼠可得分（根据轮次加 1、2 或 3 分）并刷新地鼠位置；打错无反应。
- **计分：** 七段数码管显示当前分数，LCD 显示“Max Score: xxx”历史最高分。
- **暂停：** 游戏中按 start 键暂停（LED 熄灭），再次按下恢复游戏。
- **结束：** 三轮游戏结束后，LED 全亮，蜂鸣器播放结束音效。按 start 键可开始新游戏。

## 设计概述

项目采用自顶向下的模块化设计，主要模块包括：

- **`GameTop`：** 顶层模块，集成所有子模块。
- **`GameControl`：** 控制游戏状态（IDLE、PLAY、PAUSE、GEND），管理时序（50 MHz 时钟）。
- **`RandomGen`：** 使用 8 位 LFSR 生成伪随机地鼠位置。
- **`Effects`：** 根据游戏状态控制 8 个 LED 灯。
- **`ScoreDisplay`：** 驱动七段数码管显示实时分数（最高 48 分）。
- **`SoundPlayer`：** 根据游戏事件通过蜂鸣器输出音调。
- **`TextLCD`：** 在 1602 LCD 上显示和更新历史最高分。
- **`KeyPress`：** 处理矩阵键盘输入，包含 10ms 消抖逻辑。

所有模块均通过 Verilog testbench 和上板测试进行验证。

## 综合与实现

- **工具：** 使用 Vivado 2023.2 进行综合和实现。
- **时序：** 满足 50 MHz 时钟的所有约束，最坏负裕度（WNS）为 4.704ns。
- **资源利用：** 在 XC7A200T 上，LUT 利用率为 2.76%，触发器为 1.56%，块 RAM 为 61.64%。
- **功耗：** 总功耗 0.219W（静态 68%，动态 32%）。

## 游戏视频

由于Github上文件大小限制，演示视频上传至视频网站（或百度网度内下载观看），欢迎前往观看打地鼠游戏演示视频：[https://www.bilibili.com/video/BV151EEzgEFc?vd_source=2bc6659aadb0a404a7fd334b853e4620](https://www.bilibili.com/video/BV151EEzgEFc?vd_source=2bc6659aadb0a404a7fd334b853e4620)

## 链接

- **GitHub 仓库：** [https://github.com/Yanxiang-ZHU/Whack-a-Mole-GameMachine.git](https://github.com/Yanxiang-ZHU/Whack-a-Mole-GameMachine.git)
- **百度网盘：** [https://pan.baidu.com/s/1uYaHy95xZXPiYyR3n_VMdg?pwd=asic](https://pan.baidu.com/s/1uYaHy95xZXPiYyR3n_VMdg?pwd=asic)
