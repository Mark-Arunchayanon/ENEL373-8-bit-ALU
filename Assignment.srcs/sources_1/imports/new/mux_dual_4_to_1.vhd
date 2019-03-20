----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 14:42:30
-- Design Name: 
-- Module Name: mux_dual_4_to_1 - 
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

entity mux_dual_4_to_1 is
port (
            a1 : in std_logic_vector(2 downto 0);
            a2 : in std_logic_vector(2 downto 0);
            a3 : in std_logic_vector(2 downto 0);
            a4 : in std_logic_vector(2 downto 0);
            sel : in std_logic_vector(1 downto 0); 
            b : out std_logic_vector(2 downto 0));
                        
end mux_dual_4_to_1;

architecture rtl of mux_dual_4_to_1 is
begin
    b <= a1 when (sel = "00") else
         a2 when (sel = "01") else
         a3 when (sel = "10") else
         a4;   
end rtl;
