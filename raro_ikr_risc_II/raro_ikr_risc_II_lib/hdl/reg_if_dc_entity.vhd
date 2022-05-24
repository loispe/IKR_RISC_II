-- VHDL Entity raro_ikr_risc_II_lib.reg_if_dc.interface
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 16:55:25 05/24/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY reg_if_dc IS
   PORT( 
      clk           : IN     std_logic;
      rOpcode_in    : IN     word;
      rPc_in        : IN     word;
      res_n         : IN     std_logic;
      rNextPc_in_dc : OUT    word;
      rOpcode_out   : OUT    word
   );

-- Declarations

END reg_if_dc ;

