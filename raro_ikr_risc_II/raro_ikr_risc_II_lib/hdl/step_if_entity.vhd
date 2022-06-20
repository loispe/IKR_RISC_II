-- VHDL Entity raro_ikr_risc_II_lib.step_if.interface
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 16:55:25 05/24/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY step_if IS
   PORT( 
      rPc_out    : IN     word;
      sbta_valid : IN     std_logic;
      --dbta_valid : IN     std_logic;
      rOpcode_in : OUT    word
   );

-- Declarations

END step_if ;

