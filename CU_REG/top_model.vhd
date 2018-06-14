library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.constants.all;

entity top_model is
port(
    clk    : in std_logic;
    tb_z   : out std_logic;
    tb_ir  : out std_logic_vector(7 downto 0);
    tb_ac  : out std_logic_vector(7 downto 0);
    tb_drl : out std_logic_vector(7 downto 0);
    tb_drh : out std_logic_vector(7 downto 0);
    tb_tr  : out std_logic_vector(7 downto 0);
    tb_ar  : out std_logic_vector(7 downto 0);
    tb_pc  : out std_logic_vector(15 downto 0);
    tb_db  : out std_logic_vector(15 downto 0);
    
    -- mmory interface
    mem_wr  : out std_logic;
    mem_rd  : out std_logic;
    mem_addr : out std_logic_vector(6 downto 0); 
    mem_out : in std_logic_vector(7 downto 0); 
    mem_in  : out std_logic_vector(7 downto 0)
    
);
end entity top_model;

architecture struct of top_model is

    component ALU is
     port(
        AC, SigBus  : in signed(7 downto 0); 
        Logic       : in unsigned(3 downto 0); 
        Output      : out std_logic_vector(7 downto 0)
     );
    end component ALU;

    component top_model_cu is
    port( 
        -- INPUTS
        z, clk      : in std_logic;
        IR          : in std_logic_vector(4 downto 0); -- INSTRUCTION REGISTER LOW NIBBLE + 1
       
        -- COMMAND SIGNALS
        error, arload, arinc, r, w, membus, busmem, pcinc, pcload, pcbus, drlbus, drhbus, drload, trload, trbus, irload, rload, rbus, acload, acbus, zload    : out std_logic;

        alu_cmd : out std_logic_vector(3 downto 0); -- TO THE ALU INPUT
       
        --segment displayers
        curr_add_H: out std_logic_vector(6 downto 0); -- HIGH NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_add_L: out std_logic_vector(6 downto 0); -- LOW NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_alu_S: out std_logic_vector(6 downto 0)  -- ALUSELECT DISPLAY
    );
    end component;
    
    component generic_buffer is
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
    end component generic_buffer; 
        
    component z_reg is
    port(
        clk     : in std_logic;
        inp     : in std_logic_vector (7 downto 0);
        enb     : in std_logic;
        otp     : out std_logic
        );
    end component z_reg;
    
    component tristate_buffer is
    generic(data_width: natural);
    port(
        a   : in std_logic_vector(data_width-1 downto 0);
        q   : out std_logic_vector(data_width-1 downto 0);
        en  : in std_logic
    );
    end component tristate_buffer;
    
    component small_memory is
    port( 
        adr     : in  std_logic_vector(6 downto 0);
        o0      : out std_logic_vector(7 downto 0);
        i0      : in std_logic_vector(7 downto 0); 
        r, w    : in std_logic := '0'              
    );
    end component small_memory;

    constant REG_WIDTH: integer := DB_WIDTH/2;

    signal databus  : std_logic_vector(DB_WIDTH-1 downto 0);
    
    -- Dummy not used
    signal alu_dum  : std_logic_vector(6 downto 0); 
    signal w1       : std_logic_vector(6 downto 0);
    signal w2       : std_logic_vector(6 downto 0);
    
    -- From the intrustion reg to the cu
    signal ir       : std_LOGIC_VECTOR(REG_WIDTH-1 downto 0);
    
    signal sig_mem_to_bus : std_logic_vector(REG_WIDTH-1 downto 0);
    signal sig_bus_to_mem : std_logic_vector(REG_WIDTH-1 downto 0);
    
    -- From the cu to the alu
    signal sig_alu_cmd    : std_logic_vector(3 downto 0);
    
    -- command signals from cu to other places
    signal error    : std_logic;
    signal arload   : std_logic;
    signal arinc    : std_logic;
    signal rd       : std_logic;
    signal wr       : std_logic;
    signal membus   : std_logic;
    signal busmem   : std_logic;
    signal pcinc    : std_logic;
    signal pcload   : std_logic;
    signal pcbus    : std_logic;
    signal drlbus   : std_logic;
    signal drhbus   : std_logic;
    signal drload   : std_logic;
    signal trload   : std_logic;
    signal trbus    : std_logic;
    signal irload   : std_logic;
    signal rload    : std_logic;
    signal rbus     : std_logic;
    signal acload   : std_logic;
    signal acbus    : std_logic;
    signal zload    : std_logic;
    signal z        : std_logic;
    
    -- Outputs from the Registers
    signal pcbridge : std_logic_vector(DB_WIDTH-1 downto 0);
    signal arbridge : std_logic_vector(DB_WIDTH-1 downto 0);
    signal drbridge : std_logic_vector(REG_WIDTH-1 downto 0); 
    signal trbridge : std_logic_vector(REG_WIDTH-1 downto 0);
    signal acbridge : std_logic_vector(REG_WIDTH-1 downto 0); 
    signal alubridge: std_logic_vector(REG_WIDTH-1 downto 0);
    signal rbridge  : std_logic_vector(REG_WIDTH-1 downto 0);
    
    -- Outputs from the buffers to the databus
    -- These normally wouldn't be useful but for testing purpose
    -- I want the buffer outputs to go to the outside world
    signal drl_buff_db  : std_logic_vector(REG_WIDTH-1 downto 0);
    signal drh_buff_db  : std_logic_vector(REG_WIDTH-1 downto 0);
    signal tr_buff_db   : std_logic_vector(REG_WIDTH-1 downto 0);
    signal ac_buff_db   : std_logic_vector(REG_WIDTH-1 downto 0);
    signal r_buff_db    : std_logic_vector(REG_WIDTH-1 downto 0);
    signal mem_buff_db  : std_logic_vector(REG_WIDTH-1 downto 0);
    signal pc_buff_db   : std_logic_vector(DB_WIDTH-1 downto 0);

