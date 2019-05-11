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

entity register2 is
    Port ( 
           sw2_input : in STD_LOGIC_VECTOR(7 downto 0);
           state2 : in INTEGER;
           reg2_out : out STD_LOGIC_VECTOR(7 downto 0)
           );
end register2;

architecture Behavioral of register2 is

signal stored_data : STD_LOGIC_VECTOR(7 downto 0);

begin
    register2 : process (state2)
    begin
        if (state2 = 2) then 
            stored_data <= sw2_input;
        end if;
        
        reg2_out <= stored_data;
    
    end process;
    
end Behavioral;
