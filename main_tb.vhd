----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 08:40:39
-- Design Name: 
-- Module Name: main_tb - Behavioral
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
use IEEE.numeric_std.ALL;



entity main_tb is
--  Port ( );
end main_tb;

architecture Behavioral of main_tb is
component main is
Port
(
    -- In
    Reset: in std_logic;
    clk: in std_logic;
    --w: in std_logic;
    BTNR: in std_logic;
    
    -- Out
    DP: out std_logic;
    CA: out std_logic;
    CB: out std_logic;
    CC: out std_logic;
    CD: out std_logic;
    CE: out std_logic;
    CF: out std_logic;
    CG: out std_logic;
    
    AN: out std_logic_vector(1 downto 0);
    LED15: out std_logic
);
end component;

signal clk: std_logic := '0';
signal Reset: std_logic := '0';
signal BTNR: std_logic := '0';

signal DP: std_logic := '0';
signal CA: std_logic := '0';
signal CB: std_logic := '0';
signal CC: std_logic := '0';
signal CD: std_logic := '0';
signal CE: std_logic := '0';
signal CF: std_logic := '0';
signal CG: std_logic := '0';

signal AN: std_logic_vector(1 downto 0) := "01";
signal LED15: std_logic := '0';

begin
CLOCK: clk <= not clk after 10 ns;

UUT : main
port map
(
    clk => clk,
    Reset => Reset,
    BTNR => BTNR,
    DP => DP,
    CA => CA,
    CB => CB,
    CC => CC,
    CD => CD,
    CE => CE,
    CF => CF,
    CG => CG,
    AN => AN,
    LED15 => LED15
);


STIMULI : process begin
BTNR <= '0';
wait for 30 ms;
BTNR <= '1';
wait for 30 ms;
end process;
end Behavioral;
