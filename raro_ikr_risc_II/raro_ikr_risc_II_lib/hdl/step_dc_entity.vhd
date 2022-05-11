-- VHDL Entity raro_ikr_risc_II_lib.step_dc.interface
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 18:06:09 05/11/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;

ENTITY step_dc IS
   PORT( 
      wb_out_sDc : IN     std_logic_vector (15 DOWNTO 0);
      ex_in_ra   : OUT    std_logic_vector (15 DOWNTO 0);
      ex_in_rb   : OUT    std_logic_vector (15 DOWNTO 0);
      ex_in_rc   : OUT    std_logic_vector (15 DOWNTO 0)
   );

-- Declarations

END step_dc ;

