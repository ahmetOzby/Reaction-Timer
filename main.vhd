-- Tarih: 05/05/2022
-- Amaç: "Reaction timer" bir insanýn tepki süresinin ölçülmesi ve 7 segment LCD ekranda gösterilmesi.
-- Yazar: Ahmet ÖZBAY

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
Port
(
    -- In
    Reset: in std_logic := '0';
    clk: in std_logic := '0';
    --w: in std_logic;
    BTNR: in std_logic := '0';
    
    -- Out
    DP: out std_logic := '0';
    CA: out std_logic := '0';
    CB: out std_logic := '0';
    CC: out std_logic := '0';
    CD: out std_logic := '0';
    CE: out std_logic := '0';
    CF: out std_logic := '0';
    CG: out std_logic := '0';
    
    AN: out std_logic_vector(1 downto 0) := "01";
    LED15: out std_logic := '0'
);
    
end main;

architecture Behavioral of main is
component dff is
    Port
    (
        --Inputs
        clk: in std_logic;
        d: in std_logic;
        
        --Outputs
        q: out std_logic
     );
end component;

component counter is
    Port
    (
        --Inputs
        clk: in std_logic;
        
        --Outputs
        clk_new: out std_logic
     );
end component;
component mux_1x2 is
    Port
    (
        input: in std_logic_vector (1 downto 0) := "00";
        y: out std_logic := '0';
        s: in std_logic := '0'
    );
end component;

component bcd_counter is
    Port
    (
        clk: in std_logic;
        enable: in std_logic;
        clear: in std_logic;
        
        bcd0: out std_logic_vector(3 downto 0);
        bcd1: out std_logic_vector(3 downto 0)
    );
end component;

component bcd_converter is
    Port
    (
        bcd0: in std_logic_vector(3 downto 0);
        bcd1: in std_logic_vector(3 downto 0);
        
        converted_u_digit: out std_logic_vector(7 downto 0);
        converted_tens_digit: out std_logic_vector(7 downto 0)
    );
end component;
signal clk_new: std_logic := '0';
signal d: std_logic := '0';
signal q: std_logic := '0';
signal w: std_logic := '0';
signal mux_out: std_logic := '0';
signal bcd0: std_logic_vector(3 downto 0) := "0000";
signal bcd1: std_logic_vector(3 downto 0) := "0000";
signal u_digit: std_logic_vector(7 downto 0) := "00000000";
signal tens_digit: std_logic_vector(7 downto 0) := "00000000";
signal an_s: std_logic_vector(1 downto 0) := "01";
signal w_flag: boolean := false;


begin
d <= mux_out and BTNR;
ctr_20_bit: counter port map(clk => clk, clk_new => clk_new); -- new clock generation
dff_1: dff port map(clk => clk_new, d => d, q => q);    
mux_1: mux_1x2 port map(input(0) => q, input(1) => '1', y => mux_out, s => w);    
bcd_ctr: bcd_counter port map(clk => clk, enable => q, clear => Reset, bcd0 => bcd0, bcd1 => bcd1);
bcd_cvrtr: bcd_converter port map(bcd0 => bcd0, bcd1 => bcd1, converted_u_digit => u_digit, converted_tens_digit => tens_digit);
AN <= an_s;

process(clk_new, BTNR, an_s, w) begin
if(rising_edge(clk_new)) then
    if(w_flag = true) then
        w <= '1';
    else
        w <= '0';
    end if;
    
    if(BTNR = '1' and w = '0')then
        w_flag <= true;
    else
        w_flag <= false;
    end if;
    
    if(an_s = "01") then
        DP <= u_digit(0);
        CA <= u_digit(1);
        CB <= u_digit(2);
        CC <= u_digit(3);
        CD <= u_digit(4);
        CE <= u_digit(5);
        CF <= u_digit(6);
        CG <= u_digit(7);
    
    elsif(an_s = "10") then
        DP <= tens_digit(0);
        CA <= tens_digit(1);
        CB <= tens_digit(2);
        CC <= tens_digit(3);
        CD <= tens_digit(4);
        CE <= tens_digit(5);
        CF <= tens_digit(6);
        CG <= tens_digit(7);
    end if;
    an_s <= not an_s;
end if;
end process;
end Behavioral;
