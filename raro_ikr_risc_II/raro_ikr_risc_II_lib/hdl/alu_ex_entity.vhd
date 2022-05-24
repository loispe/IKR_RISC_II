-- VHDL Entity raro_ikr_risc_II_lib.ALU_ex.interface
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 17:10:04 05/24/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.isa_types.ALL;
USE raro_ikr_risc_II_lib.internal_types.ALL;

ENTITY ALU_ex IS
   PORT( 
      mux_ALU_A    : IN     word;
      mux_ALU_B    : IN     word;
      rAluMode_out : IN     alu_mode_type;
      ALU_out      : OUT    word
   );

-- Declarations

END ALU_ex ;
