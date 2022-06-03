--
-- VHDL Architecture raro_ikr_risc_II_lib.step_if.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:07:35 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
use ieee.numeric_std.all;

ARCHITECTURE behav OF step_if IS
  type memory_type is array(0 to memory_depth - 1) of word;
  --type memory_type is array(natural range <>) of word;  --nicht synthetisierbar
  constant rom: memory_type :=  (
                                --0 => 6x"3F" & 5x"03" & 5x"02" & 6x"2D" & 5x"-" & 5x"01",                   --ror rc = 3 rb = 2 (b"1000_0000_0000_0000_0000_0000_0000_0001")
                                0 => 6x"3F" & 5x"9" & 5x"02" & 6x"14" & 5x"-" & 5x"02",    --str rc = 9 rb = 2 (=5) ra = 2 (=5) 
                                4 => 6x"3F" & 5x"8" & 5x"02" & 6x"10" & 5x"-" & 5x"02",    --ldr rc = 8 rb = 2 (=5) ra = 2 (=5)
                                8 => 6x"14" & 5x"9" & 5x"02" & 16d"11",                    --std
                                12 =>6x"10" & 5x"E" & 5x"02" & 16d"11",                    --ldd
                                --14 => 6x"3F" & 5x"04" & 5x"01" & 6x"02" & 5x"-" & 5x"3", --sub rc = 4 rb = 1 (=9) ra = 3 (=E)
                                /* 0 => 6x"3F" & 5x"3" & 5x"9" & 6x"00" & 5x"-" & 5x"A",   --add rc = 3 rb = 9 ra = 10 
                                1 => 6x"3F" & 5x"3" & 5x"9" & 6x"20" & 5x"-" & 5x"A",     --addx rc = 3 rb = 9 ra = 10 
                                2 => 6x"3F" & 5x"4" & 5x"A" & 6x"22" & 5x"-" & 5x"9",  --subx rc = 4 rb = 10 ra = 2
                                3 => 6x"3F" & 5x"4" & 5x"9" & 6x"02" & 5x"-" & 5x"A",  --sub rc = 4 rb = 9 ra = 10 
                                --Testing addx, subx
                                */
                                /*0 => 6x"01" & 5x"01" & 5x"00" & X"DDDD",
                                3 => 6X"02" & 5X"03" & 5X"01" & X"DDDD",  --testing addli and addhi
                                */
                                --10 =>  6x"3F" & 5x"3" & 5x"3" & 6x"00" & 5x"-" & 5x"1"
                                others => 32x"0"                                
                                
                                );
  
BEGIN
  
  rOpcode_in <= rom(to_integer(unsigned(rPc_out))) when to_integer(unsigned(rPc_out)) < memory_depth - 1 else 32x"0";

  --rOpcode_in <= rom(to_integer(unsigned(rPc_out)));

      
END ARCHITECTURE behav;

