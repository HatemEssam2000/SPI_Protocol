# SPI_Protocol
SPI Slave with Integrated Single-Port RAM

This repository contains the RTL design, verification, and FPGA implementation of an SPI Slave Controller integrated with a Synchronous Single-Port RAM. The project features an FSM-driven SPI protocol implementation evaluated across multiple state encoding schemes to optimize setup/hold timing slacks and operating frequency on Xilinx FPGA hardware.





------------------------------------------
├── rtl/                  # Verilog RTL source files (SPI Slave, RAM, Top Module)

├── tb/                   # Testbench files for direct write/read sequence verification

├── scripts/              # Tcl (.do) scripts for QuestaSim automated flow

├── constraints/          # Xilinx Design Constraints (XDC) mapping I/O to FPGA switches & LEDs

├── docs/                 # Synthesis/Implementation reports, schematics

└── README.md             # Project documentation
