-- VHDL Entity raro_ikr_risc_II_lib.reg_me_wb.generatedInstance
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 18:07:42 05/24/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY reg_me_wb IS
   PORT( 
      rME_in       : IN     std_logic_vector (15 DOWNTO 0);
      rME_out      : OUT    word;
      targetreg_wb : OUT    word
   );

END reg_me_wb ;
