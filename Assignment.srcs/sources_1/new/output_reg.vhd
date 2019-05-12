----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2019 21:02:35
-- Design Name: 
-- Module Name: output_reg - Behavioral
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

entity output_reg is
  Port (
        alu_in: in std_logic_vector (7 downto 0);
        reg3_out: out std_logic_vector (7 downto 0);
        state3: in INTEGER
        );
end output_reg;

architecture Behavioral of output_reg is


begin
     output_reg : process (state3)
     begin 
        if(state3 = 3) then
          reg3_out <= alu_in;
        end if;
        
        
       
    end process output_reg;
     
end Behavioral;
