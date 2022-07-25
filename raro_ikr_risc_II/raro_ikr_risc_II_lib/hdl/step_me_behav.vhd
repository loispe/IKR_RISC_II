--
-- vhdl architecture raro_ikr_risc_ii_lib.step_me.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 14:17:51 05/25/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--


architecture behav of step_me is
  type mem is array (0 to 63) of word;
  signal ram_block :  mem;
  signal ram_out   :  word;
  signal q_storedata: word;
  
begin
  ram_access : process(clk, res_n) is
  variable addr    :  std_logic_vector(10 downto 0);
  begin
    if res_n = '0' then
      for i in ram_block'range loop
        ram_block(i) <= (others => '0');
      end loop;
    else
      if clk'event and clk ='1' then
        if rmemmode_out_me = mem_write then
          ram_block (to_integer(unsigned(ralu_out))) <= q_storedata;
        end if;
            ram_out <= ram_block(to_integer(unsigned(ralu_in(addr'range))));
      end if;
    end if;
  end process ram_access;
  

  rme_in <= ralu_out when rmemmode_out_me = mem_idle else ram_out; 
  
  with rfwd_selsd_out_me select
  q_storedata <=  rstoredata_out    when fwd_idle,
                  rme_out           when fwd_wb,
                  rstoredata_out    when others;
  
end architecture behav;

