--
-- VHDL Architecture raro_ikr_risc_II_lib.DEC_dc.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:42:05 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF DEC_dc IS
  signal reg_ME, reg_WB: reg_addr_type;
BEGIN
  decode: process (all) is
  variable format: cmd_beginning;
  variable disp26: disp26_type;
  variable disp18: disp18_type;
  variable reg_c: opc_c_reg;
  variable reg_b: opc_b_reg;
  variable opc_r: opc_r_format;
  variable opc_i: opc_i_format;
  variable imm16: imm16_type;
  variable opc_b: opc_b_format;
  variable extension: opc_r_format_ext;
  variable reg_a: opc_a_reg;
  
  
  --variable format: std_logic_vector(opc_format'range);
  --variable rc: std_logic_vector(opc_c_reg'range);
  
  begin
    format  := rOpcode_out(format'range);
    a_imm   <= (others => '0');
    sel_imm <= '0';
    sel_b   <= (others => '0');
    sel_c   <= (others => '0');
    rTargetReg_in_dc <= (others => '0');
    rMemMode_in_dc <= mem_idle;
    reg_WB <= reg_ME;
    
    --format := rOpcode_out(opc_format'range);
    
    case format is  --begin decoding
    when opc_bra =>
      disp26 := rOpcode_out(disp26'range);
      --do something
    when opc_bsr =>
      disp26 := rOpcode_out(disp26'range);
      --do something
      
--***************************************************************      
--B format:
    when b_format =>  --is b-command
      opc_b  := rOpcode_out(opc_b'range);
      disp18 := rOpcode_out(disp18'range);
      sel_c  <= rOpcode_out(reg_c'range);
      reg_ME <= (others => '0');  --no registers changed
      rTargetReg_in_dc <= rOpcode_out(reg_c'range);
      
      case opc_b is  --determine b-command
      when opc_beq =>
      when opc_bne =>
      when opc_blt =>
      when opc_bgt =>
      when opc_ble =>
      when opc_bge =>
      when others  => --no identifiable command
      end case;  --end b-command
      
--***************************************************************
--R format:  
    when r_format =>  --is r-command
      reg_b := rOpcode_out(reg_b'range);
      sel_b <= rOpcode_out(reg_b'range);
      opc_r := rOpcode_out(opc_r'range);
      
      if reg_b = reg_ME then
        fwd_sel_b <= ME;
      elsif reg_b = reg_WB then
        fwd_sel_b <= WB;
      else
        fwd_sel_b <= NONE;
      end if;

      case opc_r is --determine r-command or jump
      when opc_jmp =>
      when opc_jsr =>
      when others  =>
        sel_c <= rOpcode_out(reg_c'range);
        reg_ME <= rOpcode_out(reg_c'range); -- Speichere Zielregister für Forwarding
        rTargetReg_in_dc <= rOpcode_out(reg_c'range);
        
        case opc_r is --operations with 1 source operand
        when opc_lsl => rAluMode_in <= alu_lsl;
        when opc_lsr => rAluMode_in <= alu_lsr;
        when opc_asl => rAluMode_in <= alu_asl;
        when opc_asr => rAluMode_in <= alu_asr;
          
        when opc_rol_swaph =>
          extension := rOpcode_out(extension'range);
          
          if extension = opc_rol then
            rAluMode_in <= alu_rol;
          elsif extension = opc_swaph then
            rAluMode_in <= alu_swaph;
          else  --no identifiable command
            
          end if;
          
        when opc_ror    => rAluMode_in <= alu_ror;
        when opc_extb   => rAluMode_in <= alu_extb;
        when opc_exth   => rAluMode_in <= alu_exth;
        when opc_swapb  => rAluMode_in <= alu_swapb;
        when opc_not    => rAluMode_in <= alu_not;
        when others =>
          reg_a   := rOpcode_out(reg_a'range);
          sel_a   <= rOpcode_out(reg_a'range);
          sel_imm <= '0';

          if reg_a = reg_ME then
            fwd_sel_a <= ME;
          elsif reg_a = reg_WB then
            fwd_sel_a <= WB;
          else
            fwd_sel_a <= NONE;
          end if;

          case opc_r is -- arithmetic with 2 source operands
          when opc_add  => rAluMode_in <= alu_add;
          when opc_addx => rAluMode_in <= alu_addx;
          when opc_sub  => rAluMode_in <= alu_sub;
          when opc_subx => rAluMode_in <= alu_subx;
          when opc_cmpu => rAluMode_in <= alu_cmpu;
          when opc_cmps => rAluMode_in <= alu_cmps;
          when others =>
            
            case opc_r is
            -- logic with 2 source operands
            when opc_and => rAluMode_in <= alu_and;
            when opc_or =>  rAluMode_in <= alu_or;
            when opc_xor => rAluMode_in <= alu_xor;
            when others =>
              
              case opc_r is
                --load/store
                when opc_str => rAluMode_in <= alu_add; rTargetReg_in_dc <= (others => '0'); rMemMode_in_dc <= mem_write;
                                reg_ME <= (others => '0');  --no registers changed
                                fwd_sel_b <= NONE;
                                reg_c := rOpcode_out(reg_c'range); 
                                if reg_c = reg_ME then
                                  fwd_sel_c <= ME;
                                elsif reg_c = reg_WB then
                                  fwd_sel_c <= WB;
                                else
                                  fwd_sel_c <= NONE;
                                end if;
                when opc_ldr => rMemMode_in_dc <= mem_read;
                when others =>  --no identifiable command
              end case;
            end case;
          end case;
        end case; --end r-command
      end case; --end r-command or jump
      
--***************************************************************
--I format:
    when others =>  --is i-command
      opc_i            := format;
      sel_c            <= rOpcode_out(reg_c'range);
      reg_ME           <= rOpcode_out(reg_c'range);
      rTargetReg_in_dc <= rOpcode_out(reg_c'range);
      reg_b            := rOpcode_out(reg_b'range);
      sel_b            <= rOpcode_out(reg_b'range);
      imm16            := rOpcode_out(imm16'range);
      a_imm            <= imm16(imm16'left) & X"0000" & rOpcode_out(imm16'left-1 downto imm16'right); --erweitere vorzeichenrichtig
      sel_imm          <= '1';
      rMemMode_in_dc   <= mem_idle;

      if reg_b = reg_ME then
        fwd_sel_b <= ME;
      elsif reg_b = reg_WB then
        fwd_sel_b <= WB;
      else
        fwd_sel_b <= NONE;
      end if;
      
      case opc_i is --determine i-command
      ----arithmetic
      when opc_addi   =>  rAluMode_in <= alu_add;
      when opc_addli  =>  a_imm <= X"0000" & imm16; rAluMode_in <= alu_add;
      when opc_addhi  =>  a_imm <= imm16 & X"0000"; rAluMode_in <= alu_add;
      when opc_cmpui  =>  a_imm <= X"0000" & imm16; rAluMode_in <= alu_cmpu;
      when opc_cmpsi  =>  rAluMode_in <= alu_cmps;
      --logical
      when opc_and0i => a_imm <= X"0000" & imm16; rAluMode_in <= alu_and;
      when opc_and1i => a_imm <= X"FFFF" & imm16; rAluMode_in <= alu_and;
      when opc_ori   => a_imm <= X"0000" & imm16; rAluMode_in <= alu_or;
      when opc_xori  => a_imm <= X"0000" & imm16; rAluMode_in <= alu_xor;
      when opc_std   => rAluMode_in <= alu_add; 
                        rTargetReg_in_dc <= (others => '0'); 
                        rMemMode_in_dc <= mem_write;
                        reg_ME <= (others => '0');  --no registers changed
                        fwd_sel_b <= NONE;
                        if reg_c = reg_ME then
                          fwd_sel_c <= ME;
                        elsif reg_c = reg_WB then
                          fwd_sel_c <= WB;
                        else
                          fwd_sel_c <= NONE;
                        end if;
      when opc_ldd   => rAluMode_in <= alu_add; rMemMode_in_dc <= mem_read;
      when others => --no identifiable command
        a_imm <= (others => '0');
        sel_b <= (others => '0');
        sel_c <= (others => '0');
        rTargetReg_in_dc <= (others => '0');
      end case; --end determine i-command
--***************************************************************
    end case; --end decoder
      
      
  end process decode;
    
  
END ARCHITECTURE behav;

