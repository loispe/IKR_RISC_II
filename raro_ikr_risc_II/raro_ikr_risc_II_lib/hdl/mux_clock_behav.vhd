--
-- vhdl architecture raro_ikr_risc_ii_lib.mux_clock.behav
--
-- created:
--          by - kntntply.meyer (pc091)
--          at - 14:33:07 07/13/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of mux_clock is
  constant clk_div : integer := 25_000_000;
  signal   clk_sig : std_logic;
begin
  divider: process(std_clk, res_n)is
  variable cnt     : integer   := 0;
  variable cur_val : std_logic := '0';
  begin
    
    if res_n = '0' then
      clk_sig <= '0';
    else
      if std_clk'event and std_clk = '1' then
        if cnt = clk_div  then
          cnt := 0;
          if cur_val = '1' then
            clk_sig <= '0';
          else
            clk_sig <= '1';
          end if;
          cur_val := not cur_val;
        else
          cnt := cnt + 1;
        end if;
      end if;
    end if;    
  end process divider;
    
  clk <= clk_sig when sel_clk = '0' else man_clk;
  
end architecture behav;

