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
  SUBTYPE opc_format IS std_logic_vector(31 downto 26);
  SUBTYPE opc_c_reg IS std_logic_vector(25 downto 21);
  SUBTYPE opc_b_reg IS std_logic_vector(20 downto 16);
  SUBTYPE opc_a_reg IS std_logic_vector(4 downto 0);
  SUBTYPE opc_imm IS std_logic_vector(31 downto 0);
  
  --alu modes
  TYPE alu_mode_type IS (add, sub);
  

  --opcodes format u
  CONSTANT opc_addi: std_logic_vector(opc_format'range) := b"000000";
  
END isa_types;
