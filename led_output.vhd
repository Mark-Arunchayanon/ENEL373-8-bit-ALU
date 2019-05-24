----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Engineer: Saranya Ramani (27179399), Nathan James (44005459), Mark Pakorn Arunchyanon (78980462)
-- 
-- Create Date: 12/04/2019
-- Design Name: led_output - Behavioral
-- Module Name: ALU + REGS + FSM
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Reads the state, operands from the registers, result from ALU
--              Displays the data on the 8 LEDs according to the current state
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


entity led_output is
        Port ( 
               clock : in STD_LOGIC;
               states : in INTEGER;
               reg1 : in STD_LOGIC_VECTOR(7 downto 0);
               reg2 : in STD_LOGIC_VECTOR(7 downto 0);
               reg3 : in STD_LOGIC_VECTOR(7 downto 0);
              -- alu_out : in STD_LOGIC_VECTOR(7 downto 0);
               led : out STD_LOGIC_VECTOR(7 downto 0)
               );
end led_output;

architecture Behavioral of led_output is

signal output : STD_LOGIC_VECTOR(7 downto 0);

begin
    led_proc : process (clock)
        begin
            if (states = 0) then 
                output <= "00000000";
            elsif (states = 1) then
                output <= reg1;
            elsif (states = 2) then 
                output <= reg2;
            elsif (states = 3) then
                output <= reg3;
            end if;
            
            led <= output;
            
    end process led_proc;
end Behavioral;
