-- VHDL Entity raro_ikr_risc_II_lib.reg_wb.generatedInstance
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 18:37:10 05/11/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;

ENTITY reg_wb IS
   PORT( 
      wb_in_rMEout : IN     std_logic_vector (15 DOWNTO 0);
      wb_out_sDc   : OUT    std_logic_vector (15 DOWNTO 0)
   );

END reg_wb ;

