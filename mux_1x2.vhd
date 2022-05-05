-- Tarih: 25/04/2022
-- Amaç: 1x2 mux modülü tasarýmý.
-- Yazar: Ahmet ÖZBAY (18014093)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_1x2 is
Port
(
    input: in std_logic_vector (1 downto 0) := "00";
    y: out std_logic := '0';
    s: in std_logic := '0'
);
end mux_1x2;

architecture Behavioral of mux_1x2 is
begin
process(s) begin

if(s = '0') then  
    y <= input(0);
else
    y <= input(1);     
end if;
end process;
end Behavioral;