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
-- Description: Reads data from 8 switches, stores it as the first operand and outputs the operand
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


entity register1 is
    Port ( 
           btnu : in STD_LOGIC;
           sw1_input : in STD_LOGIC_VECTOR(7 downto 0);
           state1 : in INTEGER;
           reg1_out : out STD_LOGIC_VECTOR(7 downto 0)
           );
end register1;

architecture Behavioral of register1 is

signal stored_data : STD_LOGIC_VECTOR(7 downto 0);

begin
    register1 : process (state1)
    begin
        if (btnu = '1' and state1 = 1) then 
            reg1_out <= sw1_input;
        end if;
    
    end process register1;
end Behavioral;
