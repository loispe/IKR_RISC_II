--
-- VHDL Package Header raro_ikr_risc_II_lib.internal_types
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:28:29 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE internal_types IS
  SUBTYPE word IS std_logic_vector(31 downto 0);
  CONSTANT memory_depth : positive := 4;
  
  
END internal_types;
