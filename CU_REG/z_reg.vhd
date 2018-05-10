library IEEE;
use IEEE.std_logic_1164.all;
entity zreg is
	port(
		clk : in STD_LOGIC;
		inp : in STD_LOGIC_VECTOR (7 downto 0);
		--buf : buffer STD_LOGIC_VECTOR;
		enb : in STD_LOGIC;
		otp : out STD_LOGIC
		);
end  zreg;

architecture datareg of  zreg is

	signal buf: std_LOGIC;
begin
--	8-bit data register 
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
		--if  enb = '0' then
			--	otp <= "Z";
		--end if;
	end process;
end datareg;