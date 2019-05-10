----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2019 23:05:11
-- Design Name: 
-- Module Name: alu_op - Behavioral
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

entity alu_op is
    Port ( 
           state3 : in INTEGER;
           operand1 : in STD_LOGIC_VECTOR(7 downto 0);
           operand2 : in STD_LOGIC_VECTOR(7 downto 0);
           operation : in STD_LOGIC_VECTOR(7 downto 0);
           alu_out : out STD_LOGIC_VECTOR(7 downto 0)
           );
end alu_op;

architecture Behavioral of alu_op is

begin


end Behavioral;
