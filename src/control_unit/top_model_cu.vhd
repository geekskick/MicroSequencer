library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.cpu_constants.all;
use xil_defaultlib.control_unit_constants.all;
use xil_defaultlib.alu_commands.all;

entity top_model_cu is
    port( 
        z       : in  std_logic;
        clk     : in  std_logic;
        ir      : in  std_logic_vector(IR_WIDTH-1 downto 0); -- instruction register low nibble + 1
        error   : out std_logic;
        arload  : out std_logic;
        arinc   : out std_logic;
        rd      : out std_logic;
        wr      : out std_logic; 
        membus  : out std_logic;
        busmem  : out std_logic;
        pcinc   : out std_logic;
        pcload  : out std_logic;
        pcbus   : out std_logic;
        drlbus  : out std_logic;
        drhbus  : out std_logic;
        drload  : out std_logic;
        trload  : out std_logic; 
        trbus   : out std_logic;
        irload  : out std_logic;
        rload   : out std_logic; 
        rbus    : out std_logic;
        acload  : out std_logic;
        acbus   : out std_logic;
        zload   : out std_logic;
        alu_cmd : out alu_commands_t
    );
end entity;

architecture structure of top_model_cu is
    
    signal m3_vector : std_logic_vector(2 downto 0);
    signal m3        : std_logic;
    signal m1        : std_logic_vector(MICROCODE_M1_LEN-1 downto 0);
    signal m2        : std_logic_vector(MICROCODE_M2_LEN-1 downto 0);
    
    signal alu_cmd_i : alu_commands_t;

    signal current_addr : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0);
    
    signal nop1   : std_logic := '0';
    signal nop2   : std_logic := '0';
    signal nop3   : std_logic := '0';
    signal arin   : std_logic := '0';
    signal ardt   : std_logic := '0';
    signal arpc   : std_logic := '0';
    signal acin   : std_logic := '0';
    signal aczo   : std_logic := '0';
    signal acr    : std_logic := '0';
    signal acdr   : std_logic := '0';
    signal minu   : std_logic := '0';
    signal plus   : std_logic := '0';
    signal aand   : std_logic := '0';
    signal oor    : std_logic := '0';
    signal xxor   : std_logic := '0';
    signal nnot   : std_logic := '0';
    signal trdr   : std_logic := '0';
    signal pcin   : std_logic := '0';
    signal pcdt   : std_logic := '0';
    signal irdr   : std_logic := '0';
    signal rac    : std_logic := '0';
    signal mdr    : std_logic := '0';
    signal drac   : std_logic := '0';
    signal zalu   : std_logic := '0';
    signal drm    : std_logic := '0';
    signal lshift : std_logic := '0';
    signal rshift : std_logic := '0';
    
    
    -- COMPONENT DECLARATIONS FOLLOW
    component microsequencer is
        port(
            clk              : in  std_logic;
            z                : in  std_logic;
            instruction      : in  std_logic_vector(IR_WIDTH-1 downto 0);
            current_addr_out : out std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0);
            m1               : out std_logic_vector(MICROCODE_M1_LEN-1 downto 0);
            m2               : out std_logic_vector(MICROCODE_M2_LEN-1 downto 0);
            m3               : out std_logic;
            alu_cmd          : out alu_commands_t
        );
    end component microsequencer;
    
    component three_bit_decoder is
        port(
            a  : in  std_logic_vector(2 downto 0);
            d0 : out std_logic;
            d1 : out std_logic; 
            d2 : out std_logic; 
            d3 : out std_logic; 
            d4 : out std_logic; 
            d5 : out std_logic; 
            d6 : out std_logic; 
            d7 : out std_logic
        );
    end component three_bit_decoder;
    
begin 
    m1_ops : three_bit_decoder port map(
        a  => m1, 
        d0 => nop1, 
        d1 => arin, 
        d2 => ardt, 
        d3 => arpc, 
        d4 => trdr, 
        d5 => error, 
        d6 => acr, 
        d7 => acdr
    );

    m2_ops : three_bit_decoder port map(
        a  => m2, 
        d0 => nop2, 
        d1 => pcin, 
        d2 => pcdt, 
        d3 => irdr, 
        d4 => rac, 
        d5 => mdr, 
        d6 => drac, 
        d7 => zalu
    );

    m3_vector <= "00" & m3;
    m3_ops : three_bit_decoder port map(
        a  => m3_vector, 
        d0 => nop3, 
        d1 => drm, 
        d2 => open, 
        d3 => open, 
        d4 => open, 
        d5 => open, 
        d6 => open,
        d7 => open
    );

    mseq : microsequencer port map(
        clk              => clk, 
        z                => z, 
        instruction      => IR, 
        current_addr_out => current_addr, 
        m1               => m1, 
        m2               => m2, 
        m3               => m3, 
        alu_cmd          => alu_cmd_i
    );
    
    -- cmd SIGNALS AND WHEN THEY ARE ACTIVE
    arload  <= arpc or ardt;
    arinc   <= arin;
    rd      <= drm;
    wr      <= mdr;
    membus  <= drm;
    busmem  <= mdr;
    pcinc   <= pcin;
    pcload  <= pcdt;
    pcbus   <= arpc;
    drlbus  <= acdr or mdr;
    drhbus  <= pcdt or ardt;
    drload  <= drm or drac;
    trload  <= trdr;
    trbus   <= ardt or pcdt;
    irload  <= irdr;
    rload   <= rac;
    rbus    <= '1' when(alu_cmd_i = alu_add1 or alu_cmd_i = alu_sub1 or alu_cmd_i = alu_and1 or alu_cmd_i = alu_or1 or alu_cmd_i = alu_xor1 or acr = '1') else '0';
    acload  <= '1' when (alu_cmd_i /= alu_dont_care) else '0';
    acbus   <= drac or rac;
    zload   <= zalu;
    alu_cmd <= alu_cmd_i;
    
end architecture;
