library IEEE;
use IEEE.std_logic_1164.all;

entity generic_register is
    generic(
        data_width: natural
        );
    port(
        clk : in std_logic;
        data: in std_logic_vector(data_width-1 downto 0);
        load: in std_logic;
        q   : out std_logic_vector(data_width-1 downto 0)
    );

end entity generic_register;

architecture behav of generic_register is
    signal q_i: std_logic_vector (data_width-1 downto 0) := (others => '0');

begin
    process(load, clk, data)
        begin
            if load = '1' and rising_edge(clk) then
                q_i <= data;
            end if;
    end process;

    q <= q_i;
end architecture behav;