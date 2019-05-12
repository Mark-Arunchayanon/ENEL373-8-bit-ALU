----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2019 20:54:31
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
  Port ( 
         clock : in STD_LOGIC;
         buttonU : in STD_LOGIC;
         buttonC : in STD_LOGIC;
         buttonD : in STD_LOGIC;
         buttonR : in STD_LOGIC;
         state : out INTEGER
         );
end FSM;

architecture Behavioral of FSM is



begin

    fsm_design: process (clock)	
    variable counter : INTEGER range 0 to 3 :=0;
     --variable data8_out : std_logic_vector (7 downto 0);
		begin
		 if (clock'Event and clock ='1') then 
            if (buttonU = '1' and counter = 0) then 
                counter := counter + 1;
            end if;
            if (buttonC = '1' and counter = 1) then 
                counter := counter + 1;
            end if;               
            if (buttonD = '1' and counter = 2) then 
                counter := counter + 1;
            end if;
            if (buttonR = '1') then 
                counter := 0;
            end if;          
		  end if;
		  
		  state <= counter;
		  
		  end process fsm_design;

end Behavioral;
