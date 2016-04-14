library IEEE;
use IEEE.std_logic_1164.all;
entity addreg is
	port(
		input : in STD_LOGIC_VECTOR (15 downto 0);
		clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR (15 downto 0)
		);
end addreg;

architecture addreg of addreg is
begin
		--	16-bit adress register
		process(clk, enable)
		begin
		if rising_edge(clk) and enable = '1' then
				output <= input;
		end if;
	end process;
end addreg;