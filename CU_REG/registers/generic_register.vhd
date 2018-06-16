library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_register is
    generic(
        data_width: natural
        );
    port(
        clk : in std_logic;
        data: in std_logic_vector(data_width-1 downto 0);
        load: in std_logic;
        inc : in std_logic;
        q   : out std_logic_vector(data_width-1 downto 0)
    );

end entity generic_register;

architecture behav of generic_register is
    signal q_i: std_logic_vector (data_width-1 downto 0) := (others => '0');

begin
    process(load, clk, data)
        begin
        if rising_edge(clk) then
            if load = '1' then
                q_i <= data;
            elsif inc = '1' then
                q_i <= std_logic_vector(unsigned(q_i) + 1);
            end if;
        end if;
    end process;

    q <= q_i;
    
end architecture behav;