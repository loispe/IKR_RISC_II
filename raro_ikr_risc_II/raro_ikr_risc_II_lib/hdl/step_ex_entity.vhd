-- VHDL Entity raro_ikr_risc_II_lib.step_ex.interface
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:12:45 05/25/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY step_ex IS
   PORT( 
      rALU_out         : IN     word;
      rA_out           : IN     word;
      rAluMode_out     : IN     alu_mode_type;
      rB_out           : IN     word;
      rC_out           : IN     word;
      rFwd_sela_out_ex : IN     std_logic;
      rFwd_selb_out_ex : IN     std_logic;
      rFwd_selc_out_ex : IN     std_logic;
      rME_out          : IN     word;
      rNextPC_out_ex   : IN     word;
      rALU_in          : OUT    word;
      rStoreData_in    : OUT    word
   );

-- Declarations

END step_ex ;

