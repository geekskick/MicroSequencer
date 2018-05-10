library IEEE;
use IEEE.std_logic_1164.all;

entity 8_bit_data_reg is
    port(
        set : in STD_LOGIC;
        clk : in STD_LOGIC;
        inp : in STD_LOGIC_VECTOR (7 downto 0);
        enb : in STD_LOGIC;
        otp : out STD_LOGIC_VECTOR (7 downto 0)
        );
end 8_bit_data_reg;

architecture beh of 8_bit_data_reg is
    signal buf : buffer STD_LOGIC_VECTOR (7 downto 0);
begin
    process(set, enb, clk)
        begin
        if set = '1' and rising_edge(clk) then
            buf <= inp;
        end if;
        if rising_edge(clk) and enb = '1' then
            otp <= buf;
        end if;     
        if enb = '0' then
            otp <= "ZZZZZZZZ";
        end if;
    end process;
end beh;

