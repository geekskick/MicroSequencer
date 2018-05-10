library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_model is
port(
    clk: in std_logic
);
end entity top_model;

architecture struct of top_model is

    component ALU is
     port(
        AC, SigBus  : in signed(7 downto 0); 
        Logic       : in unsigned(3 downto 0); 
        Output      : out std_LOGIC_VECTOR(7 downto 0)
     );
    end component ALU;

    component top_model_cu is
    port( 
        -- INPUTS
        z, clk      : in std_logic;
        IR          : in std_logic_vector(4 downto 0); -- INSTRUCTION REGISTER LOW NIBBLE + 1
       
        -- COMMAND SIGNALS
        error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD    : out std_logic;

        alu_cmd : out std_logic_vector(3 downto 0); -- TO THE ALU INPUT
       
        --segment displayers
        curr_add_H: out std_logic_vector(6 downto 0); -- HIGH NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_add_L: out std_logic_vector(6 downto 0); -- LOW NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_alu_S: out std_logic_vector(6 downto 0)  -- ALUSELECT DISPLAY
    );
    end component;
    
    component 16_bit_data_reg_with_incr is
    port(
        input   : in STD_LOGIC_VECTOR (15 downto 0);
        clk     : in STD_LOGIC;
        pcld    : in  STD_LOGIC;
        pcinc   : in STD_LOGIC;
        output  : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component 16_bit_data_reg_with_incr; 
    
    component 8_bit_data_reg is
    port(
        set     : in STD_LOGIC;
        clk     : in STD_LOGIC;
        inp     : in STD_LOGIC_VECTOR (7 downto 0);
        otp     : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component 8_bit_data_reg;
    
    component z_reg is
    port(
        clk     : in STD_LOGIC;
        inp     : in STD_LOGIC_VECTOR (7 downto 0);
        enb     : in STD_LOGIC;
        otp     : out STD_LOGIC
        );
    end component z_reg;
    
    component buff is
    generic(data_width: natural);
    port(
        IBus    : in std_logic_vector(data_width-1 downto 0);
        OBus    : out std_logic_vector(data_width-1 downto 0);
        e       : in std_logic
    );
    end component buff;
    
    component small_memory is
    port( 
        adr     : in  std_logic_vector(6 downto 0); -- address to use
        o0      : out std_logic_vector(7 downto 0); -- output data
        i0      : in std_logic_vector(7 downto 0);  -- input data
        r, w    : in std_logic := '0'               -- read or write
    );
    end component small_memory;

    signal databus: std_logic_vector(15 downto 0);
    
    -- dummy not used
    signal alu_dum, w1 ,w2 :std_LOGIC_VECTOR(6 downto 0);
    
    -- from the intrustion reg to the cu
    signal ir :std_LOGIC_VECTOR(7 downto 0);
    
    signal sig_mem_to_bus :std_LOGIC_VECTOR(7 downto 0);
    signal sig_bus_to_mem :std_LOGIC_VECTOR(7 downto 0);
    
    -- from the cu to the alu
    signal sig_alu_cmd  : std_logic_vector(3 downto 0);
    
    -- command signal sfrom cu to other places
    signal error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD   : std_logic;
    
    --z to the cu
    signal sig_z: std_logic;
    
    -- outputs form the pc and ar
    signal pcbridge, arbridge: STD_LOGIC_VECTOR(15 downto 0);
    
    --outputs from the dr, tr, ac and alu and r
    signal drbridge, trbridge, acbridge, alubridge, rbridge: std_LOGIC_VECTOR(7 downto 0);

begin

    -- control unit
    cu: top_model_cu port map(sig_z, clk, ir(4 downto 0), error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD, sig_alu_cmd, w1, w2, alu_dum);
    
    -- program counter
    pc: 16_bit_data_reg_with_incr port map(databus, clk, pcload, pcinc, pcbridge);
    
    -- address reg
    ar: 16_bit_data_reg_with_incr port map(databus, clk, arload, arinc, arbridge);
    
    -- data reg
    dr: 8_bit_data_reg port map(drlOAD, clk, databus(7 downto 0), drbridge);
    
    -- t reg
    tr: 8_bit_data_reg port map(trlOAD, clk, drbridge, trbridge);
    
    -- r reg
    r:  8_bit_data_reg port map(rlOAD, clk,  databus(7 downto 0), rbridge); 
    
    -- accumulator
    acc: 8_bit_data_reg port map(AClOAD, clk, alubridge, acbridge);
    
    -- alu
    alu: alu port map(signed(acbridge), signed(databus (7 downto 0)), unsigned(sig_alu_cmd), alubridge);
    
    -- register
    z: z_reg port map(clk, alubridge, ZLOAD, sig_z);
    
    -- instruction register
    ireg: 8_bit_data_reg port map(irLOAD, clk, drbridge, ir);
    
    -- memory
    ram: small_memory port map(arbridge(6 downto 0), sig_mem_to_bus, sig_bus_to_mem, R, W);
    
    -- Tri states                width               in                      out                     enable
    membusbuf   : buff generic map(8)   port map(sig_mem_to_bus,        databus(7 downto 0),        MEMBUS);
    busmembuf   : buff generic map(8)   port map(databus(7 downto 0),   sig_bus_to_mem,             BUSMEM);
    acbuff      : buff generic map(8)   port map(acbridge,              databus(7 downto 0),        ACBUS);
    rbuff       : buff generic map(8)   port map(rbridge,               databus(7 downto 0),        RBUS);
    pcbuf       : buff generic map(16)  port map(pcbridge,              databus,                    pcBUS);
    drhbuf      : buff generic map(8)   port map(drbridge,              databus(15 downto 8),       DRHBUS);
    drlbuf      : buff generic map(8)   port map(drbridge,              databus(7 downto 0),        DRLBUS);
    trbuf       : buff generic map(8)   port map(trbridge,              databus(7 downto 0),        TRBUS);
    
end architecture struct;