begin
    -- Test bench signals
    tb_z    <= sig_z;
    tb_ir   <= ir;
    tb_pc   <= pc_buff_db;
    tb_drl  <= drl_buff_db;
    tb_drh  <= drh_buff_db;
    tb_db   <= databus;
    tb_ac   <= ac_buff_db;
    tb_tr   <= tr_buff_db;
    
    -- Connect the memory to the outside world
    mem_wr  <= wr;
    mem_rd  <= rd;
    mem_addr<= arbridge(6 downto 0);
    mem_in  <= sig_bus_to_mem;
    sig_mem_to_bus <= mem_out;

    -- Connect the buffer outputs to the databus
    databus(REG_WIDTH-1 downto 0) <= drl_buff_db;
    databus(REG_WIDTH-1 downto 0) <= tr_buff_db;
    databus(REG_WIDTH-1 downto 0) <= r_buff_db;
    databus(REG_WIDTH-1 downto 0) <= ac_buff_db;
    databus(REG_WIDTH-1 downto 0) <= mem_buff_db;

    databus <= pc_buff_db;
    databus(DB_WIDTH-1 downto REG_WIDTH) <= drh_buff_db;
    
    -- Control unit
cu_inst: 
    top_model_cu port map(
        z           => z,
        clk         => clk,
        ir          => ir(4 downto 0),
        error       => error,
        arload      => arload, 
        arinc       => arinc, 
        rd          => rd, 
        wr          => wr, 
        membus      => membus, 
        busmem      => busmem, 
        pcinc       => pcinc, 
        pcload      => pcload, 
        pcbus       => pcbus, 
        drlbus      => drlbus, 
        drhbus      => drhbus, 
        drload      => drload, 
        trload      => trload, 
        trbus       => trbus, 
        irload      => irload, 
        rload       => rload, 
        rbus        => rbus, 
        acload      => acload, 
        acbus       => acbus, 
        zload       => zload, 
        alu_cmd     => sig_alu_cmd, 
        curr_add_h  => w1, 
        curr_add_l  => w2, 
        curr_alu_s  => alu_dum
    );
    
    -- Program counter
