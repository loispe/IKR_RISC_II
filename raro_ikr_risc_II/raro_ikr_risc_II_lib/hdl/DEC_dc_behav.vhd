--
-- vhdl architecture raro_ikr_risc_ii_lib.dec_dc.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 14:42:05 05/18/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of dec_dc is
begin
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
  variable sel_rme_in: reg_addr_type;
  variable sel_rwb_in: reg_addr_type;
  
  --variable format: std_logic_vector(opc_format'range);
  --variable rc: std_logic_vector(opc_c_reg'range);
  
  begin
    format            := ropcode_out(format'range);
    a_imm             <= (others => '0');
    sel_imm           <= '0';
	  sel_a             <= (others => '0');
    sel_b             <= (others => '0');
    sel_c             <= (others => '0');
    rtargetreg_in_dc  <= (others => '0');
    rmemmode_in_dc    <= mem_idle;
    rfwd_sela_in_dc   <= fwd_idle;
    rfwd_selb_in_dc   <= fwd_idle;
    rfwd_selc_in_dc   <= fwd_idle;
    rfwd_selsd_in_dc  <= fwd_idle;     
    sel_rme_in        := rtargetreg_out_ex;
    sel_rwb_in        := rtargetreg_out_me;
    stall_dc          <= '0';
    disp              <= (others => '0');
    sbpu_mode         <= idle;
    rdbpu_mode_in     <= dbpu_idle;
	  ralumode_in		    <= alu_idle;
	  reg_a				      := (others => '0');
	  reg_b				      := (others => '0');
  	reg_c				      := (others => '0');

    
    -- if dbta valid then we're flushing
    if dbta_valid = '0' then  
      --begin decoding
      case format is    
      when opc_bra =>
        disp26 := ropcode_out(disp26'range);
        --set branch modes
        sbpu_mode <= st_uncnd;
        rdbpu_mode_in <= dbpu_idle;
        --erweitere vorzeichenrichtig
        disp(disp26'left downto disp26'right) <= disp26;          
        disp(disp'left downto disp26'left+1) <= (others => disp26(disp26'left));

        sel_c  <= ropcode_out(reg_c'range);

      when opc_bsr =>
        disp26 := ropcode_out(disp26'range);
        --set branch modes
        sbpu_mode <= st_uncnd;
        rdbpu_mode_in <= relaypc;
        
        --expand "sign correct"
        disp(disp26'left downto disp26'right) <= disp26;
        disp(disp'left downto disp26'left+1) <= (others => disp26(disp26'left));
        
        --save nextpc
        rtargetreg_in_dc <= (others => '1');
        sel_c  <= ropcode_out(reg_c'range);

        
  --***************************************************************      
  --b format:
      when b_format =>  --is b-command
        opc_b  := ropcode_out(opc_b'range);
        disp18 := ropcode_out(disp18'range);
        sel_c  <= ropcode_out(reg_c'range);
        reg_c  := ropcode_out(reg_c'range);
        rtargetreg_in_dc <= ropcode_out(reg_c'range);
        
        --check for read after load dependency --> Stall dc-stage and introduce nop if neccessary 
        if rmemmode_out_ex = mem_read and rtargetreg_out_ex = reg_c then
          stall_dc <= '1';
          opc_b    := opc_nop_b;
        end if;
        
        --check for forwarding
        if reg_c = 5x"0" then
          rfwd_selc_in_dc <= fwd_idle;
        elsif reg_c = sel_rme_in then
          rfwd_selc_in_dc <= fwd_me;
        elsif reg_c = sel_rwb_in then
          rfwd_selc_in_dc <= fwd_wb;
        else
          rfwd_selc_in_dc <= fwd_idle;
        end if;
        
         --expand "sign correct"
        disp(disp18'left downto disp18'right) <= disp18;
        disp(disp'left downto disp18'left+1) <= (others => disp18(disp18'left));
        
        case opc_b is  --determine b-command
        when opc_beq =>
          sbpu_mode <= st_cnd;
          rdbpu_mode_in <= beq;
        when opc_bne =>
          sbpu_mode <= st_cnd;
          rdbpu_mode_in <= bne;
        when opc_blt =>
          sbpu_mode <= st_cnd;
          rdbpu_mode_in <= blt;
        when opc_bgt =>
          sbpu_mode <= st_cnd;
          rdbpu_mode_in <= bgt;
        when opc_ble =>
          sbpu_mode <= st_cnd;
          rdbpu_mode_in <= ble;
        when opc_bge =>
          sbpu_mode <= st_cnd;
          rdbpu_mode_in <= bge;
          
        when others  => --nop
          ralumode_in <= alu_add;
          sel_a       <= (others => '0');
          sel_b       <= (others => '0');
          sel_c       <= (others => '0');
          rtargetreg_in_dc <= (others => '0');
          
        end case;  --end b-command
        
  --**************************************************************
  --r format:  
      when r_format =>  --is r-command
        reg_b := ropcode_out(reg_b'range);
        sel_b <= ropcode_out(reg_b'range);
        opc_r := ropcode_out(opc_r'range);
        
        --check for forwarding
        if reg_b = 5x"0" then
          rfwd_selb_in_dc <= fwd_idle;
        elsif reg_b = sel_rme_in then
          rfwd_selb_in_dc <= fwd_me;
        elsif reg_b = sel_rwb_in then
          rfwd_selb_in_dc <= fwd_wb;
        else
          rfwd_selb_in_dc <= fwd_idle;
        end if;
        
        --check for read after load dependency --> Stall dc-stage and introduce nop if neccessary 
        if rmemmode_out_ex = mem_read and (rtargetreg_out_ex = reg_a or rtargetreg_out_ex = reg_b) and opc_r /= opc_str then
          stall_dc <= '1';
          opc_r    := opc_nop_r;
        end if;

        case opc_r is --determine r-command or jump
        when opc_jmp =>
          rdbpu_mode_in <= jmp;
        when opc_jsr =>
          rdbpu_mode_in <= jsr;
          rtargetreg_in_dc <= (others => '1');          
        when others  =>
          sel_c <= ropcode_out(reg_c'range);
          rtargetreg_in_dc <= ropcode_out(reg_c'range);
          
          case opc_r is --operations with 1 source operand
          when opc_lsl => ralumode_in <= alu_lsl;
          when opc_lsr => ralumode_in <= alu_lsr;
          when opc_asl => ralumode_in <= alu_asl;
          when opc_asr => ralumode_in <= alu_asr;
          when opc_rol_swaph =>
            extension := ropcode_out(extension'range);
        
            if extension = opc_rol then
              ralumode_in <= alu_rol;
            elsif extension = opc_swaph then
              ralumode_in <= alu_swaph;
            else  --no identifiable command
            end if;
            
          when opc_ror    => ralumode_in <= alu_ror;
          when opc_extb   => ralumode_in <= alu_extb;
          when opc_exth   => ralumode_in <= alu_exth;
          when opc_swapb  => ralumode_in <= alu_swapb;
          when opc_not    => ralumode_in <= alu_not;
          when others =>
            reg_a   := ropcode_out(reg_a'range);
            sel_a   <= ropcode_out(reg_a'range);
            sel_imm <= '0';
            
            --check for forwarding <-- double check if this is neccessary, since it is already defined for r-types above
            if reg_a = 5x"0" then
              rfwd_sela_in_dc <= fwd_idle;
            elsif reg_a = sel_rme_in then
              rfwd_sela_in_dc <= fwd_me;
            elsif reg_a = sel_rwb_in then
              rfwd_sela_in_dc <= fwd_wb;
            else
              rfwd_sela_in_dc <= fwd_idle;
            end if;

            case opc_r is -- arithmetic with 2 source operands
            when opc_add  => ralumode_in <= alu_add;
            when opc_addx => ralumode_in <= alu_addx;
            when opc_sub  => ralumode_in <= alu_sub;
            when opc_subx => ralumode_in <= alu_subx;
            when opc_cmpu => ralumode_in <= alu_cmpu;
            when opc_cmps => ralumode_in <= alu_cmps;
            when others =>
              
              case opc_r is -- logic with 2 source operands
              when opc_and => ralumode_in <= alu_and;
              when opc_or =>  ralumode_in <= alu_or;
              when opc_xor => ralumode_in <= alu_xor;
              when others =>
                
                case opc_r is --load/store
                  when opc_str => ralumode_in <= alu_add; rtargetreg_in_dc <= (others => '0'); rmemmode_in_dc <= mem_write;
                                  rfwd_selb_in_dc <= fwd_idle;
                                  reg_c := ropcode_out(reg_c'range); 
                                  
                                  if reg_c = 5x"0" then
                                    rfwd_selsd_in_dc <= fwd_idle;
                                  elsif reg_c = sel_rme_in then
                                    rfwd_selsd_in_dc <= fwd_wb;
                                  else
                                    rfwd_selsd_in_dc <= fwd_idle;
                                  end if;
                  when opc_ldr => rmemmode_in_dc <= mem_read;
                  when others =>  --nop
                    ralumode_in <= alu_add;
                    sel_a       <= (others => '0');
                    sel_b       <= (others => '0');
                    sel_c       <= (others => '0');
                    rtargetreg_in_dc <= (others => '0');
                    
                end case;
              end case;
            end case;
          end case; --end r-command
        end case; --end r-command or jump
        
  --***************************************************************
  --i format:
      when others =>  --is i-command
        opc_i            := format;
        sel_c            <= ropcode_out(reg_c'range);
        reg_c            := ropcode_out(reg_c'range);
        rtargetreg_in_dc <= ropcode_out(reg_c'range);
        reg_b            := ropcode_out(reg_b'range);
        sel_b            <= ropcode_out(reg_b'range);
        imm16            := ropcode_out(imm16'range);
        a_imm            <= x"0000" & imm16; --erweitere vorzeichenlos
        sel_imm          <= '1';
        rmemmode_in_dc   <= mem_idle;
        
        --check for forwarding
        if reg_b = 5x"0" then
          rfwd_selb_in_dc <= fwd_idle;
        elsif reg_b = sel_rme_in then
          rfwd_selb_in_dc <= fwd_me;
        elsif reg_b = sel_rwb_in then
          rfwd_selb_in_dc <= fwd_wb;
        else
          rfwd_selb_in_dc <= fwd_idle;
        end if;
        
        --check for read after load dependency
        if rmemmode_out_ex = mem_read and rtargetreg_out_ex = reg_b and opc_i /= opc_std then
          stall_dc <= '1';
          opc_i    := opc_nop_i;
        end if;
        
        case opc_i is --determine i-command
        ----arithmetic
        when opc_addi   =>  ralumode_in <= alu_add; 
                            a_imm(a_imm'left downto imm16'left+1) <= (others => imm16(imm16'left));           
        when opc_addli  =>  ralumode_in <= alu_add;
        when opc_addhi  =>  a_imm <= imm16 & x"0000"; ralumode_in <= alu_add;
        when opc_cmpui  =>  ralumode_in <= alu_cmpu;
        when opc_cmpsi  =>  ralumode_in <= alu_cmps; 
                            a_imm(a_imm'left downto imm16'left+1) <= (others => imm16(imm16'left));
        --logical
        when opc_and0i => ralumode_in <= alu_and;
        when opc_and1i => a_imm <= x"ffff" & imm16; ralumode_in <= alu_and;
        when opc_ori   => ralumode_in <= alu_or;
        when opc_xori  => ralumode_in <= alu_xor;
        when opc_std   => ralumode_in <= alu_add; 
                          rtargetreg_in_dc <= (others => '0'); 
                          rmemmode_in_dc <= mem_write;
                          rfwd_selc_in_dc <= fwd_idle;

                          if reg_c = 5x"0" then
                            rfwd_selsd_in_dc <= fwd_idle; 
                          elsif reg_c = sel_rme_in then
                            rfwd_selsd_in_dc <= fwd_wb;
                          else
                            rfwd_selsd_in_dc <= fwd_idle;
                          end if;

        when opc_ldd   => ralumode_in <= alu_add; rmemmode_in_dc <= mem_read;
        when others => --no identifiable command
          ralumode_in <= alu_add;
          sel_a       <= (others => '0');
          sel_b       <= (others => '0');
          sel_c       <= (others => '0');
          rtargetreg_in_dc <= (others => '0');
        end case; --end determine i-command
  --***************************************************************
      end case; --end decoder
    end if;    --executes nop if dbta valid
  end process decode;
end architecture behav;

