--
-- vhdl package header raro_ikr_risc_ii_lib.isa_types
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 14:54:55 05/18/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.internal_types.all;

package isa_types is
  subtype cmd_beginning is    std_logic_vector(31 downto 26); --erste 6 bit des befehls 
  subtype opc_i_format is     std_logic_vector(31 downto 26); --wenn i-format, dann steht opc am anfang
  subtype opc_r_format is     std_logic_vector(15 downto 10); --wenn r-format, dann steht opc an stellen 15-10
  subtype opc_r_format_ext is std_logic_vector(4 downto 0);   --wenn nur 1 quelloperand, dann unterscheiden sich die operationen an den stellen 4-0
  subtype opc_b_format is     std_logic_vector(20 downto 18); --b-befehle unterscheiden sich an den bits 20-18
  subtype opc_c_reg is        std_logic_vector(25 downto 21); --register c steht immer an derselben stelle (sofern vorhanden)
  subtype opc_b_reg is        std_logic_vector(20 downto 16); --register b steht immer an derselben stelle (sofern vorhanden)
  subtype opc_a_reg is        std_logic_vector(4 downto 0);   --register a steht immer an derselben stelle (sofern vorhanden)
  subtype imm16_type is       std_logic_vector(15 downto 0);  --16-bit-konstante
  subtype disp26_type is      std_logic_vector(25 downto 0);  --26-bit displacement bei branch-befehlen
  subtype disp18_type is      std_logic_vector(17 downto 0);  --18-bit displacement bei branch-befehlen
  
  --alu modes
  type alu_mode_type is (
                    alu_idle, alu_add, alu_sub, alu_lsl, alu_lsr, alu_asl, alu_asr, alu_rol, alu_ror,
                    alu_extb, alu_exth, alu_swapb, alu_swaph, alu_not, alu_jmp, alu_jsr,
                    alu_addx, alu_subx, alu_and, alu_or, alu_xor, alu_cmps, alu_cmpu
                    );

  --data mememoy modes                  
  type mem_mode_type is (
                    mem_idle, mem_read, mem_write
                  );           
  
  --forwarding modes                  
  type fwd_mode_type is (
                    fwd_idle, fwd_wb, fwd_me
                    );

  --konstanten zum unterscheiden zwischen i-format, r-format und b-format
  constant r_format : cmd_beginning := 6x"3f";
  constant b_format : cmd_beginning := 6x"3e";
  --sonst format i

  constant nop : word := (others => '0');

  --opcodes bra und bsi
  constant opc_bra: cmd_beginning := 6x"3c";
  constant opc_bsr: cmd_beginning := 6x"3d";


  --opcodes format b
  --------------------------------------------------------------------
  constant opc_beq:   opc_b_format := 3x"0";
  constant opc_bne:   opc_b_format := 3x"1";
  constant opc_blt:   opc_b_format := 3x"2";
  constant opc_bgt:   opc_b_format := 3x"3";
  constant opc_ble:   opc_b_format := 3x"4";
  constant opc_bge:   opc_b_format := 3x"5";
  constant opc_nop_b: opc_b_format := 3x"6";
  --------------------------------------------------------------------  

  --opcodes format r
  --------------------------------------------------------------------
  --sprungbefehle
  constant opc_jmp: opc_r_format  := 6x"3c";
  constant opc_jsr: opc_r_format  := 6x"3d";
  --arithmetisch mit 2 quelloperanden
  constant opc_add: opc_r_format  := 6x"00";
  constant opc_addx: opc_r_format := 6x"20";
  constant opc_sub: opc_r_format  := 6x"02";
  constant opc_subx: opc_r_format := 6x"22";
  constant opc_cmpu: opc_r_format := 6x"08";
  constant opc_cmps: opc_r_format := 6x"09";
  --logisch mit 2 quelloperanden
  constant opc_and: opc_r_format  := 6x"04";
  constant opc_or: opc_r_format   := 6x"06";
  constant opc_xor: opc_r_format  := 6x"07";
  --speicherbefehle mit 2 quelloperanden
  constant opc_ldr: opc_r_format  := 6x"10";
  constant opc_str: opc_r_format  := 6x"14";
  --befehle mit 1 quelloperanden
  constant opc_lsl: opc_r_format  := 6x"28";
  constant opc_lsr: opc_r_format  := 6x"29";
  constant opc_asl: opc_r_format  := 6x"2a";
  constant opc_asr: opc_r_format  := 6x"2b";
  constant opc_rol_swaph: opc_r_format  := 6x"2c"; --gleicher opc --> pruefe 4 downto 0
  constant opc_rol: opc_r_format_ext    := 5x"01";   --rol
  constant opc_swaph: opc_r_format_ext  := 5x"10"; --swaph
  constant opc_ror: opc_r_format    := 6x"2d";
  constant opc_extb: opc_r_format   := 6x"30";
  constant opc_exth: opc_r_format   := 6x"31";
  constant opc_swapb: opc_r_format  := 6x"32";
  constant opc_not: opc_r_format    := 6x"33";
  constant opc_nop_r: opc_r_format  := 6x"34";
  --------------------------------------------------------------------

    --opcodes format i
  --------------------------------------------------------------------
  --arithmetisch mit 2 quelloperanden
  constant opc_addi: opc_i_format := 6x"00";
  constant opc_addli: opc_i_format := 6x"01";
  constant opc_addhi: opc_i_format := 6x"02";
  constant opc_cmpui: opc_i_format := 6x"08";
  constant opc_cmpsi: opc_i_format := 6x"09";
  --logisch mit 2 quelloperanden
  constant opc_and0i: opc_i_format := 6x"04";
  constant opc_and1i: opc_i_format := 6x"05";
  constant opc_ori: opc_i_format := 6x"06";
  constant opc_xori: opc_i_format := 6x"07";
  --speicherbefehle
  constant opc_ldd:   opc_i_format := 6x"10";
  constant opc_std:   opc_i_format := 6x"14";
  constant opc_nop_i: opc_i_format := 6x"15";
  --------------------------------------------------------------------
  
end isa_types;
