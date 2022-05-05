-- Tarih: 05/05/2022
-- Amaç: Xilinx Nexys ddr3 kiti için bcd sayýcý.
-- Yazar: Ahmet ÖZBAY (18014093)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_converter is
    Port
    (
        bcd0: in std_logic_vector(3 downto 0);
        bcd1: in std_logic_vector(3 downto 0);
        
        converted_u_digit: out std_logic_vector(7 downto 0);
        converted_tens_digit: out std_logic_vector(7 downto 0)
    );
        
end bcd_converter;

architecture Behavioral of bcd_converter is
signal u_digit: std_logic_vector(7 downto 0) := "00000000";
signal tens_digit: std_logic_vector(7 downto 0) := "00000000";
begin
--process(bcd0, bcd1) begin
converted_u_digit <= u_digit;
converted_tens_digit <= tens_digit;
process(bcd0, bcd1) begin

case bcd0 is
    -- dp -> lsb
    when "0000" => u_digit <= "10000001";   
    when "0001" => u_digit <= "11110011";
    when "0010" => u_digit <= "01001001";
    when "0011" => u_digit <= "01100001";
    when "0100" => u_digit <= "00110011";
    when "0101" => u_digit <= "00100101";
    when "0110" => u_digit <= "00000101";
    when "0111" => u_digit <= "11110001";
    when "1000" => u_digit <= "00000001";
    when "1001" => u_digit <= "00110001";
    when others => u_digit <= "11111111";
end case;

case bcd1 is
    when "0000" => tens_digit <= "10000001";   
    when "0001" => tens_digit <= "11110011";
    when "0010" => tens_digit <= "01001001";
    when "0011" => tens_digit <= "01100001";
    when "0100" => tens_digit <= "00110011";
    when "0101" => tens_digit <= "00100101";
    when "0110" => tens_digit <= "00000101";
    when "0111" => tens_digit <= "11110001";
    when "1000" => tens_digit <= "00000001";
    when "1001" => tens_digit <= "00110001";
    when others => tens_digit <= "11111111";
end case;
end process;
end Behavioral;
