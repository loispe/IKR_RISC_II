--
-- vhdl architecture raro_ikr_risc_ii_lib.dbpu.behav
--
-- created:
--          by - kntntply.meyer (pc091)
--          at - 14:59:51 06/22/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of dbpu is
begin
  process (all) is
  begin
    dbta_valid <= '0';
    dbpu_pc <= rsbpu_pc_out;
    sel_alu_pc <= '0';
    
    case rdbpu_mode_out is
     when  dbpu_idle =>
       --do nothing
     when  relaypc =>
       sel_alu_pc <= '1';
     when  beq  =>
       if signed(rstoredata_in) = 0 then
          dbta_valid <= '1';
       end if;
     when  bne  =>
       if signed(rstoredata_in) /= 0 then
          dbta_valid <= '1';
       end if;
       --bne
     when  bgt  =>
       if  signed(rstoredata_in) > 0 then
          dbta_valid <= '1';
       end if;
     when  blt  =>
       if signed(rstoredata_in) < 0 then
          dbta_valid <= '1';
       end if;
     when  bge  =>
        if signed(rstoredata_in) >= 0  then
          dbta_valid <= '1';
        end if;
     when  ble  =>
        if signed(rstoredata_in) <= 0 then
            dbta_valid <= '1';
        end if;
     when  jmp  =>
       dbta_valid <= '1';
       dbpu_pc  <= mux_alu_b;
     when  jsr  =>
       dbta_valid <= '1';
       sel_alu_pc <= '1';
       dbpu_pc  <= mux_alu_b;
    end case;
  end  process;
end architecture behav;

