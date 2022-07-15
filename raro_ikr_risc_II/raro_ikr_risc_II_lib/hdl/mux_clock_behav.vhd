--
-- VHDL Architecture raro_ikr_risc_II_lib.mux_clock.behav
--
-- Created:
--          by - kntntply.meyer (pc091)
--          at - 14:33:07 07/13/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF mux_clock IS
  CONSTANT clk_div : integer := 25_000_000;
  SIGNAL   clk_sig : std_logic;
BEGIN
  divider: PROCESS(std_clk, res_n)IS
  VARIABLE cnt     : integer   := 0;
  VARIABLE cur_val : std_logic := '0';
  BEGIN
    
    IF res_n = '0' THEN
      clk_sig <= '0';
    ELSE
      IF std_clk'event AND std_clk = '1' THEN
        IF cnt = clk_div  THEN
          cnt := 0;
          IF cur_val = '1' THEN
            clk_sig <= '0';
          ELSE
            clk_sig <= '1';
          END IF;
          cur_val := NOT cur_val;
        ELSE
          cnt := cnt + 1;
        END IF;
      END IF;
    END IF;    
  END PROCESS divider;
    
  clk <= clk_sig WHEN sel_clk = '0' ELSE man_clk;
  
END ARCHITECTURE behav;

