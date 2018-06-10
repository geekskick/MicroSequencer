library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_model is
port(
    clk: in std_logic;
    tb_z: out std_logic;
    tb_ir: out std_logic_vector(7 downto 0);
    tb_ac: out std_logic_vector(7 downto 0);
    tb_drl: out std_logic_vector(7 downto 0);
    tb_drh: out std_logic_vector(7 downto 0);
    tb_tr: out std_logic_vector(7 downto 0);
    tb_ar: out std_logic_vector(7 downto 0);
    tb_pc: out std_logic_vector(15 downto 0);
    tb_db: out std_logic_vector(15 downto 0);
    
    -- mmory interface
    mem_wr: out std_logic;
    mem_rd: out std_logic;
    mem_adr : out std_logic_vector(6 downto 0); 
    mem_out : in std_logic_vector(7 downto 0); 
    mem_in  : out std_logic_vector(7 downto 0)
    
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
    
    component sixteen_bit_data_reg_with_incr is
    port(
        input   : in STD_LOGIC_VECTOR (15 downto 0);
        clk     : in STD_LOGIC;
        pcld    : in  STD_LOGIC;
        pcinc   : in STD_LOGIC;
        output  : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component sixteen_bit_data_reg_with_incr; 
    
    component eight_bit_data_reg is
    port(
        set     : in STD_LOGIC;
        clk     : in STD_LOGIC;
        inp     : in STD_LOGIC_VECTOR (7 downto 0);
        otp     : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component eight_bit_data_reg;
    
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
    
    signal drl_buff_db, drh_buff_db, tr_buff_db, ac_buff_db, r_buff_db, mem_buff_db: std_logic_vector(7 downto 0);
    signal pc_buff_db : std_logic_vector(15 downto 0);

begin
    -- test bench signals
    tb_z    <= sig_z;
    tb_ir   <= ir;
    tb_pc   <= pc_buff_db;
    tb_drl  <= drl_buff_db;
    tb_drh  <= drh_buff_db;
    tb_db   <= databus;
    tb_ac   <= ac_buff_db;
    tb_tr   <= tr_buff_db;
    
    -- connect the memory to the outside world
    mem_wr  <= W;
    mem_rd  <= R;
    mem_adr <= arbridge(6 downto 0);
    sig_mem_to_bus <= mem_out;
    mem_in  <= sig_bus_to_mem;
       
    databus(7 downto 0) <= drl_buff_db;
    databus(15 downto 8)<= drh_buff_db;
    databus(7 downto 0) <= tr_buff_db;
    databus(7 downto 0) <= r_buff_db;
    databus(7 downto 0) <= ac_buff_db;
    databus(7 downto 0) <= mem_buff_db;
    databus             <= pc_buff_db;
    
    -- control unit
    cu_inst: top_model_cu port map(sig_z, clk, ir(4 downto 0), error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD, sig_alu_cmd, w1, w2, alu_dum);
    
    -- program counter
    pc_inst: sixteen_bit_data_reg_with_incr port map(databus, clk, pcload, pcinc, pcbridge);
    
    -- address reg
    ar_inst: sixteen_bit_data_reg_with_incr port map(databus, clk, arload, arinc, arbridge);
    
    -- data reg
    dr_inst: eight_bit_data_reg port map(drlOAD, clk, databus(7 downto 0), drbridge);
    
    -- t reg
    tr_inst: eight_bit_data_reg port map(trlOAD, clk, drbridge, trbridge);
    
    -- r reg
    r_inst:  eight_bit_data_reg port map(rlOAD, clk,  databus(7 downto 0), rbridge); 
    
    -- accumulator
    acc_inst: eight_bit_data_reg port map(AClOAD, clk, alubridge, acbridge);
    
    -- alu
    alu_inst: alu port map(signed(acbridge), signed(databus (7 downto 0)), unsigned(sig_alu_cmd), alubridge);
    
    -- register
    z_inst: z_reg port map(clk, alubridge, ZLOAD, sig_z);
    
    -- instruction register
    i_inst: eight_bit_data_reg port map(irLOAD, clk, drbridge, ir);
    
    -- memory
    --ram_inst: small_memory port map(arbridge(6 downto 0), sig_mem_to_bus, sig_bus_to_mem, R, W);
    
    -- Tri states                width               in                      out                         enable
    membusbuf_inst   : buff generic map(8)   port map(sig_mem_to_bus,        mem_buff_db,                MEMBUS);
    busmembuf_inst   : buff generic map(8)   port map(databus(7 downto 0),   sig_bus_to_mem,             BUSMEM);
    acbuff_inst      : buff generic map(8)   port map(acbridge,              ac_buff_db,                 ACBUS);
    rbuff_inst       : buff generic map(8)   port map(rbridge,               r_buff_db,                  RBUS);
    pcbuf_inst       : buff generic map(16)  port map(pcbridge,              pc_buff_db,                 PCBUS);
    drhbuf_inst      : buff generic map(8)   port map(drbridge,              drh_buff_db,                DRHBUS);
    drlbuf_inst      : buff generic map(8)   port map(drbridge,              drl_buff_db,                DRLBUS);
    trbuf_inst       : buff generic map(8)   port map(trbridge,              tr_buff_db,                 TRBUS);
    
end architecture struct;