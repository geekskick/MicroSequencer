library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_model is
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
end entity;

architecture structure of top_model is

	 -- MICRO OPERATIONS FIELDS
    signal m3           : std_logic;
    signal m1           : std_logic_vector(2 downto 0);
    signal m2           : std_logic_vector(2 downto 0);

    -- COMMAND TO SEND TO THE ALU
	 SIGNAL ALUSELECT 	: std_logic_vector(3 downto 0);
	 
	 -- CURRENT ADDRESS OF THE MICROCODE
	 signal curr_add		: std_logic_vector(5 downto 0);
	 
	 -- HIGH NIBBLE OF THE MICROCODE ADDRESS
	 signal haddr			: std_logic_vector(3 downto 0);

    -- MICROOPERATIONS
    signal nop1, nop2, nop3, arin, ardt, arpc, acin, aczo, acr, acdr, minu, plus, aand, oor, xxor, nnot, trdr, pcin, pcdt, irdr, rac, mdr, drac, zalu, drm, lshift, rshift	:std_logic;
    
	 -- COMPONENT DECLARATIONS FOLLOW
    component microsequencer is
    port(
        clk, z             : in std_logic;
        instruction        : in std_logic_vector(4 downto 0);
        current_addr_out   : out std_logic_vector(5 downto 0);
        m1                 : out std_logic_vector(2 downto 0);
        m2                 : out std_logic_vector(2 downto 0);
        m3                 : out std_logic;
        alu                : out std_logic_vector(3 downto 0)
    );
    end component microsequencer;
   

    component three_bit_decoder is
    port(
        input   : in std_logic_vector(2 downto 0);
        O0, O1, O2, O3, O4, O5, O6, O7 : out std_logic
    );
    end component three_bit_decoder;
    
    component one_bit_decoder is
    port(input: in std_logic;
         O0, O1: out std_logic
         );
    end component one_bit_decoder;
	 
	 -- 7 SEGMENT DISPLAY LOGIC
	component seg is
	port(
		Inumber: in std_logic_vector(3 downto 0);
		ODisp: out std_logic_vector(6 downto 0)
	);
	end component seg;
	
    
begin

	-- DEBUGGING COMMANDS
	haddr <= "00" & curr_add(5 downto 4);								-- THE HIGH NIBBLE OF THE CURRENT ADDRESS NEEDS TO BE MAPPED TO GO GROM 2 BITS TO 4

	HDigit 	: seg port map(haddr, curr_add_H); 							-- THE HIGH NIBBLE DISPLAY
	LDigit 	: seg port map(curr_add(3 downto 0), curr_add_L);			-- THE LOW NIBBLE DISPLAY
	ALUSEL  : seg port map(ALUSELECT, CURr_aLU_S);						-- THE ALU SELECT VALUE DISPLAY

	-- DECODER INSTANTIATION, WHERE EACH MICROCODE FIELD (M1, M2, M3) GETS IT'S OWN DECODER
    m1_ops   : three_bit_decoder port map(m1, nop1, arin, ardt, trdr, error, acr, acdr);
    m2_ops   : three_bit_decoder port map(m2, nop2, pcin, pcdt, irdr, rac, mdr, drac, zalu);
    m3_ops   : one_bit_decoder port map(m3, nop3, drm); needs to b three bits
    
	 -- INSTANTIATE THE MICROSEQUENCER
    mseq    : microsequencer port map(clk, z, IR, curr_add, m1, m2, m3, ALUSELECT);
    
	 -- COMMAND SIGNALS AND WHEN THEY ARE ACTIVE
	 ARLOAD <= arpc 	or ardt;
	 ARINC 	<= arin;
	 R 		<= drm;
	 W 		<= mdr;
	 MEMBUS <= drm;
	 BUSMEM <= mdr;
	 PCINC 	<= pcin;
	 PCLOAD <= pcdt;
	 PCBUS 	<= arpc;
	 DRLBUS <= acdr 	or mdr;
	 DRHBUS <= pcdt 	or ardt;
	 DRLOAD <= drm 		or drac;
	 TRLOAD <= trdr;
	 TRBUS 	<= ardt 	or pcdt;
	 IRLOAD <= irdr;
	 RLOAD 	<= rac;
	 RBUS 	<= acr 		or aand 	or oor 	or xxor;
	 ACLOAD <= acdr 	or acr 		or plus or minu 	or acin 	or aczo 	or aand 	or oor 	or xxor 	or nnot 	or rshift	or lshift;
	 ACBUS 	<= drac 	or rac;
	 ZLOAD 	<= zalu;

	 alu_cmd <= ALUSELECT;
	 
    
end architecture;


