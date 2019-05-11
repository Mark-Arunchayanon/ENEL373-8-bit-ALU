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

entity register1 is
    Port ( 
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
        if (state1 = 1) then 
            stored_data <= sw1_input;
        end if;
        
        reg1_out <= stored_data;
    
    end process;
end Behavioral;
