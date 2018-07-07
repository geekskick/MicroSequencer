library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.constants.all;

entity top_model is
    port(
        clk : in std_logic;
        
        -- Testbench signals
        tb_z   : out std_logic;
        tb_ir  : out std_logic_vector(7 downto 0);
        tb_ac  : out std_logic_vector(7 downto 0);
        tb_drl : out std_logic_vector(7 downto 0);
        tb_drh : out std_logic_vector(7 downto 0);
        tb_tr  : out std_logic_vector(7 downto 0);
        tb_ar  : out std_logic_vector(7 downto 0);
        tb_pc  : out std_logic_vector(15 downto 0);
        tb_db  : out std_logic_vector(15 downto 0);
        
        -- CU control signals
        tb_error   : out std_logic;
        tb_arload  : out std_logic;
        tb_arinc   : out std_logic;
        tb_rd      : out std_logic;
        tb_wr      : out std_logic; 
        tb_membus  : out std_logic;
        tb_busmem  : out std_logic;
        tb_pcinc   : out std_logic;
        tb_pcload  : out std_logic;
        tb_pcbus   : out std_logic;
        tb_drlbus  : out std_logic;
        tb_drhbus  : out std_logic;
        tb_drload  : out std_logic;
        tb_trload  : out std_logic; 
        tb_trbus   : out std_logic;
        tb_irload  : out std_logic;
        tb_rload   : out std_logic; 
        tb_rbus    : out std_logic;
        tb_acload  : out std_logic;
        tb_acbus   : out std_logic;
        tb_zload   : out std_logic;
        tb_alu_cmd : out std_logic_vector(ALU_CMD_WIDTH-1 downto 0);
        
        -- Memory interface
        mem_wr   : out std_logic;
        mem_rd   : out std_logic;
        mem_addr : out std_logic_vector(6 downto 0); 
        mem_out  : in  std_logic_vector(7 downto 0); 
        mem_in   : out std_logic_vector(7 downto 0)
        
    );
end entity top_model;

architecture struct of top_model is
    
    component ALU is
        port(
            operand1 : in  signed(7 downto 0); 
            operand2 : in  signed(7 downto 0); 
            cmd      : in  unsigned(ALU_CMD_WIDTH-1 downto 0); 
            q        : out std_logic_vector(7 downto 0)
        );
    end component ALU;
    
    component top_model_cu is
        port( 
            z       : in  std_logic;
            clk     : in  std_logic;
            ir      : in  std_logic_vector(4 downto 0); -- instruction register low nibble + 1
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
            alu_cmd : out std_logic_vector(ALU_CMD_WIDTH-1 downto 0) -- to the alu input
        );
    end component;
    
    component generic_register is
        generic(
            data_width : natural
        );
        port(
            clk  : in  std_logic;
            data : in  std_logic_vector(data_width-1 downto 0);
            load : in  std_logic;
            inc  : in  std_logic;
            q    : out std_logic_vector(data_width-1 downto 0)
        );
    end component generic_register; 
    
    component nor_vector is
        generic(
            v_width : natural
        );
        port(
            d : in  std_logic_vector(v_width-1 downto 0);
            q : out std_logic
        );
    end component nor_vector;
    
    component tristate_buffer is
        generic(data_width : natural);
        port(
            a  : in  std_logic_vector(data_width-1 downto 0);
            q  : out std_logic_vector(data_width-1 downto 0);
            en : in  std_logic
        );
    end component tristate_buffer;
    
    component small_memory is
        port( 
            adr  : in  std_logic_vector(6 downto 0);
            o0   : out std_logic_vector(7 downto 0);
            i0   : in  std_logic_vector(7 downto 0); 
            r, w : in  std_logic 
        );
    end component small_memory;
    
    constant REG_WIDTH : integer := DB_WIDTH/2;
    
    signal databus    : std_logic_vector(DB_WIDTH-1 downto 0);
    signal ac_is_zero : std_logic_vector(0 downto 0);
    
    -- From the intrustion reg to the cu
    signal ir : std_logic_vector(REG_WIDTH-1 downto 0);
    
    signal sig_mem_to_bus : std_logic_vector(REG_WIDTH-1 downto 0);
    signal sig_bus_to_mem : std_logic_vector(REG_WIDTH-1 downto 0);
    
    -- From the cu to the alu
    signal sig_alu_cmd : std_logic_vector(ALU_CMD_WIDTH-1 downto 0);
    
    -- cmd signals from cu to other places
    signal error  : std_logic;
    signal arload : std_logic;
    signal arinc  : std_logic;
    signal rd     : std_logic;
    signal wr     : std_logic;
    signal membus : std_logic;
    signal busmem : std_logic;
    signal pcinc  : std_logic;
    signal pcload : std_logic;
    signal pcbus  : std_logic;
    signal drlbus : std_logic;
    signal drhbus : std_logic;
    signal drload : std_logic;
    signal trload : std_logic;
    signal trbus  : std_logic;
    signal irload : std_logic;
    signal rload  : std_logic;
    signal rbus   : std_logic;
    signal acload : std_logic;
    signal acbus  : std_logic;
    signal zload  : std_logic;
    signal z      : std_logic_vector(0 downto 0);
    
    -- Outputs from the Registers
    signal pcbridge  : std_logic_vector(DB_WIDTH-1 downto 0);
    signal arbridge  : std_logic_vector(DB_WIDTH-1 downto 0);
    signal drbridge  : std_logic_vector(REG_WIDTH-1 downto 0); 
    signal trbridge  : std_logic_vector(REG_WIDTH-1 downto 0);
    signal acbridge  : std_logic_vector(REG_WIDTH-1 downto 0); 
    signal alubridge : std_logic_vector(REG_WIDTH-1 downto 0);
    signal rbridge   : std_logic_vector(REG_WIDTH-1 downto 0);
    
    -- Outputs from the buffers to the databus
    -- These normally wouldn't be useful but for testing purpose
    -- I want the buffer outputs to go to the outside world
    signal drl_buff_db : std_logic_vector(REG_WIDTH-1 downto 0);
    signal drh_buff_db : std_logic_vector(REG_WIDTH-1 downto 0);
    signal tr_buff_db  : std_logic_vector(REG_WIDTH-1 downto 0);
    signal ac_buff_db  : std_logic_vector(REG_WIDTH-1 downto 0);
    signal r_buff_db   : std_logic_vector(REG_WIDTH-1 downto 0);
    signal mem_buff_db : std_logic_vector(REG_WIDTH-1 downto 0);
    signal pc_buff_db  : std_logic_vector(DB_WIDTH-1 downto 0);
    
