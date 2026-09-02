## =============================================================================
## Constraint file: SPI_Slave_Single_Port_RAM.xdc
## Target board   : Digilent Basys3 (Artix-7, XC7A35T-1CPG236C)
## Top module     : SPI_Slave_Single_Port_RAM
## Ports          : clk, rst, MOSI, SS_N, MISO
##
## Per Section 5.1 of the spec:
##   - rst_n, SS_n, MOSI  -> 3 switches
##   - MISO               -> 1 LED
## Note: this design's reset port is named "rst" (active-low, synchronous),
## so it is bound to SW15 here and is treated as an active-low reset switch
## (flip SW15 down to hold reset, up to release it).
## =============================================================================

## ---------------------------------------------------------------------------
## 100 MHz system clock (Basys3 onboard oscillator)
## ---------------------------------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0 5} -add [get_ports clk]

## ---------------------------------------------------------------------------
## Inputs: MOSI, SS_N, rst  -> SW0, SW1, SW15
## ---------------------------------------------------------------------------
set_property PACKAGE_PIN V17 [get_ports MOSI]
set_property IOSTANDARD LVCMOS33 [get_ports MOSI]

set_property PACKAGE_PIN V16 [get_ports SS_N]
set_property IOSTANDARD LVCMOS33 [get_ports SS_N]

set_property PACKAGE_PIN R2 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## ---------------------------------------------------------------------------
## Output: MISO -> LD0
## ---------------------------------------------------------------------------
set_property PACKAGE_PIN U16 [get_ports MISO]
set_property IOSTANDARD LVCMOS33 [get_ports MISO]

## ---------------------------------------------------------------------------
## Config / bitstream options (standard Basys3 boilerplate)
## ---------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

## ---------------------------------------------------------------------------
## OPTIONAL: ILA debug core probing MISO, MOSI, SS_N, rst, clk
## (uncomment and connect via the Vivado IP catalog / mark_debug attributes
##  on the corresponding top-level nets, per Section 5.1 requirement)
## ---------------------------------------------------------------------------
# set_property MARK_DEBUG true [get_nets MISO]
# set_property MARK_DEBUG true [get_nets MOSI]
# set_property MARK_DEBUG true [get_nets SS_N]
# set_property MARK_DEBUG true [get_nets rst]
