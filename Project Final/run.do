vlib work
vlog Single_Port_RAM.v SPI_Slave_Single_Port_RAM.v SPI_Slave.v tb_SPI_Slave_Single_Port_RAM.v
vsim -voptargs=+acc work.tb_SPI_Slave_Single_Port_RAM
add wave *
run -all
#quit -sim