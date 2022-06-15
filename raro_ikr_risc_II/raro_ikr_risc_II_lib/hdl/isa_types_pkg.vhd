--
-- VHDL Package Header raro_ikr_risc_II_lib.isa_types
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:54:55 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE isa_types IS
  SUBTYPE cmd_beginning IS    std_logic_vector(31 downto 26); --Erste 6 Bit des Befehls 
  SUBTYPE opc_i_format IS     std_logic_vector(31 downto 26); --Wenn i-Format, dann steht opc am Anfang
  SUBTYPE opc_r_format IS     std_logic_vector(15 downto 10); --Wenn r-Format, dann steht opc an Stellen 15-10
  SUBTYPE opc_r_format_ext IS std_logic_vector(4 downto 0);   --Wenn nur 1 Quelloperand, dann unterscheiden sich die Operationen an den Stellen 4-0
  SUBTYPE opc_b_format IS     std_logic_vector(20 downto 18); --B-Befehle unterscheiden sich an den Bits 20-18
  SUBTYPE opc_c_reg IS        std_logic_vector(25 downto 21); --Register c steht immer an derselben Stelle (sofern vorhanden)
  SUBTYPE opc_b_reg IS        std_logic_vector(20 downto 16); --Register b steht immer an derselben Stelle (sofern vorhanden)
  SUBTYPE opc_a_reg IS        std_logic_vector(4 downto 0);   --Register a steht immer an derselben Stelle (sofern vorhanden)
  SUBTYPE imm16_type IS       std_logic_vector(15 downto 0);  --16-Bit-Konstante
  SUBTYPE disp26_type IS      std_logic_vector(25 downto 0);  --26-Bit Displacement bei branch-befehlen
  SUBTYPE disp18_type IS      std_logic_vector(17 downto 0);  --18-Bit Displacement bei branch-Befehlen
  
  --alu modes
  TYPE alu_mode_type IS (
                    alu_idle, alu_add, alu_sub, alu_lsl, alu_lsr, alu_asl, alu_asr, alu_rol, alu_ror,
                    alu_extb, alu_exth, alu_swapb, alu_swaph, alu_not, alu_jmp, alu_jsr,
                    alu_addx, alu_subx, alu_and, alu_or, alu_xor, alu_cmps, alu_cmpu
                    );

  --data mememoy modes                  
  TYPE mem_mode_type IS (
                    mem_idle, mem_read, mem_write
                  );           
  
  --forwarding modes                  
  TYPE fwd_mode_type IS (
                    fwd_idle, fwd_WB, fwd_ME
                    );

  --Konstanten zum Unterscheiden zwischen i-Format, r-Format und b-Format
  CONSTANT r_format : cmd_beginning := 6X"3F";
  CONSTANT b_format : cmd_beginning := 6X"3E";
  --sonst Format I


  --opcodes bra und bsi
  CONSTANT opc_bra: cmd_beginning := 6X"3C";
  CONSTANT opc_bsr: cmd_beginning := 6X"3D";


  --opcodes format b
  --------------------------------------------------------------------
  CONSTANT opc_beq:   opc_b_format := 3X"0";
  CONSTANT opc_bne:   opc_b_format := 3X"1";
  CONSTANT opc_blt:   opc_b_format := 3X"2";
  CONSTANT opc_bgt:   opc_b_format := 3X"3";
  CONSTANT opc_ble:   opc_b_format := 3X"4";
  CONSTANT opc_bge:   opc_b_format := 3X"5";
  CONSTANT opc_nop_b: opc_b_format := 3X"6";
  --------------------------------------------------------------------  

  --opcodes format r
  --------------------------------------------------------------------
  --Sprungbefehle
  CONSTANT opc_jmp: opc_r_format  := 6X"3C";
  CONSTANT opc_jsr: opc_r_format  := 6X"3D";
  --Arithmetisch mit 2 Quelloperanden
  CONSTANT opc_add: opc_r_format  := 6X"00";
  CONSTANT opc_addx: opc_r_format := 6X"20";
  CONSTANT opc_sub: opc_r_format  := 6X"02";
  CONSTANT opc_subx: opc_r_format := 6X"22";
  CONSTANT opc_cmpu: opc_r_format := 6X"08";
  CONSTANT opc_cmps: opc_r_format := 6X"09";
  --Logisch mit 2 Quelloperanden
  CONSTANT opc_and: opc_r_format  := 6X"04";
  CONSTANT opc_or: opc_r_format   := 6X"06";
  CONSTANT opc_xor: opc_r_format  := 6X"07";
  --Speicherbefehle mit 2 Quelloperanden
  CONSTANT opc_ldr: opc_r_format  := 6X"10";
  CONSTANT opc_str: opc_r_format  := 6X"14";
  --Befehle mit 1 Quelloperanden
  CONSTANT opc_lsl: opc_r_format  := 6X"28";
  CONSTANT opc_lsr: opc_r_format  := 6X"29";
  CONSTANT opc_asl: opc_r_format  := 6X"2A";
  CONSTANT opc_asr: opc_r_format  := 6X"2B";
  CONSTANT opc_rol_swaph: opc_r_format  := 6X"2C"; --gleicher OPC --> pruefe 4 downto 0
  CONSTANT opc_rol: opc_r_format_ext    := 5X"01";   --rol
  CONSTANT opc_swaph: opc_r_format_ext  := 5X"10"; --swaph
  CONSTANT opc_ror: opc_r_format    := 6X"2D";
  CONSTANT opc_extb: opc_r_format   := 6X"30";
  CONSTANT opc_exth: opc_r_format   := 6X"31";
  CONSTANT opc_swapb: opc_r_format  := 6X"32";
  CONSTANT opc_not: opc_r_format    := 6X"33";
  CONSTANT opc_nop_r: opc_r_format  := 6X"34";
  --------------------------------------------------------------------

    --opcodes format i
  --------------------------------------------------------------------
  --Arithmetisch mit 2 Quelloperanden
  CONSTANT opc_addi: opc_i_format := 6X"00";
  CONSTANT opc_addli: opc_i_format := 6X"01";
  CONSTANT opc_addhi: opc_i_format := 6X"02";
  CONSTANT opc_cmpui: opc_i_format := 6X"08";
  CONSTANT opc_cmpsi: opc_i_format := 6X"09";
  --Logisch mit 2 Quelloperanden
  CONSTANT opc_and0i: opc_i_format := 6X"04";
  CONSTANT opc_and1i: opc_i_format := 6X"05";
  CONSTANT opc_ori: opc_i_format := 6X"06";
  CONSTANT opc_xori: opc_i_format := 6X"07";
  --Speicherbefehle
  CONSTANT opc_ldd:   opc_i_format := 6X"10";
  CONSTANT opc_std:   opc_i_format := 6X"14";
  CONSTANT opc_nop_i: opc_i_format := 6X"15";
  --------------------------------------------------------------------
  
END isa_types;
