-- Tarih: 05/05/2022
-- Amaç: D Flip-Flop modülü tasarýmý.
-- Yazar: Ahmet ÖZBAY



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dff is
    Port
    (
        clk: in std_logic;
        d: in std_logic;
        q: out std_logic
    );   
end dff;

architecture Behavioral of dff is
signal q_s: std_logic := '0';
begin
    process (clk) begin
        q_s <= d;
    end process;
q <= q_s;
end Behavioral;
