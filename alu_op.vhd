----------------------------------------------------------------------------------

-- Engineer: Saranya Ramani (27179399), Nathan James (44005459), Mark Pakorn Arunchyanon (78980462)
-- 
-- Create Date: 12/04/2019
-- Design Name: alu_op
-- Module Name: ALU + REGS + FSM

-- Description: ALU takes in operands from first and second register, operation from 2 switches and state from FSM.
--              Carries out the operation with the 2 operands and outputs the result 
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity alu_op is
    Port ( 
           btnd : in STD_LOGIC;
           state3 : in INTEGER;
           operand1 : in STD_LOGIC_VECTOR(7 downto 0);
           operand2 : in STD_LOGIC_VECTOR(7 downto 0);
           operation : in STD_LOGIC_VECTOR(1 downto 0);
           alu_out : out STD_LOGIC_VECTOR(7 downto 0)
           );
end alu_op;


architecture Behavioral of alu_op is



begin

    alu : process (state3)
    variable end_result : STD_LOGIC_VECTOR(7 downto 0);
        begin
            if (state3 = 3 and btnd = '1') then
                C1: case operation is
                    when "00" => end_result := operand1 + operand2;
                    when "01" => end_result := operand1 - operand2;
                    when "10" => end_result := operand1 or operand2;  
                    when others => end_result := operand1 and operand2;
                end case C1;
                alu_out <= end_result;
            end if;
            
    end process alu;

end Behavioral;
