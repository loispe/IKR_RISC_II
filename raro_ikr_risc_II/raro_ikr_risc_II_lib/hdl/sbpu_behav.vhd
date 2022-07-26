--
-- vhdl architecture raro_ikr_risc_ii_lib.sbpu.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 13:52:36 06/15/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of sbpu is
begin
  process(all) is
  begin
    case sbpu_mode is
      when  st_uncnd =>
              rsbpu_pc_in <= std_logic_vector(signed(rnextpc_in_dc) + signed(disp));
              sbta_valid <= '1';
      when  st_cnd  =>  
              rsbpu_pc_in <= std_logic_vector(signed(rnextpc_in_dc) + signed(disp));
              sbta_valid <= '0';
      when  others  =>
              rsbpu_pc_in <= rnextpc_in_dc;
              sbta_valid <= '0';
    end case;
  end process;
end architecture behav;

