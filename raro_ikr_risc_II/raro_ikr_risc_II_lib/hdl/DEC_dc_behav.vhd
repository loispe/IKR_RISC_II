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
  variable sel_rME_in: reg_addr_type;
  variable sel_rWB_in: reg_addr_type;
  
  --variable format: std_logic_vector(opc_format'range);
  --variable rc: std_logic_vector(opc_c_reg'range);
  
  begin
    format  := rOpcode_out(format'range);
    a_imm   <= (others => '0');
    sel_imm <= '0';
	 sel_a   <= (others => '0');
    sel_b   <= (others => '0');
    sel_c   <= (others => '0');
    rTargetReg_in_dc  <= (others => '0');
    rMemMode_in_dc    <= mem_idle;
    rFwd_sela_in_dc   <= fwd_idle;
    rFwd_selb_in_dc   <= fwd_idle;
    rFwd_selc_in_dc   <= fwd_idle;
    rFwd_selsd_in_dc  <= fwd_idle;     
    sel_rME_in        := rTargetReg_out_ex;
    sel_rWB_in        := rTargetReg_out_me;
    stall_dc          <= '0';
    disp              <= (others => '0');
    sbpu_mode         <= idle;
    rDbpu_mode_in     <= dbpu_idle;
	 rAluMode_in		 <= alu_idle;
	 reg_a				 := (others => '0');
	 reg_b				 := (others => '0');
	 reg_c				 := (others => '0');

    
    -- if dbta valid then we're flushing
    IF dbta_valid = '0' THEN  
    
      case format is  --begin decoding
      when opc_bra =>
        disp26 := rOpcode_out(disp26'range);
        sbpu_mode <= st_uncnd;
        rDbpu_mode_in <= dbpu_idle;
        disp <= disp26(disp26'left) & 6X"0" & disp26(disp26'left-1 downto disp26'right);
        sel_c  <= rOpcode_out(reg_c'range);
        
      when opc_bsr =>
        disp26 := rOpcode_out(disp26'range);
        sbpu_mode <= st_uncnd;
        rDbpu_mode_in <= relayPC;
        disp <= disp26(disp26'left) & 6X"0" & disp26(disp26'left-1 downto disp26'right);
        --save nextPC
        rTargetReg_in_dc <= (others => '1');
        sel_c  <= rOpcode_out(reg_c'range);

        
  --***************************************************************      
  --B format:
      when b_format =>  --is b-command
        opc_b  := rOpcode_out(opc_b'range);
        disp18 := rOpcode_out(disp18'range);
        sel_c  <= rOpcode_out(reg_c'range);
        reg_c  := rOpcode_out(reg_c'range);
        rTargetReg_in_dc <= rOpcode_out(reg_c'range);
        
        if rMemMode_out_ex = mem_read and rTargetReg_out_ex = reg_c then
          stall_dc <= '1';
          opc_b    := opc_nop_b;
        end if;
        
        
        case opc_b is  --determine b-command
        when opc_beq =>
          sbpu_mode <= st_cnd;
          rDbpu_mode_in <= beq;
        when opc_bne =>
          sbpu_mode <= st_cnd;
          rDbpu_mode_in <= bne;
        when opc_blt =>
          sbpu_mode <= st_cnd;
          rDbpu_mode_in <= blt;
        when opc_bgt =>
          sbpu_mode <= st_cnd;
          rDbpu_mode_in <= bgt;
        when opc_ble =>
          sbpu_mode <= st_cnd;
          rDbpu_mode_in <= ble;
        when opc_bge =>
          sbpu_mode <= st_cnd;
          rDbpu_mode_in <= bge;
          
        when others  => --NOP
          rAluMode_in <= alu_add;
          sel_a       <= (others => '0');
          sel_b       <= (others => '0');
          sel_c       <= (others => '0');
          rTargetReg_in_dc <= (others => '0');
          
        end case;  --end b-command
        
  --**************************************************************
  --R format:  
      when r_format =>  --is r-command
        reg_b := rOpcode_out(reg_b'range);
        sel_b <= rOpcode_out(reg_b'range);
        opc_r := rOpcode_out(opc_r'range);
        
        if reg_b = 5X"0" then
          rFwd_selb_in_dc <= fwd_idle;
        elsif reg_b = sel_rME_in then
          rFwd_selb_in_dc <= fwd_ME;
        elsif reg_b = sel_rWB_in then
          rFwd_selb_in_dc <= fwd_WB;
        else
          rFwd_selb_in_dc <= fwd_idle;
        end if;
        
        if rMemMode_out_ex = mem_read and (rTargetReg_out_ex = reg_a or rTargetReg_out_ex = reg_b) and opc_r /= opc_str then
          stall_dc <= '1';
          opc_r    := opc_nop_r;
        end if;

        case opc_r is --determine r-command or jump
        when opc_jmp =>
          rDbpu_mode_in <= jmp;
        when opc_jsr =>
          rDbpu_mode_in <= jsr;
          rTargetReg_in_dc <= (others => '1');
          
          --save nextPC
          
        when others  =>
          sel_c <= rOpcode_out(reg_c'range);
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
            
            if reg_a = 5X"0" then
              rFwd_sela_in_dc <= fwd_idle;
            elsif reg_a = sel_rME_in then
              rFwd_sela_in_dc <= fwd_ME;
            elsif reg_a = sel_rWB_in then
              rFwd_sela_in_dc <= fwd_WB;
            else
              rFwd_sela_in_dc <= fwd_idle;
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
                                  rFwd_selb_in_dc <= fwd_idle;
                                  reg_c := rOpcode_out(reg_c'range); 
                                  
                                  if reg_c = 5X"0" then
                                    rFwd_selsd_in_dc <= fwd_idle;
                                  elsif reg_c = sel_rME_in then
                                    rFwd_selsd_in_dc <= fwd_WB;
                                  else
                                    rFwd_selsd_in_dc <= fwd_idle;
                                  end if;
                  when opc_ldr => rMemMode_in_dc <= mem_read;
                  when others =>  --NOP
                    rAluMode_in <= alu_add;
                    sel_a       <= (others => '0');
                    sel_b       <= (others => '0');
                    sel_c       <= (others => '0');
                    rTargetReg_in_dc <= (others => '0');
                    
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
        reg_c            := rOpcode_out(reg_c'range);
        rTargetReg_in_dc <= rOpcode_out(reg_c'range);
        reg_b            := rOpcode_out(reg_b'range);
        sel_b            <= rOpcode_out(reg_b'range);
        imm16            := rOpcode_out(imm16'range);
        a_imm            <= imm16(imm16'left) & X"0000" & rOpcode_out(imm16'left-1 downto imm16'right); --erweitere vorzeichenrichtig
        sel_imm          <= '1';
        rMemMode_in_dc   <= mem_idle;

        if reg_b = 5X"0" then
          rFwd_selb_in_dc <= fwd_idle;
        elsif reg_b = sel_rME_in then
          rFwd_selb_in_dc <= fwd_ME;
        elsif reg_b = sel_rWB_in then
          rFwd_selb_in_dc <= fwd_WB;
        else
          rFwd_selb_in_dc <= fwd_idle;
        end if;
        
        if rMemMode_out_ex = mem_read and rTargetReg_out_ex = reg_b and opc_i /= opc_std then
          stall_dc <= '1';
          opc_i    := opc_nop_i;
          
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
                          rFwd_selc_in_dc <= fwd_idle;

                          if reg_c = 5X"0" then
                            rFWd_selsd_in_dc <= fwd_idle; 
                          elsif reg_c = sel_rME_in then
                            rFWd_selsd_in_dc <= fwd_WB;
                          else
                            rFwd_selsd_in_dc <= fwd_idle;
                          end if;

                          
        when opc_ldd   => rAluMode_in <= alu_add; rMemMode_in_dc <= mem_read;
        when others => --no identifiable command
          rAluMode_in <= alu_add;
          sel_a       <= (others => '0');
          sel_b       <= (others => '0');
          sel_c       <= (others => '0');
          rTargetReg_in_dc <= (others => '0');
        end case; --end determine i-command
  --***************************************************************
      end case; --end decoder
      
    END IF;    --executes NOP if dbta valid
  end process decode;
    
  
END ARCHITECTURE behav;

