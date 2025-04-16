# Clock signal
set_property PACKAGE_PIN R4 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 100.000 [get_ports clk]

# Reset signal
set_property PACKAGE_PIN U7 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

# Start button
set_property PACKAGE_PIN T4 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]

# Button inputs
set_property PACKAGE_PIN T4 [get_ports btn[0]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[0]]

set_property PACKAGE_PIN T3 [get_ports btn[1]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[1]]

set_property PACKAGE_PIN R6 [get_ports btn[2]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[2]]

set_property PACKAGE_PIN T6 [get_ports btn[3]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[3]]

set_property PACKAGE_PIN Y8 [get_ports btn[4]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[4]]

set_property PACKAGE_PIN Y7 [get_ports btn[5]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[5]]

set_property PACKAGE_PIN W7 [get_ports btn[6]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[6]]

set_property PACKAGE_PIN V8 [get_ports btn[7]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[7]]

# LED outputs
set_property PACKAGE_PIN V9 [get_ports led[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led[0]]

set_property PACKAGE_PIN Y8 [get_ports led[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led[1]]

set_property PACKAGE_PIN Y7 [get_ports led[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led[2]]

set_property PACKAGE_PIN W7 [get_ports led[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led[3]]

set_property PACKAGE_PIN W6 [get_ports led[4]]
set_property IOSTANDARD LVCMOS33 [get_ports led[4]]

set_property PACKAGE_PIN V7 [get_ports led[5]]
set_property IOSTANDARD LVCMOS33 [get_ports led[5]]

set_property PACKAGE_PIN U7 [get_ports led[6]]
set_property IOSTANDARD LVCMOS33 [get_ports led[6]]

set_property PACKAGE_PIN T7 [get_ports led[7]]
set_property IOSTANDARD LVCMOS33 [get_ports led[7]]

# 7-segment display (tens place)
set_property PACKAGE_PIN P1 [get_ports seg1[0]]
set_property IOSTANDARD LVCMOS33 [get_ports seg1[0]]

set_property PACKAGE_PIN P2 [get_ports seg1[1]]
set_property IOSTANDARD LVCMOS33 [get_ports seg1[1]]

set_property PACKAGE_PIN P3 [get_ports seg1[2]]
set_property IOSTANDARD LVCMOS33 [get_ports seg1[2]]

set_property PACKAGE_PIN P4 [get_ports seg1[3]]
set_property IOSTANDARD LVCMOS33 [get_ports seg1[3]]

set_property PACKAGE_PIN P5 [get_ports seg1[4]]
set_property IOSTANDARD LVCMOS33 [get_ports seg1[4]]

set_property PACKAGE_PIN P6 [get_ports seg1[5]]
set_property IOSTANDARD LVCMOS33 [get_ports seg1[5]]

set_property PACKAGE_PIN P7 [get_ports seg1[6]]
set_property IOSTANDARD LVCMOS33 [get_ports seg1[6]]

# 7-segment display (ones place)
set_property PACKAGE_PIN N1 [get_ports seg0[0]]
set_property IOSTANDARD LVCMOS33 [get_ports seg0[0]]

set_property PACKAGE_PIN N2 [get_ports seg0[1]]
set_property IOSTANDARD LVCMOS33 [get_ports seg0[1]]

set_property PACKAGE_PIN N3 [get_ports seg0[2]]
set_property IOSTANDARD LVCMOS33 [get_ports seg0[2]]

set_property PACKAGE_PIN N4 [get_ports seg0[3]]
set_property IOSTANDARD LVCMOS33 [get_ports seg0[3]]

set_property PACKAGE_PIN N5 [get_ports seg0[4]]
set_property IOSTANDARD LVCMOS33 [get_ports seg0[4]]

set_property PACKAGE_PIN N6 [get_ports seg0[5]]
set_property IOSTANDARD LVCMOS33 [get_ports seg0[5]]

set_property PACKAGE_PIN N7 [get_ports seg0[6]]
set_property IOSTANDARD LVCMOS33 [get_ports seg0[6]]

# Buzzer
set_property PACKAGE_PIN V7 [get_ports buzzer]
set_property IOSTANDARD LVCMOS33 [get_ports buzzer]

# LCD display
set_property PACKAGE_PIN E14 [get_ports lcd_data[0]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[0]]

set_property PACKAGE_PIN E15 [get_ports lcd_data[1]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[1]]

set_property PACKAGE_PIN E16 [get_ports lcd_data[2]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[2]]

set_property PACKAGE_PIN E17 [get_ports lcd_data[3]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[3]]

set_property PACKAGE_PIN F14 [get_ports lcd_data[4]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[4]]

set_property PACKAGE_PIN F15 [get_ports lcd_data[5]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[5]]

set_property PACKAGE_PIN F16 [get_ports lcd_data[6]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[6]]

set_property PACKAGE_PIN F17 [get_ports lcd_data[7]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[7]]

set_property PACKAGE_PIN G14 [get_ports lcd_enable]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_enable]

set_property PACKAGE_PIN G15 [get_ports lcd_rs]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_rs]

set_property PACKAGE_PIN G16 [get_ports lcd_rw]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_rw]
