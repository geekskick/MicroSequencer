-- Quartus II VHDL Template
-- Single-port RAM with single read/write address and initial contents	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testram is
	port 
	(
		addr	: in std_logic_vector(15 downto 0);
		data	: inout std_logic_vector(7 downto 0);
		r, w	: in std_logic := '0'
	);

end testram;

architecture rtl of testram is

	component ram is
	port 
	(
		addr		: in std_logic_vector((16-1) downto 0);
		datain	: in std_logic_vector((8-1) downto 0);
		wr 		: in std_logic := '0';
		dataout	: out std_logic_vector((8-1) downto 0)
	);
	end component ram;
	
	signal i_data, o_data: std_logic_vector(7 downto 0);
	signal enable : std_logic;

begin
	
	enable <= r xor w;
	mem: ram port map(addr, i_data, w, o_data);
	
	-- All choice expressions in a VHDL case statement must be constant
	-- and unique.	Also, the case statement must be complete, or it must
	-- include an others clause. 
	process(enable, i_data, o_data, data, r, w)
	begin
	case enable is
		when '1' => -- is r xor w
			-- Sequential Statement(s)
			if r = '1' then
				data <= o_data; --output the mem to data
			else 
				i_data  <= data;
			end if;
		when '0' =>
				data <= (others => 'Z');
		when others =>
			-- Sequential Statement(s)
				data <= (others => 'X');
	end case;
	end process;


end rtl;
