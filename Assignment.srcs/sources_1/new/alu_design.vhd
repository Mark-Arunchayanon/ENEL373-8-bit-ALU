library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Author: Steve Weddell
-- Date: June 25, 2004
-- Purpose: VHDL Module for BCD to 7-segment Decoder
-- Usage: Laboratory 1; Example VHDL file for ENEL353


entity alu_design is
           --portmapping of components that are being used within our design
           --LED16 is used for the  
		   Port ( CLK100MHZ : in STD_LOGIC;
		          SW : in STD_LOGIC_VECTOR (7 downto 0);
		          LED : out STD_LOGIC_VECTOR (7 downto 0);
--		          LED16_B, LED16_G, LED16_R : out STD_LOGIC_VECTOR;
		          BTNU : in STD_LOGIC;
		          BTND : in STD_LOGIC;
		          BTNL : in STD_LOGIC
		          --alu_select : in STD_LOGIC_VECTOR (2 downto 0)

		        );		
end alu_design;


architecture Behavioral of alu_design is
signal alu_data_out: std_logic_vector (7 downto 0);
signal feedback: std_logic_vector (7 downto 0);
begin
	alu_design: process (CLK100MHZ)	
	 variable data_reg1 : std_logic_vector (7 downto 0);
     variable data_reg2 : std_logic_vector (7 downto 0);
     
     --variable data8_out : std_logic_vector (7 downto 0);
		begin
		 --if (reset = '1')then
		   --  data8_out <= X"00";
		 if (CLK100MHZ'Event and CLK100MHZ ='1') then 
		       if(BTNU = '1')then
		           data_reg1 := SW;
--		           LED16_B <= "1";
--		           LED16_G <= "0";
--		           LED16_R <= "0";
		           LED <= data_reg1;
		        end if;   
		        if(BTND = '1')then 
		           data_reg2 := SW;
--		           LED16_B <= "0";
--                   LED16_G <= "1";
--                   LED16_R <= "0";
                    LED <= data_reg2;
                end if;
		        if(BTNL = '1')then
--		           LED16_B <= '0';
--                    LED16_G <= '0';
--                    LED16_R <= '1';
                end if;
                C1: case SW is
                    when "00000001" => alu_data_out <= data_reg1 + data_reg2;
                    when "00000010"  => alu_data_out <= data_reg1 - data_reg2;
                    when "00000011"  => alu_data_out <= data_reg1 or data_reg2; 
                    when others => alu_data_out <= data_reg1 and data_reg2;
                end case C1;
                          
		  end if;
		  end process alu_design;
      LED <= alu_data_out;
--      LED <= "00000001";
end Behavioral;