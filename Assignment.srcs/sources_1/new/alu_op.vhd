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
           operation : in STD_LOGIC_VECTOR(1 downto 0);
           alu_out : out STD_LOGIC_VECTOR(7 downto 0)
           );
end alu_op;


architecture Behavioral of alu_op is

signal end_result : STD_LOGIC_VECTOR(7 downto 0);
signal op1 : STD_LOGIC_VECTOR(7 downto 0);
signal op2 : STD_LOGIC_VECTOR(7 downto 0);

begin

    alu : process (state3)
        begin
            op1 <= operand1;
            op2 <= operand2;
            if (state3 = 3) then
                C1: case SW(1 downto 0) is
                    when "00" => end_result <= op1 + op2;
                    when "01" => end_result <= op1 - op2;
                    when "10" => end_result <= op1 or op2; 
                    when "11" => end_result <= op1 and op2; 
                    when others => end_result <= end_result;
                end case C1;
            end if;
            alu_out <= end_result;
            
        end process alu;

end Behavioral;