begin
    -- Test bench signals
    tb_z   <= z(0);
    tb_ir  <= ir;
    tb_pc  <= pc_buff_db;
    tb_drl <= drl_buff_db;
    tb_drh <= drh_buff_db;
    tb_db  <= databus;
    tb_ac  <= ac_buff_db;
    tb_tr  <= tr_buff_db;
    
    tb_error   <= error; 
    tb_arload  <= arload;
    tb_arinc   <= arinc; 
    tb_rd      <= rd; 
    tb_wr      <= wr; 
    tb_membus  <= membus;
    tb_busmem  <= busmem;
    tb_pcinc   <= pcinc;
    tb_pcload  <= pcload;
    tb_pcbus   <= pcbus;
    tb_drlbus  <= drlbus;
    tb_drhbus  <= drhbus;
    tb_drload  <= drload;
    tb_trload  <= trload;
    tb_trbus   <= trbus;
    tb_irload  <= irload; 
    tb_rload   <= rload;
    tb_rbus    <= rbus; 
    tb_acload  <= acload;
    tb_acbus   <= acbus;
    tb_zload   <= zload; 
    tb_alu_cmd <= alu_cmd;
    
    -- Connect the memory to the outside world
    mem_wr         <= wr;
    mem_rd         <= rd;
    mem_addr       <= arbridge(6 downto 0);
    mem_in         <= sig_bus_to_mem;
    sig_mem_to_bus <= mem_out;
    
    -- Connect the buffer outputs to the databus
    databus(REG_WIDTH-1 downto 0) <= drl_buff_db;
    databus(REG_WIDTH-1 downto 0) <= tr_buff_db;
    databus(REG_WIDTH-1 downto 0) <= r_buff_db;
    databus(REG_WIDTH-1 downto 0) <= ac_buff_db;
    databus(REG_WIDTH-1 downto 0) <= mem_buff_db;
    
    databus                              <= pc_buff_db;
    databus(DB_WIDTH-1 downto REG_WIDTH) <= drh_buff_db;
    
    -- Control unit
    cu_inst : top_model_cu port map(
        z       => z(0),
        clk     => clk,
        ir      => ir(4 downto 0),
        error   => error,
        arload  => arload, 
        arinc   => arinc, 
        rd      => rd, 
        wr      => wr, 
        membus  => membus, 
        busmem  => busmem, 
        pcinc   => pcinc, 
        pcload  => pcload, 
        pcbus   => pcbus, 
        drlbus  => drlbus, 
        drhbus  => drhbus, 
        drload  => drload, 
        trload  => trload, 
        trbus   => trbus, 
        irload  => irload, 
        rload   => rload, 
        rbus    => rbus, 
        acload  => acload, 
        acbus   => acbus, 
        zload   => zload, 
        alu_cmd => sig_alu_cmd
    );

