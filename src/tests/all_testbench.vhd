library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.cpu_constants.all;

entity all_testbench is
end all_testbench;

architecture structural of all_testbench is
    
    component alu_testbench is
    end component;
    
    component buffer_testbench is
    end component;
    
    component cu_testbench is 
    end component;
    
    component nor_testbench is
    end component;
    
    component decoder_testbench is
    end component;
    
    component register_testbench is
    end component;
    
    component top_model_testbench is
    end component;
    
begin
    
    alu_tb_inst  : alu_testbench;
    buff_tb_inst : buffer_testbench;
    cu_tb_inst   : cu_testbench;
    nor_tb_inst  : nor_testbench;
    dec_tb_inst  : decoder_testbench;
    reg_tb_inst  : register_testbench;
    top_tb_inst  : top_model_testbench;    

end structural;
