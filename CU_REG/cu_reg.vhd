library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cu_reg is
port(
	clk: in std_logic
	
	--numb1H: out std_logic_vector(6 downto 0);
	--numb1L: out std_logic_vector(6 downto 0);
	
	--numb2H: out std_logic_vector(6 downto 0);
	--numb2L: out std_logic_vector(6 downto 0);
	
	--test_a: out std_logic_vector(7 downto 0)
	
);
end entity cu_reg;

architecture struct of cu_reg is

	component ALU is
	 port( -- Signed means these can be -ve or +ve, unsigned can only be +ve.
		--Enable  : in std_logic;     --clock signal
		AC, SigBus : in signed(7 downto 0); --input operands
		Logic   : in unsigned(3 downto 0); --Operation to be performed
		p_ALUOutput : out std_LOGIC_VECTOR(7 downto 0) --output of ALU
	 );
	end component ALU;

	component top_model is
    port( 
        -- INPUTS
		  z, clk  	: in std_logic;
        IR      	: in std_logic_vector(4 downto 0); -- INSTRUCTION REGISTER LOW NIBBLE + 1
       
		  -- COMMAND SIGNALS
		  error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD	: out std_logic;

		  alu_cmd : out std_logic_vector(3 downto 0); -- TO THE ALU INPUT
       
		  --segment displayers
		  curr_add_H: out std_logic_vector(6 downto 0); -- HIGH NIBBLE OF CURRENT MICROCODE ADDRESS
		  curr_add_L: out std_logic_vector(6 downto 0); -- LOW NIBBLE OF CURRENT MICROCODE ADDRESS
		  curr_aLU_S: out std_logic_vector(6 downto 0)  -- ALUSELECT DISPLAY
    );
	end component;
	
	component progcount is
	port(
		input : in STD_LOGIC_VECTOR (15 downto 0);
		clk 	: in STD_LOGIC;
		pcld 	: in  STD_LOGIC;
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
	
	component zreg is
		port(
			clk : in STD_LOGIC;
			inp : in STD_LOGIC_VECTOR (7 downto 0);
			enb : in STD_LOGIC;
			otp : out STD_LOGIC
			);
	end component zreg;
	
	component buff is
	generic(data_width: natural);
	port(
		IBus	: in std_logic_vector(data_width-1 downto 0);
		OBus	: out std_logic_vector(data_width-1 downto 0);
		e		: in std_logic
	);
	end component buff;
	
	component romcpu is
	port( 
		adr 	: in  std_logic_vector(6 downto 0); -- address to use
        o0  : out std_logic_vector(7 downto 0); -- output data
		  i0  : in std_logic_vector(7 downto 0);  --input data
		  r, w: in std_logic := '0'					-- read or write
    );
	end component romcpu;

	signal databus: std_logic_vector(15 downto 0);
	
	-- dummy not used
	signal alu_dum, w1 ,w2 :std_LOGIC_VECTOR(6 downto 0);
	
	-- from the intrustion reg to the cu
	signal ir :std_LOGIC_VECTOR(7 downto 0);
	
	signal sig_mem_to_bus :std_LOGIC_VECTOR(7 downto 0);
	signal sig_bus_to_mem :std_LOGIC_VECTOR(7 downto 0);
	
	-- from the cu to the alu
	signal sig_alu_cmd	: std_logic_vector(3 downto 0);
	
	-- command signal sfrom cu to other places
	signal error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD	: std_logic;
	
	--z to the cu
	signal sig_z: std_logic;
	
	-- outputs form the pc and ar
	signal pcbridge, arbridge: STD_LOGIC_VECTOR(15 downto 0);
	
	--outputs from the dr, tr, ac and alu and r
	signal drbridge, trbridge, acbridge, alubridge, rbridge: std_LOGIC_VECTOR(7 downto 0);

begin

	-- output the ac value to the test bench
	--test_a <= acbridge ;

	-- control unit
	cu: top_model port map(sig_z, clk, ir(4 downto 0), error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD, sig_alu_cmd, w1, w2, alu_dum);
	
	-- program counter
	pc: progcount port map(databus, clk, pcload, pcinc, pcbridge);
	
	-- address reg
	ar: progcount port map(databus, clk, arload, arinc, arbridge);
	
	--data reg
	dr: instreg port map(drlOAD, clk, databus(7 downto 0), drbridge);
	
	--t treg
	tr: instreg port map(trlOAD, clk, drbridge, trbridge);
	
	-- r reg
	r_reg: instreg port map(rlOAD, clk,  databus(7 downto 0), rbridge);	
	
	-- accumulator
	acc:instreg port map(AClOAD, clk, alubridge, acbridge);
	
	-- alu
	ben_alu: alu port map(signed(acbridge), signed(databus (7 downto 0)), unsigned(sig_alu_cmd), alubridge);
	
	-- register
	john_z: zreg port map(clk, alubridge, ZLOAD, sig_z);
	
	--instruction register
	ireg: instreg port map(irLOAD, clk, drbridge, ir);
	
	--memory
	ram: romcpu port map(arbridge(6 downto 0), sig_mem_to_bus, sig_bus_to_mem, R, W);
	
	-- Tri states					width				in 						out						enable
	membusbuf: buff generic map(8) 	port map(sig_mem_to_bus, 		databus(7 downto 0), MEMBUS);
	busmembuf: buff generic map(8) 	port map(databus(7 downto 0), sig_bus_to_mem, 		BUSMEM);
	acbuff	: buff generic map(8) 	port map(acbridge, 				databus(7 downto 0), ACBUS);
	rbuff		: buff generic map(8) 	port map(rbridge, 				databus(7 downto 0), RBUS);
	pcbuf		: buff generic map(16) 	port map(pcbridge, 				databus, 				pcBUS);
	drhbuf	: buff generic map(8) 	port map(drbridge, 				databus(15 downto 8),DRHBUS);
	drlbuf	: buff generic map(8) 	port map(drbridge, 				databus(7 downto 0), DRLBUS);
	trbuf		: buff generic map(8) 	port map(trbridge, 				databus(7 downto 0), TRBUS);
	
end architecture struct;