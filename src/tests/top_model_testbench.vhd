library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.constants.all;

entity top_model_testbench is
end top_model_testbench;

architecture behavioural of top_model_testbench is
    
    component top_model is
        port(
            clk   : in  std_logic;
            tb_z  : out std_logic;
            tb_ir : out std_logic_vector(7 downto 0);
            tb_ac : out std_logic_vector(7 downto 0);
            tb_dr : out std_logic_vector(7 downto 0);
            tb_tr : out std_logic_vector(7 downto 0);
            tb_ar : out std_logic_vector(7 downto 0);
            tb_pc : out std_logic_vector(15 downto 0);
            tb_db : out std_logic_vector(15 downto 0);
            
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
            mem_wr : out std_logic;
            mem_rd  : out std_logic;
            mem_adr : out std_logic_vector(6 downto 0); 
            mem_out : in  std_logic_vector(7 downto 0); 
            mem_in  : out std_logic_vector(7 downto 0) 
        );
    end component;

    constant ldac   : std_logic_vector(7 downto 0) := X"01";
    constant period : time                         := 200ns;
    signal clk      : std_logic;
    signal stop     : boolean := false;
    signal z        : std_logic;
    signal ir       : std_logic_vector(7 downto 0);
    signal ar       : std_logic_vector(7 downto 0);
    signal ac       : std_logic_vector(7 downto 0);
    signal dr       : std_logic_vector(7 downto 0);
    signal tr       : std_logic_vector(7 downto 0);
    signal pc       : std_logic_vector(15 downto 0);
    signal db       : std_logic_vector(15 downto 0);
    
    signal r        : std_logic;
    signal w        : std_logic;
    signal mem_a    : std_logic_vector(6 downto 0);
    signal mem_i    : std_logic_vector(7 downto 0);
    signal mem_o    : std_logic_vector(7 downto 0);
    
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
    signal alu_cmd  : std_logic_vector(ALU_CMD_WIDTH-1 downto 0);
    
begin
    uut : top_model port map(
        clk   => clk,
        tb_z  => z,
        tb_ir => ir,
        tb_ac => ac,
        tb_dr => dr,
        tb_tr => tr,
        tb_ar => ar,
        tb_pc => pc, 
        tb_db => db,
        
        tb_error   => error,
        tb_arload  => arload, 
        tb_arinc   => arinc, 
        tb_rd      => rd, 
        tb_wr      => wr, 
        tb_membus  => membus,
        tb_busmem  => busmem, 
        tb_pcinc   => pcinc, 
        tb_pcload  => pcload, 
        tb_pcbus   => pcbus, 
        tb_drlbus  => drlbus, 
        tb_drhbus  => drhbus, 
        tb_drload  => drload, 
        tb_trload  => trload, 
        tb_trbus   => trbus, 
        tb_irload  => irload, 
        tb_rload   => rload, 
        tb_rbus    => rbus, 
        tb_acload  => acload, 
        tb_acbus   => acbus, 
        tb_zload   => zload, 
        tb_alu_cmd => alu_cmd,
        
        -- mmory interface
        mem_wr  => r,
        mem_rd  => w,
        mem_adr => mem_a,
        mem_out => mem_o,
        mem_in  => mem_i 
    );
    
    clk_tick : process
    begin
        while stop = false loop
            clk <= '1';
            wait for period/2;
            clk <= '0';
            wait for period/2;
        end loop;
        wait;
    end process;
    
    stim : process
    begin
        mem_o <= ldac;
        assert to_integer(unsigned(pc)) = 0 report "PC didn't init : " & to_hstring(pc);
        
        wait for 2* period;
        mem_o <= X"08";
        wait for 1* period;
        
        assert ir = ldac report "IR isn't 01                      : 0x" & to_hstring(ir);
        assert to_integer(unsigned(pc)) = 1 report "PC didn't INC : " & to_hstring(pc);
        
        wait for 5* period;
        assert ac = X"08" report "AC isn't 0x08, LDAC failure : 0x" & to_hstring(ac);
        
        stop <= true;
        wait;
    end process;
    
end behavioural;
