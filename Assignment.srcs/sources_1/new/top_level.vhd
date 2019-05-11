----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2019 21:59:33
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
  Port ( 
         CLK100MHZ : in STD_LOGIC;
         SW : in STD_LOGIC_VECTOR(7 downto 0);
         BTNU, BTNC, BTND, BTNR: in STD_LOGIC;
         LED : out STD_LOGIC_VECTOR(7 downto 0)
         );
end top_level;

architecture Behavioral of top_level is

component FSM port( 
                    clock : in STD_LOGIC;
                    buttonU : in STD_LOGIC;
                    buttonC : in STD_LOGIC;
                    buttonD : in STD_LOGIC;
                    buttonR : in STD_LOGIC;
                    state : out INTEGER
                    );
end component;

component register1 port(
                          sw1_input : in STD_LOGIC_VECTOR(7 downto 0);
                          state1 : in INTEGER;
                          reg1_out : out STD_LOGIC_VECTOR(7 downto 0)
                          );
end component;

component register2 port(
                          sw2_input : in STD_LOGIC_VECTOR(7 downto 0);
                          state2 : in INTEGER;
                          reg2_out : out STD_LOGIC_VECTOR(7 downto 0)
                          );
end component;

<<<<<<< HEAD
component alu_op Port ( 
                        state3 : in INTEGER;
                        operand1 : in STD_LOGIC_VECTOR(7 downto 0);
                        operand2 : in STD_LOGIC_VECTOR(7 downto 0);
                        operation : in STD_LOGIC_VECTOR(7 downto 0);
                        alu_out : out STD_LOGIC_VECTOR(7 downto 0)
                        );
=======
component BCD_sevenseg port(
                          SW: in STD_LOGIC_VECTOR (7 downto 0);
                          CA,CB,CC,CD,CE,CF,CG : out STD_LOGIC;
                          AN : out STD_LOGIC_VECTOR (0 to 7)
                          );
>>>>>>> 838ecdeaf2d6c1997666df1c72434e1cf9c95f80
end component;

begin


end Behavioral;
