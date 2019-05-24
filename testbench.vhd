---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2019 15:23:53
-- Design Name: 
-- Module Name: alu_design_tb - Behavioral
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

entity testbench_tb is
--  Port ( );
end testbench_tb;

architecture Behavioral of testbench_tb is
    component alu_op
        port ( btnd : in STD_LOGIC;
               state3 : in INTEGER;
               operand1 : in STD_LOGIC_VECTOR(7 downto 0);
               operand2 : in STD_LOGIC_VECTOR(7 downto 0);
               operation : in STD_LOGIC_VECTOR(1 downto 0);
               output : out STD_LOGIC_VECTOR(7 downto 0)
               );
        end component;
    
    signal state3_in : INTEGER;
    signal btnd_in : STD_LOGIC;
    signal alu_output : STD_LOGIC_VECTOR(7 downto 0);
    signal operand1_in : STD_LOGIC_VECTOR(7 downto 0);
    signal operand2_in : STD_LOGIC_VECTOR(7 downto 0);
    signal operation_in : STD_LOGIC_VECTOR(1 downto 0);
   
    
    --signal reg3_out : STD_LOGIC_VECTOR (7 downto 0);
    
    constant ClockPeriod : TIME := 50 ns;
    
begin
    
    UUT: alu_op port map (
                              btnd => btnd_in, --Button down 
                              state3 => state3_in,    --state 
                              operand1 => operand1_in,  --register 1
                              operand2 => operand2_in,  --register 2
                              operation => operation_in,  --operation input
                              output => alu_output);  --result );
                              
    process
        begin
        btnd_in <= '1';
        wait for 10 ns;
        state3_in <= 3;
        wait for 10 ns;
        operand1_in <= "00000001";
        wait for 10 ns;
        operand2_in <= "00001001";
        wait for 10 ns;
        operation_in <= "00";
        
        --wait;   
    end process;
    
end Behavioral;