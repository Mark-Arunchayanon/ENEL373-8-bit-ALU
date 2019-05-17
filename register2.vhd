----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2019 02:54:34 PM
-- Design Name: 
-- Module Name: register1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Reads data from 8 switches, stores it as the second operand and outputs the operand
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity register2 is
    Port ( 
           btnc : in STD_LOGIC;
           sw2_input : in STD_LOGIC_VECTOR(7 downto 0);
           state2 : in INTEGER;
           reg2_out : out STD_LOGIC_VECTOR(7 downto 0)
           );
end register2;

architecture Behavioral of register2 is

begin
    register2 : process (state2)
    begin
        if (btnc = '1' and state2 = 2) then 
            reg2_out <= sw2_input;
        end if;
        
    end process register2;
    
end Behavioral;
