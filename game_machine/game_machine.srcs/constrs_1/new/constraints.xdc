# Clock signal
set_property PACKAGE_PIN R4 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 20.000 [get_ports clk]

# Reset signal
set_property PACKAGE_PIN U7 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

# Start button
set_property PACKAGE_PIN T4 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]

# Button inputs
set_property PACKAGE_PIN W12 [get_ports row[0]]
set_property IOSTANDARD LVCMOS33 [get_ports row[0]]

set_property PACKAGE_PIN W11 [get_ports row[1]]
set_property IOSTANDARD LVCMOS33 [get_ports row[1]]

set_property PACKAGE_PIN W16 [get_ports row[2]]
set_property IOSTANDARD LVCMOS33 [get_ports row[2]]

set_property PACKAGE_PIN U15 [get_ports row[3]]
set_property IOSTANDARD LVCMOS33 [get_ports row[3]]

set_property PACKAGE_PIN AB12 [get_ports column[0]]
set_property IOSTANDARD LVCMOS33 [get_ports column[0]]

set_property PACKAGE_PIN V15 [get_ports column[1]]
set_property IOSTANDARD LVCMOS33 [get_ports column[1]]

set_property PACKAGE_PIN T16 [get_ports column[2]]
set_property IOSTANDARD LVCMOS33 [get_ports column[2]]

set_property PACKAGE_PIN Y14 [get_ports column[3]]
set_property IOSTANDARD LVCMOS33 [get_ports column[3]]

# LED outputs
set_property PACKAGE_PIN V10 [get_ports led[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led[0]]

set_property PACKAGE_PIN T14 [get_ports led[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led[1]]

set_property PACKAGE_PIN AB10 [get_ports led[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led[2]]

set_property PACKAGE_PIN W10 [get_ports led[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led[3]]

set_property PACKAGE_PIN AA9 [get_ports led[4]]
set_property IOSTANDARD LVCMOS33 [get_ports led[4]]

set_property PACKAGE_PIN T15 [get_ports led[5]]
set_property IOSTANDARD LVCMOS33 [get_ports led[5]]

set_property PACKAGE_PIN N15 [get_ports led[6]]
set_property IOSTANDARD LVCMOS33 [get_ports led[6]]

set_property PACKAGE_PIN Y17 [get_ports led[7]]
set_property IOSTANDARD LVCMOS33 [get_ports led[7]]

# 7-segment display
set_property PACKAGE_PIN AA15 [get_ports seg[7]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[7]]

set_property PACKAGE_PIN AA14 [get_ports seg[6]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[6]]

set_property PACKAGE_PIN V14 [get_ports seg[5]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[5]]

set_property PACKAGE_PIN V13 [get_ports seg[4]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[4]]

set_property PACKAGE_PIN U16 [get_ports seg[3]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[3]]

set_property PACKAGE_PIN AB15 [get_ports seg[2]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[2]]

set_property PACKAGE_PIN Y13 [get_ports seg[1]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[1]]

set_property PACKAGE_PIN W14 [get_ports seg[0]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[0]]

# 7-segment display enable signals
set_property PACKAGE_PIN AA11 [get_ports select[0]]
set_property IOSTANDARD LVCMOS33 [get_ports select[0]]

set_property PACKAGE_PIN AA10 [get_ports select[1]]
set_property IOSTANDARD LVCMOS33 [get_ports select[1]]

set_property PACKAGE_PIN AB11 [get_ports select[2]]
set_property IOSTANDARD LVCMOS33 [get_ports select[2]]

set_property PACKAGE_PIN W15 [get_ports select[3]]
set_property IOSTANDARD LVCMOS33 [get_ports select[3]]

set_property PACKAGE_PIN Y11 [get_ports select[4]]
set_property IOSTANDARD LVCMOS33 [get_ports select[4]]

set_property PACKAGE_PIN Y12 [get_ports select[5]]
set_property IOSTANDARD LVCMOS33 [get_ports select[5]]

# Buzzer
set_property PACKAGE_PIN AB16 [get_ports buzzer]
set_property IOSTANDARD LVCMOS33 [get_ports buzzer]

# LCD display
set_property PACKAGE_PIN B22 [get_ports lcd_data[0]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[0]]

set_property PACKAGE_PIN D20 [get_ports lcd_data[1]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[1]]

set_property PACKAGE_PIN B20 [get_ports lcd_data[2]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[2]]

set_property PACKAGE_PIN C18 [get_ports lcd_data[3]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[3]]

set_property PACKAGE_PIN B15 [get_ports lcd_data[4]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[4]]

set_property PACKAGE_PIN C14 [get_ports lcd_data[5]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[5]]

set_property PACKAGE_PIN C13 [get_ports lcd_data[6]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[6]]

set_property PACKAGE_PIN AB18 [get_ports lcd_data[7]]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_data[7]]

set_property PACKAGE_PIN B21 [get_ports lcd_enable]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_enable]

set_property PACKAGE_PIN E16 [get_ports lcd_rs]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_rs]

set_property PACKAGE_PIN D14 [get_ports lcd_rw]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_rw]
