----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2019 19:59:43
-- Design Name: 
-- Module Name: Counter - Behavioral
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


//library IEEE;
//use IEEE.STD_LOGIC_1164.ALL;
//use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity Counter is                                                    --entity definition 
  Port ( 
    clk:in std_logic; 
    reset:in std_logic; 
    q: out std_logic_vector(3 downto 0) 
    ); 
end Counter;

architecture behavorial of Counter is                         -- Architecture definition 
begin 
      process(clk,reset)                                           -- Process definition 
   variable qtemp: std_logic_vector(3 downto 0);   -- temporary variable for output q[3..0] 
  begin 
   if reset='1' then 
    qtemp:="0000";
    q<="0000";                                           -- Reset asychroniously 
   elsif clk'event and clk='1' then                              -- Counting state 
     if qtemp<9 then 
      qtemp:=qtemp+1;                                         -- Counter increase 
     else 
      qtemp:="0000";                                             -- Return the zero state  
    end if; 
   q<=qtemp;                                                      -- Output 
    end if; 
  end process;                                                      -- End Process 
end behavorial;                                                       -- End Architecture


