# FPGA Whack-a-Mole Game Console  

This project was developed as part of the *Application-Specific Integrated Circuit Design Methodology* course at Fudan University in Spring 2025. It implements a simplified Whack-a-Mole game on an FPGA development board. The game uses 8 LEDs to represent moles and 8 buttons for user input. The game consists of three rounds with increasing difficulty, each containing 8 turns of 6 seconds, 4 seconds, and 2 seconds respectively. Players score points by hitting the correct mole, earning 1, 2, or 3 points depending on the round. Additional features include a seven-segment display for real-time scoring, a 1602 LCD for recording the highest score, and a passive buzzer for sound effects, enhancing the overall game experience.  

## Features  

- **Modular design:** Game logic, display, audio, and input handling are implemented as separate modules.  
- **Gameplay:** Three rounds, each with 8 turns, with difficulty increasing across rounds.  
- **Random mole generation:** Implemented using an LFSR for pseudo-random positions.  
- **Real-time feedback:** Seven-segment display shows current score; LCD shows highest recorded score.  
- **Audio effects:** Passive buzzer outputs different tones for in-game events.  
- **Pause/Resume:** Game can be paused and resumed via the start button.  

## Hardware Requirements  

- **FPGA board:** ALINX Da Vinci Pro, equipped with Xilinx XC7A200T.  
- **Peripheral board:** Integrated with a seven-segment display, 8 LEDs, and a matrix keyboard.  
- **1602 LCD:** Displays highest score.  
- **Passive buzzer:** Provides audio feedback.  
- **Programmer:** Used to download the bitstream file.  

## Software Requirements  

- **Vivado 2023.2:** For design, simulation, and bitstream generation.  

## Project Structure  

- **`game_machine/game_machine.srcs/`**  
  - **`constrs_1/new/constraints.xdc`:** Pin assignment and constraint file.  
  - **`sim_1/new/GameTop_tb.v`:** Testbench for simulation.  
  - **`sources_1/new/`:** Verilog source files, including all modules:  
    - `GameTop.v`: Top-level module.  
    - `GameControl.v`: Game logic and state machine.  
    - `RandomGen.v`: Pseudo-random generator.  
    - `Effects.v`: LED control.  
    - `ScoreDisplay.v`: Seven-segment display controller.  
    - `SoundPlayer.v`: Buzzer-based sound generation.  
    - `TextLCD.v`: 1602 LCD controller.  
    - `KeyPress.v`: Matrix keyboard input handler with debouncing.  
  - **`ip/`:** Block RAM IP cores used to store audio data (e.g., `MusicIdle`, `MusicTrue`).  

## Module Design and Workflow  

![Module Block Diagram](https://github.com/user-attachments/assets/3201a039-4586-4532-9885-e925a7b14e50)  
![Design Flow](https://github.com/user-attachments/assets/7ea0a039-3ec2-406c-a457-8ea63888417e)  

## User Guide  

### Hardware Setup  
1. Connect integrated peripherals (seven-segment display, LEDs, matrix keyboard) to the FPGA board according to `constraints.xdc`.  
2. Connect the 1602 LCD and passive buzzer to the specified FPGA pins.  
3. Power up the FPGA board and connect to a PC via the programmer.  

### Loading the Bitstream  
1. Open Vivado 2023.2 and load the project.  
2. Generate the bitstream file.  
3. Use Vivado Hardware Manager to program the FPGA.  

### Gameplay  
- **Reset:** Press reset to initialize (scores cleared, LEDs off).  
- **Start:** Press start to begin, LEDs randomly light up to represent a mole.  
- **Play:** Press the corresponding key on the matrix keyboard to hit the mole. A hit scores points (1, 2, or 3 depending on the round) and refreshes the mole’s position; incorrect hits have no effect.  
- **Scoring:** Current score shown on seven-segment display; highest score shown on LCD as “Max Score: xxx”.  
- **Pause:** Press start during the game to pause (LEDs off), press again to resume.  
- **End:** After three rounds, all LEDs turn on and the buzzer plays an end tone. Press start to restart.  

## Design Overview  

The project uses a top-down modular design, with key modules including:  

- **`GameTop`:** Top-level module integrating all submodules.  
- **`GameControl`:** State controller (IDLE, PLAY, PAUSE, GEND) with timing management (50 MHz clock).  
- **`RandomGen`:** 8-bit LFSR for pseudo-random mole positions.  
- **`Effects`:** Controls 8 LEDs according to game state.  
- **`ScoreDisplay`:** Drives seven-segment display for real-time scoring (max 48 points).  
- **`SoundPlayer`:** Generates tones via buzzer based on events.  
- **`TextLCD`:** Displays and updates highest score on 1602 LCD.  
- **`KeyPress`:** Handles matrix keyboard input with 10 ms debouncing.  

All modules were validated using Verilog testbenches and FPGA board testing.  

## Synthesis and Implementation  

- **Tool:** Vivado 2023.2 for synthesis and implementation.  
- **Timing:** All constraints met at 50 MHz; worst negative slack (WNS) = 4.704 ns.  
- **Resource utilization:** On XC7A200T: LUT 2.76%, FF 1.56%, Block RAM 61.64%.  
- **Power:** Total power 0.219 W (static 68%, dynamic 32%).  

## Demo Video  

Due to GitHub file size limits, the demo video is uploaded to external sites: [Bilibili Video](https://www.bilibili.com/video/BV151EEzgEFc?vd_source=2bc6659aadb0a404a7fd334b853e4620)  

## Links  

- **GitHub Repository:** [https://github.com/Yanxiang-ZHU/Whack-a-Mole-GameMachine.git](https://github.com/Yanxiang-ZHU/Whack-a-Mole-GameMachine.git)  
- **Baidu Cloud:** [https://pan.baidu.com/s/1uYaHy95xZXPiYyR3n_VMdg?pwd=asic](https://pan.baidu.com/s/1uYaHy95xZXPiYyR3n_VMdg?pwd=asic)  

