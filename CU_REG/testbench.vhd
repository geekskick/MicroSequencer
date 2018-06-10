library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is

    component top_model is
    port(
        clk: in std_logic;
        tb_z: out std_logic;
        tb_ir: out std_logic_vector(7 downto 0);
        tb_ac: out std_logic_vector(7 downto 0);
        tb_dr: out std_logic_vector(7 downto 0);
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
    end component;
    constant ldac : std_logic_vector(7 downto 0) := X"01";
    constant period : time := 200ns;
    signal clk  : std_logic;
    signal stop : boolean := false;
    signal z    : std_logic;
    signal ir   : std_logic_vector(7 downto 0);
    signal ar   : std_logic_vector(7 downto 0);
    signal ac   : std_logic_vector(7 downto 0);
    signal dr   : std_logic_vector(7 downto 0);
    signal tr   : std_logic_vector(7 downto 0);
    signal pc   : std_logic_vector(15 downto 0);
    signal db   : std_logic_vector(15 downto 0);
    
    signal r    : std_logic;
    signal w    : std_logic;
    signal mem_a: std_logic_vector(6 downto 0);
    signal mem_i: std_logic_vector(7 downto 0);
    signal mem_o: std_logic_vector(7 downto 0);
begin
uut: top_model port map(
        clk     => clk,
        tb_z    => z,
        tb_ir   => ir,
        tb_ac   => ac,
        tb_dr  => dr,
        tb_tr   => tr,
        tb_ar   => ar,
        tb_pc   => pc, 
        tb_db   => db,
        
        -- mmory interface
        mem_wr  => r,
        mem_rd  => w,
        mem_adr => mem_a,
        mem_out => mem_o,
        mem_in  => mem_i    
    );
clk_tick: 
    process
    begin
        while stop = false loop
            clk <= '1';
            wait for period/2;
            clk <= '0';
            wait for period/2;
        end loop;
        wait;
    end process;
    
stim:
    process
    begin
        mem_o <= ldac;
        assert to_integer(unsigned(pc)) = 0 report "PC didn't init: " & to_hstring(pc);

        wait for 1* period;
        mem_o <= X"08";
        wait for 2* period;
        
        assert ir = ldac report "IR isn't 01: 0x" & to_hstring(ir);
        assert to_integer(unsigned(pc)) = 1 report "PC didn't INC: " & to_hstring(pc);
        
        wait for 4* period;
        assert ac = X"08" report "AC isn't 0x08, LDAC failure: 0x" & to_hstring(ac);
        
        
        stop <= true;
        wait;
    end process;

end Behavioral;
