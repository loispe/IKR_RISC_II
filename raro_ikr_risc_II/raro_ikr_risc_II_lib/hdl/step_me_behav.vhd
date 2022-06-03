--
-- VHDL Architecture raro_ikr_risc_II_lib.step_me.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:17:51 05/25/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--


ARCHITECTURE behav OF step_me IS
  TYPE MEM IS ARRAY (0 to 31) of word;
  signal ram_block :  MEM;
  signal ram_out   :  word;
  signal q_storeData: word;
BEGIN
  ram_access : process(clk, res_n) is
  begin
    if res_n = '0' then
      for i in ram_block'range loop
        ram_block(i) <= (others => '0');
      end loop;
    else
      if clk'event and clk ='1' then
        if rMemMode_out_me = mem_write then
          ram_block (to_integer(unsigned(rALU_out))) <= q_storeData;
        --elsif rMemMode_out = mem_read then
          --ram_out <= ram_block(rALU_in);
        end if;
          ram_out <= ram_block(to_integer(unsigned(rALU_in)));
      end if;
    end if;
  end process ram_access;
  

  rME_in <= rALU_out when rMemMode_out_me = mem_idle else ram_out; 
  
  with rFwd_selsd_out_me select
  q_storeData <=  rStoreData_out    when fwd_idle,
                  rME_out           when fwd_rME,
                  rStoreData_out    when others;
  
END ARCHITECTURE behav;

