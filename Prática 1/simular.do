# Apaga o diretório work se ele existe
if {[file isdirectory work]} { vdel -all -lib work }	
	
# Definição da biblioteca work
vlib work 	

# "conecta" o work do VHDL ao diretório work						
vmap work work						

# Cancela as simulações que estiverem rodando	
quit -sim       				

# Compila os arquivos VHDL	
vcom DIVISOR.vhd 					
vcom cont4_completo.vhd
vcom cont_10.vhd
vcom cont_57.vhd
vcom cont_57_tb.vhd

# Inicia a simulação com o testbench
vsim -t ns work.cont_57_tb

# Adiciona as ondas
# INPUTS
add wave -divider Inputs:
add wave -color yellow -position insertpoint  \
sim:/cont_57_tb/clk \
sim:/cont_57_tb/en \
sim:/cont_57_tb/rst \
sim:/cont_57_tb/clr

# OUTPUTS
add wave -divider Outputs:
add wave -color green -position insertpoint  \
sim:/cont_57_tb/Q_UNI \
sim:/cont_57_tb/Q_DEZ

# Roda a simulação
run        3000 ns						