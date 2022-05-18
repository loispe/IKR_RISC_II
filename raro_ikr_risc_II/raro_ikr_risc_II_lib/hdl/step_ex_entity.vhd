-- VHDL Entity raro_ikr_risc_II_lib.step_ex.interface
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:08:29 05/18/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;

ENTITY step_ex IS
   PORT( 
      rA_out        : IN     std_logic_vector (15 DOWNTO 0);
      rB_out        : IN     std_logic_vector (15 DOWNTO 0);
      rC_out        : IN     std_logic_vector (15 DOWNTO 0);
      rNextPC_out   : IN     std_logic_vector (15 DOWNTO 0);
      rALU_in       : OUT    std_logic_vector (15 DOWNTO 0);
      rStoreData_in : OUT    std_logic_vector (15 DOWNTO 0)
   );

-- Declarations

END step_ex ;

