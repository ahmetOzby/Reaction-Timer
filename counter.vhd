-- Tarih: 05/05/2022
-- Amaç: 20-bitlik sayýcý modülü tasarýmý.
-- Yazar: Ahmet ÖZBAY


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.ALL;


entity counter is
    generic
    (
        c_clk_freq: integer := 100_000_000
    );
    
    Port
    (
        --Inputs
        clk: in std_logic;
        
        --Outputs
        clk_new: out std_logic
     );
     
     signal r_edge_ctr: integer range 0 to c_clk_freq / 100 := 0;
end counter;


architecture Behavioral of counter is
constant clk_100ms_lim: integer := c_clk_freq / 100;
signal out_s: std_logic := '0';
begin
    process(clk) begin
    if(rising_edge(clk)) then
        r_edge_ctr <= r_edge_ctr + 1;
        
        if(r_edge_ctr >= clk_100ms_lim / 2) then
            out_s <= not out_s;
            r_edge_ctr <= 0;
        end if;
    end if;
    end process;
clk_new <= out_s;
end Behavioral;
