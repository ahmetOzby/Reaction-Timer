-- Tarih: 05/05/2022
-- Amaç: Xilinx Nexys ddr3 kiti için bcd sayýcý.
-- Yazar: Ahmet ÖZBAY (18014093)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.ALL;


entity bcd_counter is
    Port
    (
        clk: in std_logic;
        enable: in std_logic;
        clear: in std_logic;
        
        bcd0: out std_logic_vector(3 downto 0);
        bcd1: out std_logic_vector(3 downto 0)
    );
end bcd_counter;

architecture Behavioral of bcd_counter is
signal u_digit: integer range 0 to 9 := 0;
signal tens_digit: integer range 0 to 9 := 0;
begin
bcd0 <= std_logic_vector(to_unsigned(u_digit, bcd0'length));
bcd1 <= std_logic_vector(to_unsigned(tens_digit, bcd1'length));
process(clk, enable, clear) begin
    if(rising_edge(clk)) then
        if(enable = '1') then
            if(u_digit = 9) then
                u_digit <= 0;
                if(tens_digit = 9) then
                    tens_digit <= 0;
                else
                    tens_digit <= tens_digit + 1;
                end if;
            else
                u_digit <= u_digit + 1;
            end if;
        end if;
    end if;
end process;
end Behavioral;