pc_inst: 
    generic_register generic map(
        data_width => DB_WIDTH
    ),
    port map(
        clk     => clk, 
        data    => databus, 
        load    => pcload, 
        inc     => pcinc, 
        q       => pcbridge
    );
    
    -- Address reg
ar_inst: 
    generic_register generic map(
        data_width => DB_WIDTH
    ),
    port map(
        clk     => clk, 
        data    => databus, 
        load    => arload, 
        inc     => arinc, 
        q       => arbridge
    );
    
    -- Data reg
dr_inst: 
    generic_register generic map(
        data_width => REG_WIDTH
    ),
    port map(
        clk     => clk, 
        data    => databus(REG_WIDTH-1 downto 0), 
        load    => drload, 
        inc     => '0', 
        q       => drbridge
    );
    
    -- T reg
tr_inst: 
    generic_register generic map(
        data_width => REG_WIDTH
    ),
    port map(
        clk     => clk, 
        data    => drbridge, 
        load    => trload, 
        inc     => '0', 
        q       => trbridge
    );
    
    -- R reg
r_inst: 
    generic_register generic map(
        data_width => REG_WIDTH
    ),
    port map(
        clk     => clk, 
        data    => databus(REG_WIDTH-1 downto 0), 
        load    => rload, 
        inc     => '0', 
        q       => rbridge
    );
    
    -- Accumulator
acc_inst: 
    generic_register generic map(
        data_width => REG_WIDTH
    ),
    port map(
        clk     => clk, 
        data    => alubridge, 
        load    => acload, 
        inc     => '0', 
        q       => acbridge
    );
    
    -- ALU
alu_inst: alu port map(signed(acbridge), signed(databus(REG_WIDTH-1 downto 0)), unsigned(sig_alu_cmd), alubridge);
    
    -- Z Register
z_inst: z_reg port map(clk, alubridge, zload, sig_z);
    
    -- Instruction Register
i_inst: 
    generic_register generic map(
        data_width => REG_WIDTH
    ),
    port map(
        clk     => clk, 
        data    => drbirdge, 
        load    => irload, 
        inc     => '0', 
        q       => ir
    );
    
    -- memory
    -- ram_inst: small_memory port map(arbridge(6 downto 0), sig_mem_to_bus, sig_bus_to_mem,rd, wr);
     
    -- Tri states                              width               in                      out                         enable
    -------------------------------------------------------------------------------------------------------------------------------
membusbuf_inst   : tristate_buffer generic map(REG_WIDTH)   port map(sig_mem_to_bus,        mem_buff_db,                membus);
busmembuf_inst   : tristate_buffer generic map(REG_WIDTH)   port map(databus(REG_WIDTH-1 downto 0),   sig_bus_to_mem,   busmem);
acbuff_inst      : tristate_buffer generic map(REG_WIDTH)   port map(acbridge,              ac_buff_db,                 acbus);
rbuff_inst       : tristate_buffer generic map(REG_WIDTH)   port map(rbridge,               r_buff_db,                  rbus);
pcbuf_inst       : tristate_buffer generic map(DB_WIDTH)    port map(pcbridge,              pc_buff_db,                 pcbus);
drhbuf_inst      : tristate_buffer generic map(REG_WIDTH)   port map(drbridge,              drh_buff_db,                drhbus);
drlbuf_inst      : tristate_buffer generic map(REG_WIDTH)   port map(drbridge,              drl_buff_db,                drlbus);
trbuf_inst       : tristate_buffer generic map(REG_WIDTH)   port map(trbridge,              tr_buff_db,                 trbus);
    
end architecture struct;