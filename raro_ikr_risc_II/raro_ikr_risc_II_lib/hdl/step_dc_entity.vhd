-- VHDL Entity raro_ikr_risc_II_lib.step_dc.interface
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 16:55:56 05/24/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY step_dc IS
   PORT( 
      clk          : IN     std_logic;
      rME_out      : IN     word;
      rOpcode_out  : IN     word;
      res_n        : IN     std_logic;
      targetreg_wb : IN     word;
      rA_in        : OUT    word;
      rAluMode_in  : OUT    alu_mode_type;
      rB_in        : OUT    word;
      rC_in        : OUT    word
   );

-- Declarations

END step_dc ;
