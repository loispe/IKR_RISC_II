onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /raro_ikr_risc_ii_tb/U_1/clk
add wave -noupdate /raro_ikr_risc_ii_tb/U_1/res_n
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_7/ALU_out
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_9/rStoreData_out
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_9/rMemMode_out_me
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_9/ram_out
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_9/ram_block
add wave -noupdate /raro_ikr_risc_ii_tb/U_0/U_5/U_1/registers
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {4114094 ps}
