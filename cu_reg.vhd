library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cu_reg is
port(
	clk: in std_logic
);
end entity cu_reg;

architecture struct of cu_reg is

	component top_model is
    port( 
        -- INPUTS
		  z, clk  	: in std_logic;
        IR      	: in std_logic_vector(3 downto 0); -- INSTRUCTION REGISTER LOW NIBBLE
       
		  -- COMMAND SIGNALS
		  error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD	: out std_logic;
       
		  
		  --segment displayers
		  curr_add_H: out std_logic_vector(6 downto 0); -- HIGH NIBBLE OF CURRENT MICROCODE ADDRESS
		  curr_add_L: out std_logic_vector(6 downto 0); -- LOW NIBBLE OF CURRENT MICROCODE ADDRESS
		  curr_aLU_S: out std_logic_vector(6 downto 0)  -- ALUSELECT DISPLAY
    );
	end component;
	component progcount is
	port(
		input : in STD_LOGIC_VECTOR (15 downto 0);
		clk : in STD_LOGIC;
		pcld : in  STD_LOGIC;
		pcinc : in STD_LOGIC;
		
		output : out STD_LOGIC_VECTOR (15 downto 0)
		);
	end component; 
	
	component instreg is
	port(
		set : in STD_LOGIC;
		clk : in STD_LOGIC;
		inp : in STD_LOGIC_VECTOR (7 downto 0);
		otp : out STD_LOGIC_VECTOR (7 downto 0)
		);
	end component instreg;
	
	component buff is
	generic(data_width: natural);
	port(
			IBus: in std_logic_vector(data_width-1 downto 0);
        OBus: out std_logic_vector(data_width-1 downto 0);
        e: in std_logic
	);
	end component buff;
	
	component testram is
	port 
	(
		addr	: in std_logic_vector(15 downto 0);
		data	: inout std_logic_vector(7 downto 0);
		r, w	: in std_logic := '0'
	);
	end component testram;

	signal databus: std_logic_vector(15 downto 0);
	signal alus, w1,w2 :std_LOGIC_VECTOR(6 downto 0);
	signal ir :std_LOGIC_VECTOR(7 downto 0);
	
	signal error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD	: std_logic;
	
	signal pcbridge, arbridge: STD_LOGIC_VECTOR(15 downto 0);
	signal drbridge, trbridge: std_LOGIC_VECTOR(7 downto 0);

begin

	cu: top_model port map('1', clk, ir(3 downto 0), error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD, w1, w2, alus);
	pc: progcount port map(databus, clk, pcload, pcinc, pcbridge);
	ar: progcount port map(databus, clk, arload, arinc,arbridge);
	
	dr: instreg port map(drlOAD, clk, databus(7 downto 0), drbridge);
	tr: instreg port map(trlOAD, clk, drbridge, trbridge); -- new 
	
	ireg: instreg port map(irLOAD, clk, drbridge, ir);
	test_ram: testram port map(arbridge, databus(7 downto 0), MEMBUS, BUSMEM);
	
	pcbuf: buff generic map(16) port map(pcbridge, databus, pcbUS);
	drhbuf: buff generic map(8) port map(drbridge, databus(15 downto 8), DRHBUS);
	drlbuf: buff generic map(8) port map(drbridge, databus(7 downto 0), DRLBUS);
	trbuf: buff generic map(8) port map(trbridge, databus(7 downto 0), TRBUS);
	
end architecture struct;