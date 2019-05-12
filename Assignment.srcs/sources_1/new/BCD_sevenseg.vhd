----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2019 23:47:30
-- Design Name: 
-- Module Name: BCD_sevenseg - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_sevenseg is
    Port ( SW: in STD_LOGIC_VECTOR (7 downto 0);
           CA,CB,CC,CD,CE,CF,CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (0 to 7)
          );
end BCD_sevenseg;

architecture Behavioral of BCD_sevenseg is

signal leds_out: std_logic_vector (6 downto 0);

begin
   my_seg_proc: process (SW)
      begin
        case SW is 
          when "00000000"	=> leds_out <= "0000001";	  -- if BCD is "0000" write a zero to display
          when "00000001"    => leds_out <= "1001111";      -- etc...
          when "00000010"    => leds_out <= "0010010";
          when "00000011"    => leds_out <= "0000110";
          when "00000100"    => leds_out <= "1001100";
          when "00000101"    => leds_out <= "0100100";
          when "00000110"    => leds_out <= "1100000";
          when "00000111"    => leds_out <= "0001111";
          when "00001000"    => leds_out <= "0000000";
          when "00001001"    => leds_out <= "0001100";
          when others => leds_out <= "1111111";
        end case;
     end process my_seg_proc;
          
  AN <= "11111100"; 
  CG <= leds_out(0);
  CF <= leds_out(1);
  CE <= leds_out(2);
  CD <= leds_out(3);
  CC <= leds_out(4);
  CB <= leds_out(5);
  CA <= leds_out(6);



end Behavioral;
