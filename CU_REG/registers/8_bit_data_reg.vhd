library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_data_reg is
    port(
        set : in STD_LOGIC;
        clk : in STD_LOGIC;
        inp : in STD_LOGIC_VECTOR (7 downto 0);
        otp : out STD_LOGIC_VECTOR (7 downto 0)
        );
end eight_bit_data_reg;

architecture beh of eight_bit_data_reg is
signal buf: STD_LOGIC_VECTOR (7 downto 0);
begin
    process(set, clk)
        begin
            if set = '1' and  rising_edge(clk) then
                buf <= inp;
            end if;
    end process;
    otp <= buf;
end beh;
