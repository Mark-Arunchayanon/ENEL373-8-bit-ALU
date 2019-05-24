----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saranya Ramani (27179399), Nathan James (44005459), Mark Pakorn Arunchyanon (78980462)
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


entity top_level is
  Port ( 
         CLK100MHZ : in STD_LOGIC;          -- Clock at 100MHz
         SW : in STD_LOGIC_VECTOR(7 downto 0);          -- 8 switches
         BTNU, BTNC, BTND, BTNR: in STD_LOGIC;          -- Up, center, down and right buttons
         LED : out STD_LOGIC_VECTOR(7 downto 0)         -- Output as 8 LEDs
         );
end top_level;

architecture Behavioral of top_level is

-- Contains 4 states (0-3) 0 is the start state, 1 is to store the first reg
-- 2 is to store the second register, 3 is to calculate and display result
-- Outputs the states to other components
component FSM port( 
                    clock : in STD_LOGIC;
                    buttonU : in STD_LOGIC;
                    buttonC : in STD_LOGIC;
                    buttonD : in STD_LOGIC;
                    buttonR : in STD_LOGIC;
                    state : out INTEGER
                    );
end component;

-- Stores the first operand from the 8 switches and outputs the operand 
component register1 port(
                          btnu : in STD_LOGIC;
                          sw1_input : in STD_LOGIC_VECTOR(7 downto 0);
                          state1 : in INTEGER;
                          reg1_out : out STD_LOGIC_VECTOR(7 downto 0)
                          );
end component;

-- Stores the second operand from the 8 switches and outputs the operand
component register2 port(
                          
                          btnc : in STD_LOGIC;
                          sw2_input : in STD_LOGIC_VECTOR(7 downto 0);
                          state2 : in INTEGER;
                          reg2_out : out STD_LOGIC_VECTOR(7 downto 0)
                          );
end component;

-- Reads the input operation from the 2 switches and does the calculations according to the operation
-- 00 for +, 01 for -, 10 for and , and 11 for or
component alu_op Port ( 
                        btnd : in STD_LOGIC;
                        state3 : in INTEGER;
                        operand1 : in STD_LOGIC_VECTOR(7 downto 0);
                        operand2 : in STD_LOGIC_VECTOR(7 downto 0);
                        operation : in STD_LOGIC_VECTOR(1 downto 0);
                        alu_out : out STD_LOGIC_VECTOR(7 downto 0)
                        );
end component;

-- Stores the calculation result from the ALU and outputs trhe result
component output_reg port(
                          alu_in : in STD_LOGIC_VECTOR (7 downto 0);
                          state3 : in INTEGER;
                          reg3_out : out STD_LOGIC_VECTOR(7 downto 0)
                          );    
                  
end component;

-- Reads the output of the FSM, first register, second register and the ALU
-- DIsplays the stored operands, operation and results according to the current state
component led_output port ( 
                            clock : in STD_LOGIC;
                            states : in INTEGER;
                            reg1 : in STD_LOGIC_VECTOR(7 downto 0);
                            reg2 : in STD_LOGIC_VECTOR(7 downto 0);
                            reg3 : in STD_LOGIC_VECTOR(7 downto 0);
                            led : out STD_LOGIC_VECTOR(7 downto 0)
                            );
                            
                          
end component;

signal fsm_out : INTEGER;
signal op1 : STD_LOGIC_VECTOR(7 downto 0);
signal op2 : STD_LOGIC_VECTOR(7 downto 0);
signal op3 : STD_LOGIC_VECTOR(7 downto 0);
signal output2 : STD_LOGIC_VECTOR(7 downto 0);


begin

    U1: FSM
        port map (clock => CLK100MHZ, buttonU => BTNU, buttonC => BTNC, buttonD => BTND, buttonR => BTNR, state => fsm_out);
        
    U2: register1
        port map (btnu => BTNU, sw1_input => SW, state1 => fsm_out, reg1_out => op1);

    U3: register2
        port map (btnc => BTNC, sw2_input => SW, state2 => fsm_out, reg2_out => op2);
    
    U4 : alu_op
        port map (btnd => BTND, state3 => fsm_out, operand1 => op1, operand2 => op2, operation => SW(1 downto 0), alu_out => op3);
            
    U5 : output_reg
        port map (alu_in => op3, reg3_out => output2, state3 => fsm_out);
        
    U6 : led_output
        port map (clock => CLK100MHZ, states => fsm_out, reg1 => op1, reg2 => op2, reg3 => output2, led => LED);
        
end Behavioral;
