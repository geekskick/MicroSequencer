library IEEE;
use IEEE.std_logic_1164.all;

entity z_reg is
    generic(
        data_width: natural
        );
    port(
        clk : in std_logic;
        d   : in std_logic_vector (data_width-1 downto 0);
        en  : in std_logic;
        q   : out std_logic_vector
        );
end z_reg;

architecture beh of z_reg is
    signal q_i: std_logic;

begin

    -- On clock tick, set the q_i signal to '1' if
    -- all the data inputs are 0. If the enable is low
    -- then set the output to High Impedance.
    process(clk, en, d)
    begin
    if en = '1' then
        if rising_edge(clk) then

            -- This uses VHDL 2008 'nor' so make sure the compiler is set up 
            -- correctly
            q_i <= nor d;
        end if;  
    else 
        q_i <= 'Z';   
    end if;
    end process;

    q <= q_i;

end beh;