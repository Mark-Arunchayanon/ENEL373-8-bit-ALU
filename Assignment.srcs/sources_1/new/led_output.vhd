----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2019 21:24:44
-- Design Name: 
-- Module Name: led_output - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_output is
        Port ( 
               states : in INTEGER;
               reg1 : in STD_LOGIC_VECTOR(7 downto 0);
               reg2 : in STD_LOGIC_VECTOR(7 downto 0);
               alu_out : in STD_LOGIC_VECTOR(7 downto 0);
               led : out STD_LOGIC_VECTOR(7 downto 0)
               );
end led_output;

architecture Behavioral of led_output is

signal output : STD_LOGIC_VECTOR(7 downto 0);

begin
    led_proc : process (states)
        begin
            if (states = 0) then 
                output <= "00000000";
            elsif (states = 1) then
                output <= reg1;
            elsif (states = 2) then 
                output <= reg2;
            elsif (states = 3) then
                output <= alu_out;
            end if;
            
            led <= output;
            
    end process led_proc;
end Behavioral;
