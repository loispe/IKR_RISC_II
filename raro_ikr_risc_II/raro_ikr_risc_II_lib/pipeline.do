onerror {resume}
quietly virtual signal -install /raro_ikr_risc_ii_tb/U_0/U_4 { /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(31 downto 26)} OPC
quietly virtual signal -install /raro_ikr_risc_ii_tb/U_0/U_4 { /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(25 downto 21)} RC
quietly virtual signal -install /raro_ikr_risc_ii_tb/U_0/U_4 { /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(20 downto 16)} RB
quietly virtual signal -install /raro_ikr_risc_ii_tb/U_0/U_4 { /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(15 downto 0)} IMM
quietly virtual signal -install /raro_ikr_risc_ii_tb/U_0/U_4 { /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(15 downto 10)} OPCR
quietly virtual signal -install /raro_ikr_risc_ii_tb/U_0/U_4 { /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(9 downto 5)} RA
quietly virtual signal -install /raro_ikr_risc_ii_tb/U_0/U_4 { /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(4 downto 0)} RA001
quietly WaveActivateNextPane {} 0
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/clk
add wave -noupdate -divider IF
add wave -noupdate -radix decimal /raro_ikr_risc_ii_tb/U_0/U_3/rPc_out
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider OPCODE
add wave -noupdate -radix hexadecimal -childformat {{/raro_ikr_risc_ii_tb/U_0/U_4/OPC(31) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/OPC(30) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/OPC(29) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/OPC(28) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/OPC(27) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/OPC(26) -radix hexadecimal}} -subitemconfig {/raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(31) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(30) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(29) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(28) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(27) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(26) {-radix hexadecimal}} /raro_ikr_risc_ii_tb/U_0/U_4/OPC
add wave -noupdate -radix hexadecimal -childformat {{/raro_ikr_risc_ii_tb/U_0/U_4/RC(25) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/RC(24) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/RC(23) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/RC(22) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_4/RC(21) -radix hexadecimal}} -subitemconfig {/raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(25) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(24) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(23) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(22) {-radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_4/rOpcode_out(21) {-radix hexadecimal}} /raro_ikr_risc_ii_tb/U_0/U_4/RC
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_4/RB
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_4/IMM
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_4/OPCR
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_4/RA001
add wave -noupdate -divider DEC
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_5/rAluMode_in
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_5/rMemMode_in_dc
add wave -noupdate -radix decimal /raro_ikr_risc_ii_tb/U_0/U_5/sel_a
add wave -noupdate -radix decimal /raro_ikr_risc_ii_tb/U_0/U_5/sel_b
add wave -noupdate -radix decimal /raro_ikr_risc_ii_tb/U_0/U_5/sel_c
add wave -noupdate -radix decimal /raro_ikr_risc_ii_tb/U_0/U_5/rTargetReg_in_dc
add wave -noupdate -radix decimal /raro_ikr_risc_ii_tb/U_0/U_5/sel_imm
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_5/a_imm
add wave -noupdate -divider RF
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_5/rA_in
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_5/rB_in
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_5/rC_in
add wave -noupdate -divider FWD
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_5/rFwd_sela_in_dc
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_5/rFwd_selb_in_dc
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_5/rFwd_selc_in_dc
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_5/rFwd_selsd_in_dc
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider EX_ALU
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_6/rAluMode_out
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_7/mux_ALU_A
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_7/mux_ALU_B
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_7/ALU_out
add wave -noupdate -divider EX_MEM
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_8/rMemMode_out_ex
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_7/rStoreData_in
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider ME
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_8/rMemMode_out_me
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_8/rStoreData_out
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_8/rFwd_selsd_out_me
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_8/rALU_out
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_11/rME_in
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider WB
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_11/rME_out
add wave -noupdate -radix hexadecimal /raro_ikr_risc_ii_tb/U_0/U_11/rTargetReg_out_wb
add wave -noupdate -divider Storage
add wave -noupdate -radix hexadecimal -childformat {{/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(0) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(1) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(2) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(3) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(4) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(5) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(6) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(7) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(8) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(9) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(10) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(11) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(12) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(13) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(14) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(15) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(16) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(17) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(18) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(19) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(20) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(21) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(22) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(23) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(24) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(25) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(26) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(27) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(28) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(29) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(30) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(31) -radix hexadecimal}} -subitemconfig {/raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(0) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(1) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(2) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(3) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(4) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(5) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(6) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(7) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(8) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(9) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(10) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(11) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(12) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(13) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(14) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(15) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(16) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(17) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(18) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(19) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(20) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(21) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(22) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(23) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(24) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(25) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(26) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(27) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(28) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(29) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(30) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers(31) {-height 17 -radix hexadecimal}} /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers
add wave -noupdate -radix hexadecimal -childformat {{/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(0) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(1) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(2) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(3) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(4) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(5) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(6) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(7) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(8) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(9) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(10) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(11) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(12) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(13) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(14) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(15) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(16) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(17) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(18) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(19) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(20) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(21) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(22) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(23) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(24) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(25) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(26) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(27) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(28) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(29) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(30) -radix hexadecimal} {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(31) -radix hexadecimal}} -subitemconfig {/raro_ikr_risc_ii_tb/U_0/U_9/ram_block(0) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(1) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(2) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(3) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(4) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(5) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(6) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(7) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(8) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(9) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(10) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(11) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(12) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(13) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(14) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(15) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(16) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(17) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(18) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(19) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(20) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(21) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(22) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(23) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(24) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(25) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(26) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(27) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(28) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(29) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(30) {-height 17 -radix hexadecimal} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block(31) {-height 17 -radix hexadecimal}} /raro_ikr_risc_ii_tb/U_0/U_9/ram_block
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50206 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {210 ns}
