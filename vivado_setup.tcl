start_gui

# Create the project
create_project rs_cpu ~/Documents/vivado/rs_cpu -part xc7z020clg484-1
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]

# Add the files
add_files {./src/constants.vhd ./src/top_model.vhd ./src/control_unit/microcode.vhd ./src/control_unit/top_model_cu.vhd ./src/control_unit/three_bit_decoder.vhd ./src/control_unit/microsequencer.vhd ./src/control_unit/constants.vhd ./src/buffers/generic_buffer.vhd ./src/nor_vector.vhd ./src/registers/generic_register.vhd ./src/alu/alu.vhd ./src/alu/constants.vhd}
add_files -fileset sim_1 {./src/tests/top_model_testbench.vhd ./src/tests/all_testbench.vhd ./src/tests/register_testbench.vhd ./src/tests/alu_testbench.vhd ./src/tests/decoder_testbench.vhd ./src/tests/cu_testbench.vhd ./src/tests/buffer_testbench.vhd ./src/tests/nor_testbench.vhd}

# Make the tests VHDL 2008 and disable the top top top model test cause it doesn't work yet
set_property file_type {VHDL 2008} [get_files [pwd]/src/tests/*.vhd]
set_property is_enabled false [get_files [pwd]/src/tests/top_model_testbench.vhd]

# Set the top model
set_property top all_testbench [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
launch_simulation
run all
