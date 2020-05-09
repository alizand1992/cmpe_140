# Clock Signal
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33}           [get_ports {clk}];          
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];

# Buttons
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {button_clk}]; # Center Button
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {rst}]; # Left Button

# Switches
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {sw0}];  # Switch 0
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {sw1}];  # Switch 1
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {sw2}];  # Switch 2
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {sw3}];  # Switch 3
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {sw4}];  # Switch 4
#set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {switches[5]}];  # Switch 5
#set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {switches[6]}];  # Switch 6
#set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {switches[7]}];  # Switch 7
#set_property -dict {PACKAGE_PIN V2  IOSTANDARD LVCMOS33} [get_ports {switches[8]}];  # Switch 8

## LEDs
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {ld0}];  # LED 0
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {ld1}];  # LED 1
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {ld2}];  # LED 2
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {ld3}];  # LED 3
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {ld4}];  # LED 4
#set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {c[5]}];  # LED 5
#set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {c[6]}];  # LED 6
#set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {c[7]}];  # LED 7
#set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {done}];  # LED 8
#set_property -dict {PACKAGE_PIN V3  IOSTANDARD LVCMOS33} [get_ports {LED[9]}];  # LED 9
##set_property -dict {PACKAGE_PIN W3  IOSTANDARD LVCMOS33} [get_ports {LED[10]}]; # LED 10
#set_property -dict {PACKAGE_PIN U3  IOSTANDARD LVCMOS33} [get_ports {CS[0]}]; # LED 11
#set_property -dict {PACKAGE_PIN P3  IOSTANDARD LVCMOS33} [get_ports {CS[1]}]; # LED 12
#set_property -dict {PACKAGE_PIN N3  IOSTANDARD LVCMOS33} [get_ports {CS[2]}]; # LED 13
#set_property -dict {PACKAGE_PIN P1  IOSTANDARD LVCMOS33} [get_ports {CS[3]}]; # LED 14
#set_property -dict {PACKAGE_PIN L1  IOSTANDARD LVCMOS33} [get_ports {err}]; # LED 15

  
# 7 segment display
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[0]}]; # CA
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[1]}]; # CB
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[2]}]; # CC
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[3]}]; # CD
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[4]}]; # CE
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[5]}]; # CF
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[6]}]; # CG
set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[7]}]; # DP

set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[0]}]; # AN0
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[1]}]; # AN1
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[2]}]; # AN2
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[3]}]; # AN3