-- Program counter
    pc_inst : generic_register generic map(
        data_width => DB_WIDTH
    )
    port map(
        clk  => clk, 
        data => databus, 
        load => pcload, 
        inc  => pcinc, 
        q    => pcbridge
    );

-- Address reg
    ar_inst : generic_register generic map(
        data_width => DB_WIDTH
    )
    port map(
        clk  => clk, 
        data => databus, 
        load => arload, 
        inc  => arinc, 
        q    => arbridge
    );

-- Data reg
    dr_inst : generic_register generic map(
        data_width => REG_WIDTH
    )
    port map(
        clk  => clk, 
        data => databus(REG_WIDTH-1 downto 0), 
        load => drload, 
        inc  => '0', 
        q    => drbridge
    );

-- T reg
    tr_inst : generic_register generic map(
        data_width => REG_WIDTH
    )
    port map(
        clk  => clk, 
        data => drbridge, 
        load => trload, 
        inc  => '0', 
        q    => trbridge
    );

-- R reg
    r_inst : generic_register generic map(
        data_width => REG_WIDTH
    )
    port map(
        clk  => clk, 
        data => databus(REG_WIDTH-1 downto 0), 
        load => rload, 
        inc  => '0', 
        q    => rbridge
    );

-- Accumulator
    acc_inst : generic_register generic map(
        data_width => REG_WIDTH
    )
    port map(
        clk  => clk, 
        data => alubridge, 
        load => acload, 
        inc  => '0', 
        q    => acbridge
    );

-- ALU
    alu_inst : alu port map(
        operand1 => signed(acbridge), 
        operand2 => signed(databus(REG_WIDTH-1 downto 0)), 
        cmd      => unsigned(sig_alu_cmd), 
        q        => alubridge
    );

-- Z Register
    z_inst : generic_register generic map(
        data_width => 1
    )
    port map(
        clk  => clk, 
        data => ac_is_zero,
        load => zload,
        inc  => '0',
        q    => z
    );

    nor_inst : nor_vector generic map(
        v_width => DB_WIDTH
    )
    port map(
        d => alubridge,
        q => ac_is_zero(0)
    );

-- Instruction Register
    i_inst : generic_register generic map(
        data_width => REG_WIDTH
    )
    port map(
        clk  => clk, 
        data => drbridge, 
        load => irload, 
        inc  => '0', 
        q    => ir
    );

-- memory
-- ram_inst: small_memory port map(arbridge(6 downto 0), sig_mem_to_bus, sig_bus_to_mem,rd, wr);

-- Tri states                              width               in                      out                         enable
-------------------------------------------------------------------------------------------------------------------------------
    membusbuf_inst : tristate_buffer generic map(REG_WIDTH) port map(sig_mem_to_bus, mem_buff_db, membus);
    busmembuf_inst : tristate_buffer generic map(REG_WIDTH) port map(databus(REG_WIDTH-1 downto 0), sig_bus_to_mem, busmem);
    acbuff_inst    : tristate_buffer generic map(REG_WIDTH) port map(acbridge, ac_buff_db, acbus);
    rbuff_inst     : tristate_buffer generic map(REG_WIDTH) port map(rbridge, r_buff_db, rbus);
    pcbuf_inst     : tristate_buffer generic map(DB_WIDTH) port map(pcbridge, pc_buff_db, pcbus);
    drhbuf_inst    : tristate_buffer generic map(REG_WIDTH) port map(drbridge, drh_buff_db, drhbus);
    drlbuf_inst    : tristate_buffer generic map(REG_WIDTH) port map(drbridge, drl_buff_db, drlbus);
    trbuf_inst     : tristate_buffer generic map(REG_WIDTH) port map(trbridge, tr_buff_db, trbus);
    
end architecture struct;