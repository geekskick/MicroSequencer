library IEEE;
use IEEE.std_logic_1164.all;

entity z_reg is
    port(
        clk : in STD_LOGIC;
        inp : in STD_LOGIC_VECTOR (7 downto 0);
        enb : in STD_LOGIC;
        otp : out STD_LOGIC
        );
end z_reg;

architecture beh of z_reg is
    signal buf: STD_LOGIC;
begin
    process(enb, clk, inp)
        begin
        
        if inp = "00000000" then
            buf <= '1';
        else 
            buf <= '0';
        end if;
        
        if rising_edge(clk) and enb = '1' then
                otp <= buf;
        end if;     
        if enb = '0' then
            otp <= "Z";
        end if;
    end process;
end beh;