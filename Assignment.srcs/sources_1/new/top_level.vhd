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

component alu_op Port ( 
                        state3 : in INTEGER;
                        operand1 : in STD_LOGIC_VECTOR(7 downto 0);
                        operand2 : in STD_LOGIC_VECTOR(7 downto 0);
                        operation : in STD_LOGIC_VECTOR(1 downto 0);
                        alu_out : out STD_LOGIC_VECTOR(7 downto 0)
                        );
end component;

--component BCD_sevenseg port(
--                          SW: in STD_LOGIC_VECTOR (7 downto 0);
--                          CA,CB,CC,CD,CE,CF,CG : out STD_LOGIC;
--                          AN : out STD_LOGIC_VECTOR (0 to 7)
--                          );
--end component;

component led_output Port ( 
                            states : in INTEGER;
                            reg1 : in STD_LOGIC_VECTOR(7 downto 0);
                            reg2 : in STD_LOGIC_VECTOR(7 downto 0);
                            alu_out : in STD_LOGIC_VECTOR(7 downto 0);
                            led : out STD_LOGIC_VECTOR(7 downto 0)
                            );
end component;

signal fsm_out : INTEGER;
signal op1 : STD_LOGIC_VECTOR(7 downto 0);
signal op2 : STD_LOGIC_VECTOR(7 downto 0);
signal result : STD_LOGIC_VECTOR(7 downto 0);

begin

    U1: FSM
        port map (clock => CLK100MHZ, buttonU => BTNU, buttonC => BTNC, buttonD => BTND, buttonR => BTNR, state => fsm_out);
        
    U2: register1
        port map (sw1_input => SW, state1 => fsm_out, reg1_out => op1);

    U3: register2
        port map (sw2_input => SW, state2 => fsm_out, reg2_out => op2);
    
    U4 : alu_op
        port map (state3 => fsm_out, operand1 => op1, operand2 => op2, operation => SW(1 downto 0), alu_out => result);
        
    U5 : led_output
        port map (states => fsm_out, reg1 => op1, reg2 => op2, alu_out => result, led => LED);
        
end Behavioral;
