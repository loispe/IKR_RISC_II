-- VHDL Entity raro_ikr_risc_II_lib.mux_clock.interface
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 15:21:04 07/15/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY mux_clock IS
   PORT( 
      man_clk : IN     std_logic;
      res_n   : IN     std_logic;
      sel_clk : IN     std_logic;
      std_clk : IN     std_logic;
      clk     : OUT    std_logic
   );

-- Declarations

END mux_clock ;
