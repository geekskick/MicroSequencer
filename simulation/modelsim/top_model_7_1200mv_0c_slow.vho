-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "03/18/2016 21:31:51"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_model IS
    PORT (
	z : IN std_logic;
	clk : IN std_logic;
	IR : IN std_logic_vector(3 DOWNTO 0);
	error : OUT std_logic;
	ARLOAD : OUT std_logic;
	ARINC : OUT std_logic;
	R : OUT std_logic;
	W : OUT std_logic;
	MEMBUS : OUT std_logic;
	BUSMEM : OUT std_logic;
	PCINC : OUT std_logic;
	PCLOAD : OUT std_logic;
	PCBUS : OUT std_logic;
	DRLBUS : OUT std_logic;
	DRHBUS : OUT std_logic;
	DRLOAD : OUT std_logic;
	TRLOAD : OUT std_logic;
	TRBUS : OUT std_logic;
	IRLOAD : OUT std_logic;
	RLOAD : OUT std_logic;
	RBUS : OUT std_logic;
	ACLOAD : OUT std_logic;
	ACBUS : OUT std_logic;
	ZLOAD : OUT std_logic;
	curr_add_H : OUT std_logic_vector(6 DOWNTO 0);
	curr_add_L : OUT std_logic_vector(6 DOWNTO 0);
	curr_aLU_S : OUT std_logic_vector(6 DOWNTO 0)
	);
END top_model;

-- Design Ports Information
-- error	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ARLOAD	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ARINC	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- W	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MEMBUS	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUSMEM	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCINC	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCLOAD	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCBUS	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRLBUS	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRHBUS	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRLOAD	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TRLOAD	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TRBUS	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IRLOAD	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RLOAD	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RBUS	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ACLOAD	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ACBUS	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ZLOAD	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_H[0]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_H[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_H[2]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_H[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_H[4]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_H[5]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_H[6]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_L[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_L[1]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_L[2]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_L[3]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_L[4]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_L[5]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_add_L[6]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_aLU_S[0]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_aLU_S[1]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_aLU_S[2]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_aLU_S[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_aLU_S[4]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_aLU_S[5]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- curr_aLU_S[6]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_model IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_z : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_IR : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_error : std_logic;
SIGNAL ww_ARLOAD : std_logic;
SIGNAL ww_ARINC : std_logic;
SIGNAL ww_R : std_logic;
SIGNAL ww_W : std_logic;
SIGNAL ww_MEMBUS : std_logic;
SIGNAL ww_BUSMEM : std_logic;
SIGNAL ww_PCINC : std_logic;
SIGNAL ww_PCLOAD : std_logic;
SIGNAL ww_PCBUS : std_logic;
SIGNAL ww_DRLBUS : std_logic;
SIGNAL ww_DRHBUS : std_logic;
SIGNAL ww_DRLOAD : std_logic;
SIGNAL ww_TRLOAD : std_logic;
SIGNAL ww_TRBUS : std_logic;
SIGNAL ww_IRLOAD : std_logic;
SIGNAL ww_RLOAD : std_logic;
SIGNAL ww_RBUS : std_logic;
SIGNAL ww_ACLOAD : std_logic;
SIGNAL ww_ACBUS : std_logic;
SIGNAL ww_ZLOAD : std_logic;
SIGNAL ww_curr_add_H : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_curr_add_L : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_curr_aLU_S : std_logic_vector(6 DOWNTO 0);
SIGNAL \rtl~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \mseq|microcode|Mux4~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux6~2_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux6~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux6~4_combout\ : std_logic;
SIGNAL \mseq|Mux4~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux14~6_combout\ : std_logic;
SIGNAL \rtl~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux14~4_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux14~5_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux14~7_combout\ : std_logic;
SIGNAL \mseq|Mux2~4_combout\ : std_logic;
SIGNAL \mseq|Mux2~5_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \IR[2]~input_o\ : std_logic;
SIGNAL \IR[1]~input_o\ : std_logic;
SIGNAL \IR[3]~input_o\ : std_logic;
SIGNAL \rtl~0clkctrl_outclk\ : std_logic;
SIGNAL \error~output_o\ : std_logic;
SIGNAL \ARLOAD~output_o\ : std_logic;
SIGNAL \ARINC~output_o\ : std_logic;
SIGNAL \R~output_o\ : std_logic;
SIGNAL \W~output_o\ : std_logic;
SIGNAL \MEMBUS~output_o\ : std_logic;
SIGNAL \BUSMEM~output_o\ : std_logic;
SIGNAL \PCINC~output_o\ : std_logic;
SIGNAL \PCLOAD~output_o\ : std_logic;
SIGNAL \PCBUS~output_o\ : std_logic;
SIGNAL \DRLBUS~output_o\ : std_logic;
SIGNAL \DRHBUS~output_o\ : std_logic;
SIGNAL \DRLOAD~output_o\ : std_logic;
SIGNAL \TRLOAD~output_o\ : std_logic;
SIGNAL \TRBUS~output_o\ : std_logic;
SIGNAL \IRLOAD~output_o\ : std_logic;
SIGNAL \RLOAD~output_o\ : std_logic;
SIGNAL \RBUS~output_o\ : std_logic;
SIGNAL \ACLOAD~output_o\ : std_logic;
SIGNAL \ACBUS~output_o\ : std_logic;
SIGNAL \ZLOAD~output_o\ : std_logic;
SIGNAL \curr_add_H[0]~output_o\ : std_logic;
SIGNAL \curr_add_H[1]~output_o\ : std_logic;
SIGNAL \curr_add_H[2]~output_o\ : std_logic;
SIGNAL \curr_add_H[3]~output_o\ : std_logic;
SIGNAL \curr_add_H[4]~output_o\ : std_logic;
SIGNAL \curr_add_H[5]~output_o\ : std_logic;
SIGNAL \curr_add_H[6]~output_o\ : std_logic;
SIGNAL \curr_add_L[0]~output_o\ : std_logic;
SIGNAL \curr_add_L[1]~output_o\ : std_logic;
SIGNAL \curr_add_L[2]~output_o\ : std_logic;
SIGNAL \curr_add_L[3]~output_o\ : std_logic;
SIGNAL \curr_add_L[4]~output_o\ : std_logic;
SIGNAL \curr_add_L[5]~output_o\ : std_logic;
SIGNAL \curr_add_L[6]~output_o\ : std_logic;
SIGNAL \curr_aLU_S[0]~output_o\ : std_logic;
SIGNAL \curr_aLU_S[1]~output_o\ : std_logic;
SIGNAL \curr_aLU_S[2]~output_o\ : std_logic;
SIGNAL \curr_aLU_S[3]~output_o\ : std_logic;
SIGNAL \curr_aLU_S[4]~output_o\ : std_logic;
SIGNAL \curr_aLU_S[5]~output_o\ : std_logic;
SIGNAL \curr_aLU_S[6]~output_o\ : std_logic;
SIGNAL \IR[0]~input_o\ : std_logic;
SIGNAL \mseq|microcode|Mux2~0_combout\ : std_logic;
SIGNAL \mseq|Mux4~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux8~3_combout\ : std_logic;
SIGNAL \mseq|Mux4~2_combout\ : std_logic;
SIGNAL \mseq|Mux4~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux12~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux12~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux0~1_combout\ : std_logic;
SIGNAL \mseq|Add0~1_combout\ : std_logic;
SIGNAL \mseq|Mux1~0_combout\ : std_logic;
SIGNAL \mseq|Mux1~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux9~0_combout\ : std_logic;
SIGNAL \mseq|Mux5~0_combout\ : std_logic;
SIGNAL \mseq|Mux5~1_combout\ : std_logic;
SIGNAL \mseq|Mux5~2_combout\ : std_logic;
SIGNAL \mseq|Mux5~3_combout\ : std_logic;
SIGNAL \mseq|Add0~3_combout\ : std_logic;
SIGNAL \mseq|Mux2~2_combout\ : std_logic;
SIGNAL \mseq|Mux2~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux2~2_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux3~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux3~1_combout\ : std_logic;
SIGNAL \mseq|Mux7~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux0~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux0~2_combout\ : std_logic;
SIGNAL \mseq|Mux7~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux1~0_combout\ : std_logic;
SIGNAL \mseq|Add0~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux1~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux1~2_combout\ : std_logic;
SIGNAL \mseq|Add0~4_combout\ : std_logic;
SIGNAL \mseq|Mux0~0_combout\ : std_logic;
SIGNAL \mseq|Mux0~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux8~2_combout\ : std_logic;
SIGNAL \z~input_o\ : std_logic;
SIGNAL \mseq|Mux6~0_combout\ : std_logic;
SIGNAL \mseq|Mux6~1_combout\ : std_logic;
SIGNAL \mseq|Add0~2_combout\ : std_logic;
SIGNAL \mseq|Mux3~0_combout\ : std_logic;
SIGNAL \mseq|Mux3~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux7~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux7~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux7~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux7~2_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux7~4_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux4~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux2~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux4~2_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux5~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux5~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux5~2_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux5~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux6~5_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux6~6_combout\ : std_logic;
SIGNAL \m1_ops|Mux14~24_combout\ : std_logic;
SIGNAL \ARLOAD~4_combout\ : std_logic;
SIGNAL \ARLOAD~9_combout\ : std_logic;
SIGNAL \m1_ops|Mux14~4_combout\ : std_logic;
SIGNAL \m1_ops|Mux14~25_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux11~4_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux11~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux11~7_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~8_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~55_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux8~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux9~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux9~2_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux9~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux9~4_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux10~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux10~2_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux10~0_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux10~3_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux8~1_combout\ : std_logic;
SIGNAL \mseq|microcode|Mux8~4_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~53_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~20_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~56_combout\ : std_logic;
SIGNAL \m1_ops|Mux14~12_combout\ : std_logic;
SIGNAL \m1_ops|Mux14~26_combout\ : std_logic;
SIGNAL \DRLBUS~3_combout\ : std_logic;
SIGNAL \DRLBUS~12_combout\ : std_logic;
SIGNAL \DRHBUS~0_combout\ : std_logic;
SIGNAL \DRLOAD~0_combout\ : std_logic;
SIGNAL \m1_ops|Mux14~21_combout\ : std_logic;
SIGNAL \m1_ops|Mux14~27_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~32_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~57_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~44_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~58_combout\ : std_logic;
SIGNAL \RBUS~4_combout\ : std_logic;
SIGNAL \RBUS~9_combout\ : std_logic;
SIGNAL \ACLOAD~0_combout\ : std_logic;
SIGNAL \ACBUS~0_combout\ : std_logic;
SIGNAL \m2_ops|Mux6~54_combout\ : std_logic;
SIGNAL \HDigit|Mux3~0_combout\ : std_logic;
SIGNAL \HDigit|Mux2~0_combout\ : std_logic;
SIGNAL \LDigit|Mux6~0_combout\ : std_logic;
SIGNAL \LDigit|Mux5~0_combout\ : std_logic;
SIGNAL \LDigit|Mux4~0_combout\ : std_logic;
SIGNAL \LDigit|Mux3~0_combout\ : std_logic;
SIGNAL \LDigit|Mux2~0_combout\ : std_logic;
SIGNAL \LDigit|Mux1~0_combout\ : std_logic;
SIGNAL \LDigit|Mux0~0_combout\ : std_logic;
SIGNAL \ALUSEL|Mux6~3_combout\ : std_logic;
SIGNAL \ALUSEL|Mux6~4_combout\ : std_logic;
SIGNAL \ALUSEL|Mux6~7_combout\ : std_logic;
SIGNAL \ALUSEL|Mux5~3_combout\ : std_logic;
SIGNAL \ALUSEL|Mux5~6_combout\ : std_logic;
SIGNAL \ALUSEL|Mux4~4_combout\ : std_logic;
SIGNAL \ALUSEL|Mux4~3_combout\ : std_logic;
SIGNAL \ALUSEL|Mux4~7_combout\ : std_logic;
SIGNAL \ALUSEL|Mux3~7_combout\ : std_logic;
SIGNAL \ALUSEL|Mux3~8_combout\ : std_logic;
SIGNAL \ALUSEL|Mux2~3_combout\ : std_logic;
SIGNAL \ALUSEL|Mux2~12_combout\ : std_logic;
SIGNAL \ALUSEL|Mux1~3_combout\ : std_logic;
SIGNAL \ALUSEL|Mux1~9_combout\ : std_logic;
SIGNAL \ALUSEL|Mux0~3_combout\ : std_logic;
SIGNAL \ALUSEL|Mux0~6_combout\ : std_logic;
SIGNAL \mseq|return_add\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \mseq|current_addr\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \LDigit|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \HDigit|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \HDigit|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \mseq|microcode|ALT_INV_Mux8~2_combout\ : std_logic;
SIGNAL \mseq|ALT_INV_current_addr\ : std_logic_vector(5 DOWNTO 5);
SIGNAL \ALUSEL|ALT_INV_Mux6~7_combout\ : std_logic;

BEGIN

ww_z <= z;
ww_clk <= clk;
ww_IR <= IR;
error <= ww_error;
ARLOAD <= ww_ARLOAD;
ARINC <= ww_ARINC;
R <= ww_R;
W <= ww_W;
MEMBUS <= ww_MEMBUS;
BUSMEM <= ww_BUSMEM;
PCINC <= ww_PCINC;
PCLOAD <= ww_PCLOAD;
PCBUS <= ww_PCBUS;
DRLBUS <= ww_DRLBUS;
DRHBUS <= ww_DRHBUS;
DRLOAD <= ww_DRLOAD;
TRLOAD <= ww_TRLOAD;
TRBUS <= ww_TRBUS;
IRLOAD <= ww_IRLOAD;
RLOAD <= ww_RLOAD;
RBUS <= ww_RBUS;
ACLOAD <= ww_ACLOAD;
ACBUS <= ww_ACBUS;
ZLOAD <= ww_ZLOAD;
curr_add_H <= ww_curr_add_H;
curr_add_L <= ww_curr_add_L;
curr_aLU_S <= ww_curr_aLU_S;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rtl~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~0_combout\);
\LDigit|ALT_INV_Mux6~0_combout\ <= NOT \LDigit|Mux6~0_combout\;
\HDigit|ALT_INV_Mux2~0_combout\ <= NOT \HDigit|Mux2~0_combout\;
\HDigit|ALT_INV_Mux3~0_combout\ <= NOT \HDigit|Mux3~0_combout\;
\mseq|microcode|ALT_INV_Mux8~2_combout\ <= NOT \mseq|microcode|Mux8~2_combout\;
\mseq|ALT_INV_current_addr\(5) <= NOT \mseq|current_addr\(5);
\ALUSEL|ALT_INV_Mux6~7_combout\ <= NOT \ALUSEL|Mux6~7_combout\;

-- Location: LCCOMB_X67_Y16_N22
\mseq|microcode|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux4~0_combout\ = (\mseq|current_addr\(0) & ((\mseq|current_addr\(3) & ((\mseq|current_addr\(2)))) # (!\mseq|current_addr\(3) & (\mseq|current_addr\(4) & !\mseq|current_addr\(2))))) # (!\mseq|current_addr\(0) & ((\mseq|current_addr\(4)) # 
-- (\mseq|current_addr\(3) $ (\mseq|current_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001100111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(4),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux4~0_combout\);

-- Location: LCCOMB_X72_Y16_N4
\mseq|microcode|Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux6~2_combout\ = (!\mseq|current_addr\(5) & ((\mseq|current_addr\(3)) # ((!\mseq|current_addr\(4) & \mseq|current_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(5),
	combout => \mseq|microcode|Mux6~2_combout\);

-- Location: LCCOMB_X72_Y16_N26
\mseq|microcode|Mux6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux6~3_combout\ = (!\mseq|current_addr\(3) & (\mseq|current_addr\(4) & ((\mseq|current_addr\(5)) # (!\mseq|current_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(5),
	combout => \mseq|microcode|Mux6~3_combout\);

-- Location: LCCOMB_X72_Y16_N24
\mseq|microcode|Mux6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux6~4_combout\ = (!\mseq|current_addr\(1) & ((\mseq|current_addr\(0) & (!\mseq|microcode|Mux6~3_combout\)) # (!\mseq|current_addr\(0) & ((\mseq|microcode|Mux6~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux6~3_combout\,
	datab => \mseq|microcode|Mux6~2_combout\,
	datac => \mseq|current_addr\(1),
	datad => \mseq|current_addr\(0),
	combout => \mseq|microcode|Mux6~4_combout\);

-- Location: LCCOMB_X67_Y16_N0
\mseq|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux4~0_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(3) $ (((\mseq|current_addr\(2)))))) # (!\mseq|current_addr\(0) & ((\mseq|current_addr\(4)) # (\mseq|current_addr\(3) $ (\mseq|current_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(4),
	datad => \mseq|current_addr\(2),
	combout => \mseq|Mux4~0_combout\);

-- Location: LCCOMB_X67_Y16_N16
\mseq|microcode|Mux14~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux14~6_combout\ = (\mseq|current_addr\(5) & ((\mseq|current_addr\(1)) # ((!\mseq|current_addr\(0))))) # (!\mseq|current_addr\(5) & (((\mseq|microcode|Mux14~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(5),
	datad => \mseq|microcode|Mux14~7_combout\,
	combout => \mseq|microcode|Mux14~6_combout\);

-- Location: LCCOMB_X68_Y16_N12
\rtl~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~0_combout\ = LCELL((!\mseq|microcode|Mux0~2_combout\ & (!\mseq|current_addr\(5) & (!\mseq|current_addr\(4) & \mseq|microcode|Mux1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux0~2_combout\,
	datab => \mseq|current_addr\(5),
	datac => \mseq|current_addr\(4),
	datad => \mseq|microcode|Mux1~2_combout\,
	combout => \rtl~0_combout\);

-- Location: LCCOMB_X67_Y16_N18
\mseq|microcode|Mux14~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux14~4_combout\ = (\mseq|current_addr\(3) & (\mseq|current_addr\(0) $ (((\mseq|current_addr\(1)))))) # (!\mseq|current_addr\(3) & (\mseq|current_addr\(4) & ((\mseq|current_addr\(1)) # (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(4),
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux14~4_combout\);

-- Location: LCCOMB_X67_Y16_N8
\mseq|microcode|Mux14~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux14~5_combout\ = (\mseq|current_addr\(3) & ((\mseq|current_addr\(0) & ((\mseq|current_addr\(4)) # (\mseq|current_addr\(1)))) # (!\mseq|current_addr\(0) & (\mseq|current_addr\(4) $ (!\mseq|current_addr\(1)))))) # (!\mseq|current_addr\(3) 
-- & (((!\mseq|current_addr\(1))) # (!\mseq|current_addr\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(4),
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux14~5_combout\);

-- Location: LCCOMB_X67_Y16_N10
\mseq|microcode|Mux14~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux14~7_combout\ = (\mseq|current_addr\(2) & (\mseq|microcode|Mux14~5_combout\)) # (!\mseq|current_addr\(2) & ((\mseq|microcode|Mux14~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(2),
	datac => \mseq|microcode|Mux14~5_combout\,
	datad => \mseq|microcode|Mux14~4_combout\,
	combout => \mseq|microcode|Mux14~7_combout\);

-- Location: LCCOMB_X67_Y16_N28
\mseq|Mux2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux2~4_combout\ = (\mseq|current_addr\(3) & (\mseq|current_addr\(1) $ (((!\mseq|current_addr\(2)) # (!\mseq|current_addr\(0)))))) # (!\mseq|current_addr\(3) & (\mseq|current_addr\(0) & (\mseq|current_addr\(2) & !\mseq|current_addr\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(1),
	combout => \mseq|Mux2~4_combout\);

-- Location: LCCOMB_X67_Y16_N26
\mseq|Mux2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux2~5_combout\ = (!\mseq|current_addr\(5) & (\mseq|Mux2~4_combout\ & ((!\mseq|current_addr\(4)) # (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(5),
	datad => \mseq|Mux2~4_combout\,
	combout => \mseq|Mux2~5_combout\);

-- Location: IOIBUF_X115_Y40_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\IR[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(2),
	o => \IR[2]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\IR[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(1),
	o => \IR[1]~input_o\);

-- Location: IOIBUF_X115_Y13_N8
\IR[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(3),
	o => \IR[3]~input_o\);

-- Location: CLKCTRL_G18
\rtl~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~0clkctrl_outclk\);

-- Location: IOOBUF_X107_Y73_N9
\error~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1_ops|Mux14~24_combout\,
	devoe => ww_devoe,
	o => \error~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\ARLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ARLOAD~9_combout\,
	devoe => ww_devoe,
	o => \ARLOAD~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\ARINC~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1_ops|Mux14~25_combout\,
	devoe => ww_devoe,
	o => \ARINC~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\R~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mseq|microcode|Mux11~7_combout\,
	devoe => ww_devoe,
	o => \R~output_o\);

-- Location: IOOBUF_X87_Y73_N23
\W~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m2_ops|Mux6~55_combout\,
	devoe => ww_devoe,
	o => \W~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\MEMBUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mseq|microcode|Mux11~7_combout\,
	devoe => ww_devoe,
	o => \MEMBUS~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\BUSMEM~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m2_ops|Mux6~55_combout\,
	devoe => ww_devoe,
	o => \BUSMEM~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\PCINC~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m2_ops|Mux6~53_combout\,
	devoe => ww_devoe,
	o => \PCINC~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\PCLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m2_ops|Mux6~56_combout\,
	devoe => ww_devoe,
	o => \PCLOAD~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\PCBUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1_ops|Mux14~26_combout\,
	devoe => ww_devoe,
	o => \PCBUS~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\DRLBUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DRLBUS~12_combout\,
	devoe => ww_devoe,
	o => \DRLBUS~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\DRHBUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DRHBUS~0_combout\,
	devoe => ww_devoe,
	o => \DRHBUS~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\DRLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DRLOAD~0_combout\,
	devoe => ww_devoe,
	o => \DRLOAD~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\TRLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1_ops|Mux14~27_combout\,
	devoe => ww_devoe,
	o => \TRLOAD~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\TRBUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DRHBUS~0_combout\,
	devoe => ww_devoe,
	o => \TRBUS~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\IRLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m2_ops|Mux6~57_combout\,
	devoe => ww_devoe,
	o => \IRLOAD~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\RLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m2_ops|Mux6~58_combout\,
	devoe => ww_devoe,
	o => \RLOAD~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\RBUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RBUS~9_combout\,
	devoe => ww_devoe,
	o => \RBUS~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\ACLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ACLOAD~0_combout\,
	devoe => ww_devoe,
	o => \ACLOAD~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\ACBUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ACBUS~0_combout\,
	devoe => ww_devoe,
	o => \ACBUS~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\ZLOAD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m2_ops|Mux6~54_combout\,
	devoe => ww_devoe,
	o => \ZLOAD~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\curr_add_H[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mseq|ALT_INV_current_addr\(5),
	devoe => ww_devoe,
	o => \curr_add_H[0]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\curr_add_H[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mseq|microcode|ALT_INV_Mux8~2_combout\,
	devoe => ww_devoe,
	o => \curr_add_H[1]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\curr_add_H[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mseq|current_addr\(4),
	devoe => ww_devoe,
	o => \curr_add_H[2]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\curr_add_H[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HDigit|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_H[3]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\curr_add_H[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HDigit|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_H[4]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\curr_add_H[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \curr_add_H[5]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\curr_add_H[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HDigit|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_H[6]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\curr_add_L[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDigit|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_L[0]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\curr_add_L[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDigit|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_L[1]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\curr_add_L[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDigit|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_L[2]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\curr_add_L[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDigit|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_L[3]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\curr_add_L[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDigit|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_L[4]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\curr_add_L[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDigit|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_L[5]~output_o\);

-- Location: IOOBUF_X74_Y0_N16
\curr_add_L[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDigit|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \curr_add_L[6]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\curr_aLU_S[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSEL|ALT_INV_Mux6~7_combout\,
	devoe => ww_devoe,
	o => \curr_aLU_S[0]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\curr_aLU_S[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSEL|Mux5~6_combout\,
	devoe => ww_devoe,
	o => \curr_aLU_S[1]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\curr_aLU_S[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSEL|Mux4~7_combout\,
	devoe => ww_devoe,
	o => \curr_aLU_S[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\curr_aLU_S[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSEL|Mux3~8_combout\,
	devoe => ww_devoe,
	o => \curr_aLU_S[3]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\curr_aLU_S[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSEL|Mux2~12_combout\,
	devoe => ww_devoe,
	o => \curr_aLU_S[4]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\curr_aLU_S[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSEL|Mux1~9_combout\,
	devoe => ww_devoe,
	o => \curr_aLU_S[5]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\curr_aLU_S[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSEL|Mux0~6_combout\,
	devoe => ww_devoe,
	o => \curr_aLU_S[6]~output_o\);

-- Location: IOIBUF_X115_Y17_N1
\IR[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(0),
	o => \IR[0]~input_o\);

-- Location: FF_X68_Y16_N11
\mseq|return_add[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rtl~0clkctrl_outclk\,
	asdata => \mseq|current_addr\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|return_add\(0));

-- Location: LCCOMB_X68_Y16_N24
\mseq|microcode|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux2~0_combout\ = (\mseq|current_addr\(0) & !\mseq|current_addr\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux2~0_combout\);

-- Location: LCCOMB_X68_Y16_N4
\mseq|Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux4~1_combout\ = \mseq|current_addr\(0) $ (((\mseq|current_addr\(1) & ((!\mseq|Mux6~1_combout\) # (!\mseq|Mux4~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|Mux4~0_combout\,
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(1),
	datad => \mseq|Mux6~1_combout\,
	combout => \mseq|Mux4~1_combout\);

-- Location: LCCOMB_X67_Y16_N6
\mseq|microcode|Mux8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux8~3_combout\ = \mseq|current_addr\(1) $ (!\mseq|current_addr\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(1),
	datac => \mseq|current_addr\(0),
	combout => \mseq|microcode|Mux8~3_combout\);

-- Location: FF_X68_Y16_N19
\mseq|return_add[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rtl~0clkctrl_outclk\,
	asdata => \mseq|microcode|Mux8~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|return_add\(1));

-- Location: LCCOMB_X68_Y16_N18
\mseq|Mux4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux4~2_combout\ = (\mseq|Mux7~1_combout\ & (((\mseq|return_add\(1) & !\mseq|Mux6~1_combout\)))) # (!\mseq|Mux7~1_combout\ & (\mseq|current_addr\(5) & ((\mseq|Mux6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|Mux7~1_combout\,
	datab => \mseq|current_addr\(5),
	datac => \mseq|return_add\(1),
	datad => \mseq|Mux6~1_combout\,
	combout => \mseq|Mux4~2_combout\);

-- Location: LCCOMB_X68_Y16_N16
\mseq|Mux4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux4~3_combout\ = (\mseq|Mux7~1_combout\ & (((\mseq|Mux4~2_combout\)))) # (!\mseq|Mux7~1_combout\ & ((\mseq|Mux4~2_combout\ & (!\mseq|microcode|Mux2~0_combout\)) # (!\mseq|Mux4~2_combout\ & ((!\mseq|Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|Mux7~1_combout\,
	datab => \mseq|microcode|Mux2~0_combout\,
	datac => \mseq|Mux4~1_combout\,
	datad => \mseq|Mux4~2_combout\,
	combout => \mseq|Mux4~3_combout\);

-- Location: FF_X68_Y16_N17
\mseq|current_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mseq|Mux4~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|current_addr\(1));

-- Location: LCCOMB_X70_Y16_N20
\mseq|microcode|Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux12~0_combout\ = (\mseq|current_addr\(4) & (!\mseq|current_addr\(1) & ((\mseq|current_addr\(2)) # (\mseq|current_addr\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(4),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux12~0_combout\);

-- Location: LCCOMB_X70_Y16_N16
\mseq|microcode|Mux12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux12~1_combout\ = (!\mseq|current_addr\(5) & \mseq|microcode|Mux12~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mseq|current_addr\(5),
	datad => \mseq|microcode|Mux12~0_combout\,
	combout => \mseq|microcode|Mux12~1_combout\);

-- Location: LCCOMB_X70_Y16_N24
\mseq|microcode|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux0~1_combout\ = (!\mseq|current_addr\(0) & (\mseq|current_addr\(2) & \mseq|current_addr\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux0~1_combout\);

-- Location: LCCOMB_X70_Y16_N12
\mseq|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Add0~1_combout\ = \mseq|current_addr\(4) $ (((\mseq|current_addr\(3) & \mseq|microcode|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(4),
	datad => \mseq|microcode|Mux0~1_combout\,
	combout => \mseq|Add0~1_combout\);

-- Location: FF_X69_Y16_N21
\mseq|return_add[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rtl~0clkctrl_outclk\,
	asdata => \mseq|Add0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|return_add\(4));

-- Location: LCCOMB_X69_Y16_N20
\mseq|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux1~0_combout\ = (\mseq|Mux7~1_combout\ & (((\mseq|return_add\(4)) # (\mseq|Mux6~1_combout\)))) # (!\mseq|Mux7~1_combout\ & (\mseq|Add0~1_combout\ & ((!\mseq|Mux6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|Add0~1_combout\,
	datab => \mseq|Mux7~1_combout\,
	datac => \mseq|return_add\(4),
	datad => \mseq|Mux6~1_combout\,
	combout => \mseq|Mux1~0_combout\);

-- Location: LCCOMB_X69_Y16_N10
\mseq|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux1~1_combout\ = (\mseq|Mux6~1_combout\ & ((\mseq|Mux1~0_combout\ & (\IR[2]~input_o\)) # (!\mseq|Mux1~0_combout\ & ((\mseq|microcode|Mux12~1_combout\))))) # (!\mseq|Mux6~1_combout\ & (((\mseq|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR[2]~input_o\,
	datab => \mseq|microcode|Mux12~1_combout\,
	datac => \mseq|Mux6~1_combout\,
	datad => \mseq|Mux1~0_combout\,
	combout => \mseq|Mux1~1_combout\);

-- Location: FF_X69_Y16_N11
\mseq|current_addr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mseq|Mux1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|current_addr\(4));

-- Location: LCCOMB_X68_Y16_N10
\mseq|microcode|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux9~0_combout\ = (!\mseq|current_addr\(3) & \mseq|current_addr\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(4),
	combout => \mseq|microcode|Mux9~0_combout\);

-- Location: LCCOMB_X68_Y16_N8
\mseq|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux5~0_combout\ = (\mseq|current_addr\(5)) # ((\mseq|current_addr\(1)) # ((!\mseq|current_addr\(2) & \mseq|microcode|Mux9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datab => \mseq|current_addr\(5),
	datac => \mseq|current_addr\(1),
	datad => \mseq|microcode|Mux9~0_combout\,
	combout => \mseq|Mux5~0_combout\);

-- Location: LCCOMB_X68_Y16_N2
\mseq|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux5~1_combout\ = (\mseq|Mux5~0_combout\) # ((\mseq|current_addr\(0) & ((!\mseq|current_addr\(4)) # (!\mseq|current_addr\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|Mux5~0_combout\,
	datad => \mseq|current_addr\(0),
	combout => \mseq|Mux5~1_combout\);

-- Location: LCCOMB_X68_Y16_N26
\mseq|Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux5~2_combout\ = (\mseq|Mux6~1_combout\ & ((\mseq|Mux5~1_combout\))) # (!\mseq|Mux6~1_combout\ & (\mseq|current_addr\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|Mux5~1_combout\,
	datad => \mseq|Mux6~1_combout\,
	combout => \mseq|Mux5~2_combout\);

-- Location: LCCOMB_X68_Y16_N30
\mseq|Mux5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux5~3_combout\ = (\mseq|Mux7~1_combout\ & ((\mseq|Mux6~1_combout\) # ((!\mseq|return_add\(0))))) # (!\mseq|Mux7~1_combout\ & (((!\mseq|Mux5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|Mux7~1_combout\,
	datab => \mseq|Mux6~1_combout\,
	datac => \mseq|return_add\(0),
	datad => \mseq|Mux5~2_combout\,
	combout => \mseq|Mux5~3_combout\);

-- Location: FF_X68_Y16_N31
\mseq|current_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mseq|Mux5~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|current_addr\(0));

-- Location: LCCOMB_X67_Y16_N14
\mseq|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Add0~3_combout\ = \mseq|current_addr\(3) $ (((\mseq|current_addr\(1) & (\mseq|current_addr\(2) & !\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(0),
	combout => \mseq|Add0~3_combout\);

-- Location: FF_X68_Y16_N27
\mseq|return_add[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rtl~0clkctrl_outclk\,
	asdata => \mseq|Add0~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|return_add\(3));

-- Location: LCCOMB_X68_Y16_N20
\mseq|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux2~2_combout\ = (\mseq|Mux7~1_combout\ & (((\mseq|Mux6~1_combout\)))) # (!\mseq|Mux7~1_combout\ & ((\mseq|Mux6~1_combout\ & (\mseq|Mux2~5_combout\)) # (!\mseq|Mux6~1_combout\ & ((\mseq|Add0~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|Mux2~5_combout\,
	datab => \mseq|Add0~3_combout\,
	datac => \mseq|Mux7~1_combout\,
	datad => \mseq|Mux6~1_combout\,
	combout => \mseq|Mux2~2_combout\);

-- Location: LCCOMB_X68_Y16_N6
\mseq|Mux2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux2~3_combout\ = (\mseq|Mux7~1_combout\ & ((\mseq|Mux2~2_combout\ & (\IR[1]~input_o\)) # (!\mseq|Mux2~2_combout\ & ((\mseq|return_add\(3)))))) # (!\mseq|Mux7~1_combout\ & (((\mseq|Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR[1]~input_o\,
	datab => \mseq|Mux7~1_combout\,
	datac => \mseq|return_add\(3),
	datad => \mseq|Mux2~2_combout\,
	combout => \mseq|Mux2~3_combout\);

-- Location: FF_X68_Y16_N7
\mseq|current_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mseq|Mux2~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|current_addr\(3));

-- Location: LCCOMB_X69_Y16_N4
\mseq|microcode|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux2~2_combout\ = (\mseq|current_addr\(4) & (\mseq|current_addr\(3) & (!\mseq|current_addr\(5) & \mseq|microcode|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(4),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(5),
	datad => \mseq|microcode|Mux2~0_combout\,
	combout => \mseq|microcode|Mux2~2_combout\);

-- Location: LCCOMB_X69_Y16_N28
\mseq|microcode|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux3~0_combout\ = (\mseq|current_addr\(5) & (((!\mseq|current_addr\(0))))) # (!\mseq|current_addr\(5) & ((\mseq|current_addr\(2) & (!\mseq|current_addr\(0) & !\mseq|current_addr\(3))) # (!\mseq|current_addr\(2) & 
-- ((\mseq|current_addr\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(5),
	combout => \mseq|microcode|Mux3~0_combout\);

-- Location: LCCOMB_X69_Y16_N0
\mseq|microcode|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux3~1_combout\ = (\mseq|current_addr\(4) & (((\mseq|current_addr\(1)) # (!\mseq|microcode|Mux3~0_combout\)) # (!\mseq|current_addr\(0)))) # (!\mseq|current_addr\(4) & ((\mseq|current_addr\(0)) # ((\mseq|microcode|Mux3~0_combout\) # 
-- (!\mseq|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(4),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(1),
	datad => \mseq|microcode|Mux3~0_combout\,
	combout => \mseq|microcode|Mux3~1_combout\);

-- Location: LCCOMB_X69_Y16_N30
\mseq|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux7~0_combout\ = (!\mseq|microcode|Mux2~2_combout\ & !\mseq|microcode|Mux3~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mseq|microcode|Mux2~2_combout\,
	datad => \mseq|microcode|Mux3~1_combout\,
	combout => \mseq|Mux7~0_combout\);

-- Location: LCCOMB_X69_Y16_N14
\mseq|microcode|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux0~0_combout\ = (!\mseq|current_addr\(0) & (\mseq|current_addr\(1) & !\mseq|current_addr\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(1),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux0~0_combout\);

-- Location: LCCOMB_X69_Y16_N24
\mseq|microcode|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux0~2_combout\ = (\mseq|current_addr\(3) & ((\mseq|microcode|Mux0~1_combout\))) # (!\mseq|current_addr\(3) & (\mseq|microcode|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(3),
	datac => \mseq|microcode|Mux0~0_combout\,
	datad => \mseq|microcode|Mux0~1_combout\,
	combout => \mseq|microcode|Mux0~2_combout\);

-- Location: LCCOMB_X69_Y16_N2
\mseq|Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux7~1_combout\ = (\mseq|microcode|Mux8~2_combout\ & ((\mseq|microcode|Mux0~2_combout\) # ((!\mseq|microcode|Mux1~2_combout\ & \mseq|Mux7~0_combout\)))) # (!\mseq|microcode|Mux8~2_combout\ & (((\mseq|Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux1~2_combout\,
	datab => \mseq|microcode|Mux8~2_combout\,
	datac => \mseq|Mux7~0_combout\,
	datad => \mseq|microcode|Mux0~2_combout\,
	combout => \mseq|Mux7~1_combout\);

-- Location: LCCOMB_X68_Y16_N22
\mseq|microcode|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux1~0_combout\ = (\mseq|current_addr\(1)) # ((!\mseq|current_addr\(2)) # (!\mseq|current_addr\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(1),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux1~0_combout\);

-- Location: LCCOMB_X68_Y16_N14
\mseq|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Add0~0_combout\ = (!\mseq|current_addr\(0) & \mseq|current_addr\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \mseq|Add0~0_combout\);

-- Location: LCCOMB_X68_Y16_N28
\mseq|microcode|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux1~1_combout\ = (\mseq|current_addr\(2) & (!\mseq|Add0~0_combout\)) # (!\mseq|current_addr\(2) & ((!\mseq|microcode|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datac => \mseq|Add0~0_combout\,
	datad => \mseq|microcode|Mux2~0_combout\,
	combout => \mseq|microcode|Mux1~1_combout\);

-- Location: LCCOMB_X68_Y16_N0
\mseq|microcode|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux1~2_combout\ = (\mseq|current_addr\(3) & ((!\mseq|microcode|Mux1~1_combout\))) # (!\mseq|current_addr\(3) & (!\mseq|microcode|Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datac => \mseq|microcode|Mux1~0_combout\,
	datad => \mseq|microcode|Mux1~1_combout\,
	combout => \mseq|microcode|Mux1~2_combout\);

-- Location: LCCOMB_X69_Y16_N22
\mseq|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Add0~4_combout\ = \mseq|current_addr\(5) $ (((\mseq|current_addr\(4) & (\mseq|current_addr\(3) & \mseq|microcode|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(3),
	datad => \mseq|microcode|Mux0~1_combout\,
	combout => \mseq|Add0~4_combout\);

-- Location: FF_X69_Y16_N13
\mseq|return_add[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rtl~0clkctrl_outclk\,
	asdata => \mseq|Add0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|return_add\(5));

-- Location: LCCOMB_X69_Y16_N12
\mseq|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux0~0_combout\ = (\mseq|microcode|Mux0~2_combout\ & (\mseq|microcode|Mux1~2_combout\ & (\mseq|return_add\(5) & \mseq|microcode|Mux8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux0~2_combout\,
	datab => \mseq|microcode|Mux1~2_combout\,
	datac => \mseq|return_add\(5),
	datad => \mseq|microcode|Mux8~2_combout\,
	combout => \mseq|Mux0~0_combout\);

-- Location: LCCOMB_X69_Y16_N16
\mseq|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux0~1_combout\ = (\mseq|Mux0~0_combout\) # ((\IR[3]~input_o\ & (\mseq|Mux6~1_combout\ & \mseq|Mux7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR[3]~input_o\,
	datab => \mseq|Mux6~1_combout\,
	datac => \mseq|Mux7~1_combout\,
	datad => \mseq|Mux0~0_combout\,
	combout => \mseq|Mux0~1_combout\);

-- Location: FF_X69_Y16_N17
\mseq|current_addr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mseq|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|current_addr\(5));

-- Location: LCCOMB_X70_Y16_N10
\mseq|microcode|Mux8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux8~2_combout\ = (!\mseq|current_addr\(5) & !\mseq|current_addr\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(4),
	combout => \mseq|microcode|Mux8~2_combout\);

-- Location: IOIBUF_X115_Y14_N8
\z~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z,
	o => \z~input_o\);

-- Location: LCCOMB_X69_Y16_N8
\mseq|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux6~0_combout\ = (\z~input_o\ $ (\mseq|microcode|Mux3~1_combout\)) # (!\mseq|microcode|Mux2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \z~input_o\,
	datac => \mseq|microcode|Mux2~2_combout\,
	datad => \mseq|microcode|Mux3~1_combout\,
	combout => \mseq|Mux6~0_combout\);

-- Location: LCCOMB_X69_Y16_N26
\mseq|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux6~1_combout\ = (\mseq|microcode|Mux8~2_combout\ & ((\mseq|microcode|Mux1~2_combout\ & ((!\mseq|microcode|Mux0~2_combout\))) # (!\mseq|microcode|Mux1~2_combout\ & ((\mseq|Mux6~0_combout\) # (\mseq|microcode|Mux0~2_combout\))))) # 
-- (!\mseq|microcode|Mux8~2_combout\ & (((\mseq|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux1~2_combout\,
	datab => \mseq|microcode|Mux8~2_combout\,
	datac => \mseq|Mux6~0_combout\,
	datad => \mseq|microcode|Mux0~2_combout\,
	combout => \mseq|Mux6~1_combout\);

-- Location: LCCOMB_X70_Y16_N14
\mseq|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Add0~2_combout\ = \mseq|current_addr\(2) $ (((!\mseq|current_addr\(0) & \mseq|current_addr\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(1),
	combout => \mseq|Add0~2_combout\);

-- Location: FF_X69_Y16_N19
\mseq|return_add[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rtl~0clkctrl_outclk\,
	asdata => \mseq|Add0~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|return_add\(2));

-- Location: LCCOMB_X69_Y16_N18
\mseq|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux3~0_combout\ = (\mseq|Mux6~1_combout\ & (((\mseq|Mux7~1_combout\)))) # (!\mseq|Mux6~1_combout\ & ((\mseq|Mux7~1_combout\ & ((\mseq|return_add\(2)))) # (!\mseq|Mux7~1_combout\ & (\mseq|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|Mux6~1_combout\,
	datab => \mseq|Add0~2_combout\,
	datac => \mseq|return_add\(2),
	datad => \mseq|Mux7~1_combout\,
	combout => \mseq|Mux3~0_combout\);

-- Location: LCCOMB_X69_Y16_N6
\mseq|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|Mux3~1_combout\ = (\mseq|Mux6~1_combout\ & ((\mseq|Mux3~0_combout\ & ((\IR[0]~input_o\))) # (!\mseq|Mux3~0_combout\ & (\mseq|microcode|Mux14~6_combout\)))) # (!\mseq|Mux6~1_combout\ & (((\mseq|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux14~6_combout\,
	datab => \IR[0]~input_o\,
	datac => \mseq|Mux6~1_combout\,
	datad => \mseq|Mux3~0_combout\,
	combout => \mseq|Mux3~1_combout\);

-- Location: FF_X69_Y16_N7
\mseq|current_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mseq|Mux3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mseq|current_addr\(2));

-- Location: LCCOMB_X72_Y20_N2
\mseq|microcode|Mux7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux7~3_combout\ = (\mseq|current_addr\(3) & ((\mseq|current_addr\(2) & ((\mseq|current_addr\(4)))) # (!\mseq|current_addr\(2) & (!\mseq|current_addr\(0))))) # (!\mseq|current_addr\(3) & ((\mseq|current_addr\(2) $ (\mseq|current_addr\(4))) 
-- # (!\mseq|current_addr\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011100011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(4),
	combout => \mseq|microcode|Mux7~3_combout\);

-- Location: LCCOMB_X72_Y20_N6
\mseq|microcode|Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux7~1_combout\ = (\mseq|current_addr\(4) & (!\mseq|current_addr\(3) & (\mseq|current_addr\(0) $ (!\mseq|current_addr\(2))))) # (!\mseq|current_addr\(4) & (!\mseq|current_addr\(0) & (\mseq|current_addr\(2) $ (!\mseq|current_addr\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(4),
	combout => \mseq|microcode|Mux7~1_combout\);

-- Location: LCCOMB_X72_Y20_N28
\mseq|microcode|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux7~0_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(2) $ (((\mseq|current_addr\(3)) # (\mseq|current_addr\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(4),
	combout => \mseq|microcode|Mux7~0_combout\);

-- Location: LCCOMB_X72_Y20_N12
\mseq|microcode|Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux7~2_combout\ = (!\mseq|current_addr\(1) & ((\mseq|current_addr\(5) & ((\mseq|microcode|Mux7~0_combout\))) # (!\mseq|current_addr\(5) & (!\mseq|microcode|Mux7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|microcode|Mux7~1_combout\,
	datac => \mseq|current_addr\(5),
	datad => \mseq|microcode|Mux7~0_combout\,
	combout => \mseq|microcode|Mux7~2_combout\);

-- Location: LCCOMB_X72_Y20_N14
\mseq|microcode|Mux7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux7~4_combout\ = (\mseq|microcode|Mux7~2_combout\) # ((\mseq|current_addr\(1) & (!\mseq|microcode|Mux7~3_combout\ & !\mseq|current_addr\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|microcode|Mux7~3_combout\,
	datac => \mseq|current_addr\(5),
	datad => \mseq|microcode|Mux7~2_combout\,
	combout => \mseq|microcode|Mux7~4_combout\);

-- Location: LCCOMB_X67_Y16_N4
\mseq|microcode|Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux4~1_combout\ = (\mseq|current_addr\(1) & (\mseq|microcode|Mux4~0_combout\)) # (!\mseq|current_addr\(1) & (((!\mseq|current_addr\(0) & \mseq|microcode|Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux4~0_combout\,
	datab => \mseq|current_addr\(0),
	datac => \mseq|microcode|Mux9~0_combout\,
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux4~1_combout\);

-- Location: LCCOMB_X70_Y16_N6
\mseq|microcode|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux2~1_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(3) & !\mseq|current_addr\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux2~1_combout\);

-- Location: LCCOMB_X70_Y16_N2
\mseq|microcode|Mux4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux4~2_combout\ = (\mseq|microcode|Mux4~1_combout\) # ((\mseq|current_addr\(5) & ((\mseq|current_addr\(4)) # (!\mseq|microcode|Mux2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(4),
	datab => \mseq|microcode|Mux4~1_combout\,
	datac => \mseq|current_addr\(5),
	datad => \mseq|microcode|Mux2~1_combout\,
	combout => \mseq|microcode|Mux4~2_combout\);

-- Location: LCCOMB_X67_Y16_N30
\mseq|microcode|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux5~1_combout\ = (\mseq|current_addr\(4) & (!\mseq|current_addr\(3) & ((!\mseq|current_addr\(2)) # (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(4),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux5~1_combout\);

-- Location: LCCOMB_X67_Y16_N12
\mseq|microcode|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux5~0_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(2) $ (((\mseq|current_addr\(4) & !\mseq|current_addr\(3)))))) # (!\mseq|current_addr\(0) & ((\mseq|current_addr\(4)) # (\mseq|current_addr\(3) $ (\mseq|current_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011101011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux5~0_combout\);

-- Location: LCCOMB_X67_Y16_N24
\mseq|microcode|Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux5~2_combout\ = (\mseq|current_addr\(1) & (((\mseq|microcode|Mux5~0_combout\)))) # (!\mseq|current_addr\(1) & (!\mseq|current_addr\(5) & (\mseq|microcode|Mux5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(5),
	datac => \mseq|microcode|Mux5~1_combout\,
	datad => \mseq|microcode|Mux5~0_combout\,
	combout => \mseq|microcode|Mux5~2_combout\);

-- Location: LCCOMB_X70_Y16_N4
\mseq|microcode|Mux5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux5~3_combout\ = (\mseq|microcode|Mux5~2_combout\) # ((\mseq|current_addr\(5) & ((\mseq|current_addr\(3)) # (!\mseq|microcode|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|microcode|Mux2~0_combout\,
	datac => \mseq|current_addr\(5),
	datad => \mseq|microcode|Mux5~2_combout\,
	combout => \mseq|microcode|Mux5~3_combout\);

-- Location: LCCOMB_X70_Y16_N8
\mseq|microcode|Mux6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux6~5_combout\ = (\mseq|current_addr\(5)) # (\mseq|current_addr\(2) $ (((!\mseq|current_addr\(3) & \mseq|current_addr\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(4),
	combout => \mseq|microcode|Mux6~5_combout\);

-- Location: LCCOMB_X70_Y20_N24
\mseq|microcode|Mux6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux6~6_combout\ = (\mseq|microcode|Mux6~4_combout\) # ((\mseq|current_addr\(1) & (!\mseq|microcode|Mux6~5_combout\ & \mseq|current_addr\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux6~4_combout\,
	datab => \mseq|current_addr\(1),
	datac => \mseq|microcode|Mux6~5_combout\,
	datad => \mseq|current_addr\(0),
	combout => \mseq|microcode|Mux6~6_combout\);

-- Location: LCCOMB_X73_Y20_N0
\m1_ops|Mux14~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \m1_ops|Mux14~24_combout\ = (!\mseq|microcode|Mux7~4_combout\ & (\mseq|microcode|Mux4~2_combout\ & (\mseq|microcode|Mux5~3_combout\ & !\mseq|microcode|Mux6~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux7~4_combout\,
	datab => \mseq|microcode|Mux4~2_combout\,
	datac => \mseq|microcode|Mux5~3_combout\,
	datad => \mseq|microcode|Mux6~6_combout\,
	combout => \m1_ops|Mux14~24_combout\);

-- Location: LCCOMB_X72_Y20_N16
\ARLOAD~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ARLOAD~4_combout\ = (\mseq|current_addr\(2) & (\mseq|current_addr\(1) & \mseq|current_addr\(3))) # (!\mseq|current_addr\(2) & ((!\mseq|current_addr\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(1),
	datad => \mseq|current_addr\(3),
	combout => \ARLOAD~4_combout\);

-- Location: LCCOMB_X72_Y20_N18
\ARLOAD~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ARLOAD~9_combout\ = (!\mseq|current_addr\(0) & (\ARLOAD~4_combout\ & (!\mseq|current_addr\(5) & !\mseq|current_addr\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \ARLOAD~4_combout\,
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(4),
	combout => \ARLOAD~9_combout\);

-- Location: LCCOMB_X67_Y18_N2
\m1_ops|Mux14~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \m1_ops|Mux14~4_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(4) & !\mseq|current_addr\(3))) # (!\mseq|current_addr\(0) & (!\mseq|current_addr\(4) & \mseq|current_addr\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(3),
	combout => \m1_ops|Mux14~4_combout\);

-- Location: LCCOMB_X67_Y18_N0
\m1_ops|Mux14~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \m1_ops|Mux14~25_combout\ = (!\mseq|current_addr\(5) & (\m1_ops|Mux14~4_combout\ & (\mseq|current_addr\(2) & !\mseq|current_addr\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \m1_ops|Mux14~4_combout\,
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(1),
	combout => \m1_ops|Mux14~25_combout\);

-- Location: LCCOMB_X69_Y20_N30
\mseq|microcode|Mux11~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux11~4_combout\ = (!\mseq|current_addr\(4) & (\mseq|current_addr\(2) & (\mseq|current_addr\(1) $ (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux11~4_combout\);

-- Location: LCCOMB_X69_Y20_N28
\mseq|microcode|Mux11~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux11~3_combout\ = (\mseq|current_addr\(1) & (!\mseq|current_addr\(4) & (\mseq|current_addr\(0) & !\mseq|current_addr\(2)))) # (!\mseq|current_addr\(1) & (\mseq|current_addr\(2) & ((\mseq|current_addr\(4)) # (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux11~3_combout\);

-- Location: LCCOMB_X69_Y20_N0
\mseq|microcode|Mux11~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux11~7_combout\ = (!\mseq|current_addr\(5) & ((\mseq|current_addr\(3) & (\mseq|microcode|Mux11~4_combout\)) # (!\mseq|current_addr\(3) & ((\mseq|microcode|Mux11~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux11~4_combout\,
	datab => \mseq|microcode|Mux11~3_combout\,
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(3),
	combout => \mseq|microcode|Mux11~7_combout\);

-- Location: LCCOMB_X72_Y20_N30
\m2_ops|Mux6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~8_combout\ = (\mseq|current_addr\(1) & (\mseq|current_addr\(0) & !\mseq|current_addr\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(2),
	combout => \m2_ops|Mux6~8_combout\);

-- Location: LCCOMB_X72_Y20_N8
\m2_ops|Mux6~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~55_combout\ = (\m2_ops|Mux6~8_combout\ & (\mseq|current_addr\(3) & (!\mseq|current_addr\(5) & !\mseq|current_addr\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m2_ops|Mux6~8_combout\,
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(4),
	combout => \m2_ops|Mux6~55_combout\);

-- Location: LCCOMB_X69_Y20_N4
\mseq|microcode|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux8~0_combout\ = (\mseq|current_addr\(3) & (!\mseq|current_addr\(4) & (!\mseq|current_addr\(5) & !\mseq|current_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux8~0_combout\);

-- Location: LCCOMB_X69_Y20_N18
\mseq|microcode|Mux9~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux9~3_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(5) & ((!\mseq|current_addr\(1))))) # (!\mseq|current_addr\(0) & (((\mseq|microcode|Mux8~0_combout\) # (\mseq|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(5),
	datac => \mseq|microcode|Mux8~0_combout\,
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux9~3_combout\);

-- Location: LCCOMB_X69_Y20_N12
\mseq|microcode|Mux9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux9~2_combout\ = (!\mseq|current_addr\(3) & (\mseq|current_addr\(4) & (!\mseq|current_addr\(5) & \mseq|current_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux9~2_combout\);

-- Location: LCCOMB_X69_Y20_N2
\mseq|microcode|Mux9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux9~1_combout\ = (!\mseq|current_addr\(3) & (!\mseq|current_addr\(4) & (!\mseq|current_addr\(5) & !\mseq|current_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux9~1_combout\);

-- Location: LCCOMB_X69_Y20_N22
\mseq|microcode|Mux9~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux9~4_combout\ = (\mseq|current_addr\(1) & ((\mseq|microcode|Mux9~3_combout\ & ((\mseq|microcode|Mux9~1_combout\))) # (!\mseq|microcode|Mux9~3_combout\ & (\mseq|microcode|Mux9~2_combout\)))) # (!\mseq|current_addr\(1) & 
-- (\mseq|microcode|Mux9~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|microcode|Mux9~3_combout\,
	datac => \mseq|microcode|Mux9~2_combout\,
	datad => \mseq|microcode|Mux9~1_combout\,
	combout => \mseq|microcode|Mux9~4_combout\);

-- Location: LCCOMB_X69_Y20_N26
\mseq|microcode|Mux10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux10~1_combout\ = (\mseq|current_addr\(3) & (!\mseq|current_addr\(5) & ((\mseq|current_addr\(4)) # (\mseq|current_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux10~1_combout\);

-- Location: LCCOMB_X69_Y20_N24
\mseq|microcode|Mux10~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux10~2_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(5) & ((!\mseq|current_addr\(1))))) # (!\mseq|current_addr\(0) & (((\mseq|microcode|Mux10~1_combout\) # (\mseq|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(5),
	datac => \mseq|microcode|Mux10~1_combout\,
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux10~2_combout\);

-- Location: LCCOMB_X69_Y20_N8
\mseq|microcode|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux10~0_combout\ = (\mseq|current_addr\(5)) # ((\mseq|current_addr\(3) & (\mseq|current_addr\(4) & \mseq|current_addr\(2))) # (!\mseq|current_addr\(3) & ((\mseq|current_addr\(4)) # (\mseq|current_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux10~0_combout\);

-- Location: LCCOMB_X69_Y20_N20
\mseq|microcode|Mux10~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux10~3_combout\ = (\mseq|current_addr\(1) & ((\mseq|microcode|Mux10~2_combout\ & ((\mseq|microcode|Mux9~1_combout\))) # (!\mseq|microcode|Mux10~2_combout\ & (!\mseq|microcode|Mux10~0_combout\)))) # (!\mseq|current_addr\(1) & 
-- (\mseq|microcode|Mux10~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111001000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|microcode|Mux10~2_combout\,
	datac => \mseq|microcode|Mux10~0_combout\,
	datad => \mseq|microcode|Mux9~1_combout\,
	combout => \mseq|microcode|Mux10~3_combout\);

-- Location: LCCOMB_X69_Y20_N14
\mseq|microcode|Mux8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux8~1_combout\ = (\mseq|current_addr\(5)) # ((\mseq|current_addr\(3) & (!\mseq|current_addr\(4) & \mseq|current_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(2),
	combout => \mseq|microcode|Mux8~1_combout\);

-- Location: LCCOMB_X69_Y20_N6
\mseq|microcode|Mux8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mseq|microcode|Mux8~4_combout\ = (\mseq|current_addr\(0) & ((\mseq|current_addr\(1) & ((\mseq|microcode|Mux8~0_combout\))) # (!\mseq|current_addr\(1) & (\mseq|microcode|Mux8~1_combout\)))) # (!\mseq|current_addr\(0) & (((\mseq|microcode|Mux8~0_combout\ & 
-- !\mseq|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|microcode|Mux8~1_combout\,
	datac => \mseq|microcode|Mux8~0_combout\,
	datad => \mseq|current_addr\(1),
	combout => \mseq|microcode|Mux8~4_combout\);

-- Location: LCCOMB_X68_Y20_N0
\m2_ops|Mux6~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~53_combout\ = (!\mseq|microcode|Mux9~4_combout\ & (\mseq|microcode|Mux10~3_combout\ & !\mseq|microcode|Mux8~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|microcode|Mux9~4_combout\,
	datac => \mseq|microcode|Mux10~3_combout\,
	datad => \mseq|microcode|Mux8~4_combout\,
	combout => \m2_ops|Mux6~53_combout\);

-- Location: LCCOMB_X72_Y20_N26
\m2_ops|Mux6~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~20_combout\ = (\mseq|current_addr\(1) & (\mseq|current_addr\(0) & !\mseq|current_addr\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(3),
	combout => \m2_ops|Mux6~20_combout\);

-- Location: LCCOMB_X72_Y20_N0
\m2_ops|Mux6~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~56_combout\ = (!\mseq|current_addr\(5) & (\mseq|current_addr\(2) & (\m2_ops|Mux6~20_combout\ & \mseq|current_addr\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(2),
	datac => \m2_ops|Mux6~20_combout\,
	datad => \mseq|current_addr\(4),
	combout => \m2_ops|Mux6~56_combout\);

-- Location: LCCOMB_X67_Y18_N22
\m1_ops|Mux14~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \m1_ops|Mux14~12_combout\ = (!\mseq|current_addr\(5) & !\mseq|current_addr\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(5),
	datac => \mseq|current_addr\(3),
	combout => \m1_ops|Mux14~12_combout\);

-- Location: LCCOMB_X67_Y18_N16
\m1_ops|Mux14~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \m1_ops|Mux14~26_combout\ = (!\mseq|current_addr\(0) & (!\mseq|current_addr\(4) & (\m1_ops|Mux14~12_combout\ & !\mseq|current_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(4),
	datac => \m1_ops|Mux14~12_combout\,
	datad => \mseq|current_addr\(2),
	combout => \m1_ops|Mux14~26_combout\);

-- Location: LCCOMB_X72_Y20_N10
\DRLBUS~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \DRLBUS~3_combout\ = (!\mseq|current_addr\(5) & (\mseq|current_addr\(2) $ (\mseq|current_addr\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(3),
	combout => \DRLBUS~3_combout\);

-- Location: LCCOMB_X72_Y20_N24
\DRLBUS~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \DRLBUS~12_combout\ = (\mseq|current_addr\(0) & (!\mseq|current_addr\(4) & (\mseq|current_addr\(1) & \DRLBUS~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(1),
	datad => \DRLBUS~3_combout\,
	combout => \DRLBUS~12_combout\);

-- Location: LCCOMB_X72_Y20_N4
\DRHBUS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DRHBUS~0_combout\ = (\m2_ops|Mux6~56_combout\) # ((\mseq|microcode|Mux7~4_combout\ & \ARLOAD~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|microcode|Mux7~4_combout\,
	datac => \ARLOAD~9_combout\,
	datad => \m2_ops|Mux6~56_combout\,
	combout => \DRHBUS~0_combout\);

-- Location: LCCOMB_X69_Y20_N16
\DRLOAD~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DRLOAD~0_combout\ = (\mseq|microcode|Mux11~7_combout\) # ((\mseq|microcode|Mux8~4_combout\ & (!\mseq|microcode|Mux10~3_combout\ & \mseq|microcode|Mux9~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|microcode|Mux8~4_combout\,
	datab => \mseq|microcode|Mux10~3_combout\,
	datac => \mseq|microcode|Mux9~4_combout\,
	datad => \mseq|microcode|Mux11~7_combout\,
	combout => \DRLOAD~0_combout\);

-- Location: LCCOMB_X72_Y20_N20
\m1_ops|Mux14~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \m1_ops|Mux14~21_combout\ = (\mseq|current_addr\(0) & (!\mseq|current_addr\(4) & (\mseq|current_addr\(1) & \mseq|current_addr\(3)))) # (!\mseq|current_addr\(0) & (\mseq|current_addr\(4) & (!\mseq|current_addr\(1) & !\mseq|current_addr\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(1),
	datad => \mseq|current_addr\(3),
	combout => \m1_ops|Mux14~21_combout\);

-- Location: LCCOMB_X72_Y20_N22
\m1_ops|Mux14~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \m1_ops|Mux14~27_combout\ = (\mseq|current_addr\(2) & (!\mseq|current_addr\(5) & \m1_ops|Mux14~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(5),
	datad => \m1_ops|Mux14~21_combout\,
	combout => \m1_ops|Mux14~27_combout\);

-- Location: LCCOMB_X67_Y18_N26
\m2_ops|Mux6~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~32_combout\ = (!\mseq|current_addr\(0) & (!\mseq|current_addr\(3) & \mseq|current_addr\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(3),
	datad => \mseq|current_addr\(1),
	combout => \m2_ops|Mux6~32_combout\);

-- Location: LCCOMB_X67_Y18_N24
\m2_ops|Mux6~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~57_combout\ = (!\mseq|current_addr\(5) & (!\mseq|current_addr\(4) & (\m2_ops|Mux6~32_combout\ & !\mseq|current_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(4),
	datac => \m2_ops|Mux6~32_combout\,
	datad => \mseq|current_addr\(2),
	combout => \m2_ops|Mux6~57_combout\);

-- Location: LCCOMB_X67_Y18_N10
\m2_ops|Mux6~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~44_combout\ = (\mseq|current_addr\(2) & (\mseq|current_addr\(0) & !\mseq|current_addr\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \m2_ops|Mux6~44_combout\);

-- Location: LCCOMB_X67_Y18_N28
\m2_ops|Mux6~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~58_combout\ = (!\mseq|current_addr\(5) & (\mseq|current_addr\(3) & (!\mseq|current_addr\(4) & \m2_ops|Mux6~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(4),
	datad => \m2_ops|Mux6~44_combout\,
	combout => \m2_ops|Mux6~58_combout\);

-- Location: LCCOMB_X70_Y16_N18
\RBUS~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RBUS~4_combout\ = (\mseq|current_addr\(5) & ((!\mseq|current_addr\(3)) # (!\mseq|current_addr\(2)))) # (!\mseq|current_addr\(5) & (!\mseq|current_addr\(2) & !\mseq|current_addr\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(3),
	combout => \RBUS~4_combout\);

-- Location: LCCOMB_X70_Y16_N0
\RBUS~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \RBUS~9_combout\ = (\mseq|current_addr\(4) & (\RBUS~4_combout\ & (\mseq|current_addr\(0) & !\mseq|current_addr\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(4),
	datab => \RBUS~4_combout\,
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \RBUS~9_combout\);

-- Location: LCCOMB_X73_Y20_N14
\ACLOAD~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ACLOAD~0_combout\ = (\mseq|microcode|Mux5~3_combout\ & ((\mseq|microcode|Mux6~6_combout\) # (!\mseq|microcode|Mux4~2_combout\))) # (!\mseq|microcode|Mux5~3_combout\ & (\mseq|microcode|Mux4~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|microcode|Mux5~3_combout\,
	datac => \mseq|microcode|Mux4~2_combout\,
	datad => \mseq|microcode|Mux6~6_combout\,
	combout => \ACLOAD~0_combout\);

-- Location: LCCOMB_X69_Y20_N10
\ACBUS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ACBUS~0_combout\ = (!\mseq|microcode|Mux10~3_combout\ & \mseq|microcode|Mux8~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|microcode|Mux10~3_combout\,
	datad => \mseq|microcode|Mux8~4_combout\,
	combout => \ACBUS~0_combout\);

-- Location: LCCOMB_X67_Y18_N30
\m2_ops|Mux6~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \m2_ops|Mux6~54_combout\ = (\mseq|current_addr\(0) & (\mseq|current_addr\(5) & !\mseq|current_addr\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(1),
	combout => \m2_ops|Mux6~54_combout\);

-- Location: LCCOMB_X70_Y1_N4
\HDigit|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HDigit|Mux3~0_combout\ = (\mseq|current_addr\(5)) # (!\mseq|current_addr\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mseq|current_addr\(4),
	datad => \mseq|current_addr\(5),
	combout => \HDigit|Mux3~0_combout\);

-- Location: LCCOMB_X70_Y1_N26
\HDigit|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HDigit|Mux2~0_combout\ = (\mseq|current_addr\(4)) # (!\mseq|current_addr\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mseq|current_addr\(4),
	datad => \mseq|current_addr\(5),
	combout => \HDigit|Mux2~0_combout\);

-- Location: LCCOMB_X67_Y16_N2
\LDigit|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDigit|Mux6~0_combout\ = (\mseq|current_addr\(0) & ((\mseq|current_addr\(1)) # (\mseq|current_addr\(2) $ (\mseq|current_addr\(3))))) # (!\mseq|current_addr\(0) & ((\mseq|current_addr\(3)) # (\mseq|current_addr\(2) $ (\mseq|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \LDigit|Mux6~0_combout\);

-- Location: LCCOMB_X70_Y16_N30
\LDigit|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDigit|Mux5~0_combout\ = (\mseq|current_addr\(2) & (!\mseq|current_addr\(0) & (\mseq|current_addr\(3) $ (\mseq|current_addr\(1))))) # (!\mseq|current_addr\(2) & (!\mseq|current_addr\(3) & ((\mseq|current_addr\(1)) # (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \LDigit|Mux5~0_combout\);

-- Location: LCCOMB_X67_Y18_N12
\LDigit|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDigit|Mux4~0_combout\ = (\mseq|current_addr\(1) & (!\mseq|current_addr\(0) & (!\mseq|current_addr\(3)))) # (!\mseq|current_addr\(1) & ((\mseq|current_addr\(2) & ((!\mseq|current_addr\(3)))) # (!\mseq|current_addr\(2) & (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(1),
	combout => \LDigit|Mux4~0_combout\);

-- Location: LCCOMB_X67_Y16_N20
\LDigit|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDigit|Mux3~0_combout\ = (\mseq|current_addr\(1) & ((\mseq|current_addr\(2) & ((!\mseq|current_addr\(0)))) # (!\mseq|current_addr\(2) & (\mseq|current_addr\(3) & \mseq|current_addr\(0))))) # (!\mseq|current_addr\(1) & (!\mseq|current_addr\(3) & 
-- (\mseq|current_addr\(2) $ (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(2),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \LDigit|Mux3~0_combout\);

-- Location: LCCOMB_X70_Y16_N22
\LDigit|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDigit|Mux2~0_combout\ = (\mseq|current_addr\(3) & (\mseq|current_addr\(2) & ((\mseq|current_addr\(0)) # (\mseq|current_addr\(1))))) # (!\mseq|current_addr\(3) & (!\mseq|current_addr\(2) & (\mseq|current_addr\(0) & \mseq|current_addr\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(0),
	datad => \mseq|current_addr\(1),
	combout => \LDigit|Mux2~0_combout\);

-- Location: LCCOMB_X72_Y16_N14
\LDigit|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDigit|Mux1~0_combout\ = (\mseq|current_addr\(1) & ((\mseq|current_addr\(0) & ((\mseq|current_addr\(2)))) # (!\mseq|current_addr\(0) & (\mseq|current_addr\(3))))) # (!\mseq|current_addr\(1) & (\mseq|current_addr\(2) & (\mseq|current_addr\(3) $ 
-- (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(0),
	combout => \LDigit|Mux1~0_combout\);

-- Location: LCCOMB_X72_Y16_N16
\LDigit|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDigit|Mux0~0_combout\ = (\mseq|current_addr\(3) & (!\mseq|current_addr\(0) & (\mseq|current_addr\(1) $ (\mseq|current_addr\(2))))) # (!\mseq|current_addr\(3) & (!\mseq|current_addr\(1) & (\mseq|current_addr\(2) $ (!\mseq|current_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(0),
	combout => \LDigit|Mux0~0_combout\);

-- Location: LCCOMB_X67_Y18_N20
\ALUSEL|Mux6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux6~3_combout\ = (\mseq|current_addr\(1) & (!\mseq|current_addr\(5) & (\mseq|current_addr\(2) & !\mseq|current_addr\(4)))) # (!\mseq|current_addr\(1) & (\mseq|current_addr\(5) $ (((!\mseq|current_addr\(2) & \mseq|current_addr\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(4),
	datad => \mseq|current_addr\(1),
	combout => \ALUSEL|Mux6~3_combout\);

-- Location: LCCOMB_X67_Y18_N18
\ALUSEL|Mux6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux6~4_combout\ = (\mseq|current_addr\(5) & (!\mseq|current_addr\(1) & ((\mseq|current_addr\(2)) # (\mseq|current_addr\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(4),
	datad => \mseq|current_addr\(1),
	combout => \ALUSEL|Mux6~4_combout\);

-- Location: LCCOMB_X67_Y18_N4
\ALUSEL|Mux6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux6~7_combout\ = (\mseq|current_addr\(0) & ((\mseq|current_addr\(3) & ((\ALUSEL|Mux6~4_combout\))) # (!\mseq|current_addr\(3) & (\ALUSEL|Mux6~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUSEL|Mux6~3_combout\,
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(0),
	datad => \ALUSEL|Mux6~4_combout\,
	combout => \ALUSEL|Mux6~7_combout\);

-- Location: LCCOMB_X72_Y16_N22
\ALUSEL|Mux5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux5~3_combout\ = (\mseq|current_addr\(3) & (!\mseq|current_addr\(4) & ((\mseq|current_addr\(5))))) # (!\mseq|current_addr\(3) & (\mseq|current_addr\(4) & (!\mseq|current_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(5),
	combout => \ALUSEL|Mux5~3_combout\);

-- Location: LCCOMB_X72_Y16_N28
\ALUSEL|Mux5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux5~6_combout\ = (!\mseq|current_addr\(1) & (\ALUSEL|Mux5~3_combout\ & \mseq|current_addr\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datac => \ALUSEL|Mux5~3_combout\,
	datad => \mseq|current_addr\(0),
	combout => \ALUSEL|Mux5~6_combout\);

-- Location: LCCOMB_X72_Y16_N12
\ALUSEL|Mux4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux4~4_combout\ = (!\mseq|current_addr\(1) & (!\mseq|current_addr\(2) & \mseq|current_addr\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(5),
	combout => \ALUSEL|Mux4~4_combout\);

-- Location: LCCOMB_X72_Y16_N10
\ALUSEL|Mux4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux4~3_combout\ = (\mseq|current_addr\(4) & (((!\mseq|current_addr\(2) & !\mseq|current_addr\(1))))) # (!\mseq|current_addr\(4) & (\mseq|current_addr\(2) & (\mseq|current_addr\(5) $ (\mseq|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(4),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(1),
	combout => \ALUSEL|Mux4~3_combout\);

-- Location: LCCOMB_X72_Y16_N30
\ALUSEL|Mux4~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux4~7_combout\ = (\mseq|current_addr\(0) & ((\mseq|current_addr\(3) & (\ALUSEL|Mux4~4_combout\)) # (!\mseq|current_addr\(3) & ((\ALUSEL|Mux4~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUSEL|Mux4~4_combout\,
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(3),
	datad => \ALUSEL|Mux4~3_combout\,
	combout => \ALUSEL|Mux4~7_combout\);

-- Location: LCCOMB_X70_Y16_N28
\ALUSEL|Mux3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux3~7_combout\ = (\mseq|current_addr\(3) & (\mseq|current_addr\(5) & (\mseq|current_addr\(2) $ (!\mseq|current_addr\(4))))) # (!\mseq|current_addr\(3) & ((\mseq|current_addr\(2) & (!\mseq|current_addr\(5) & !\mseq|current_addr\(4))) # 
-- (!\mseq|current_addr\(2) & (\mseq|current_addr\(5) & \mseq|current_addr\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(3),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(4),
	combout => \ALUSEL|Mux3~7_combout\);

-- Location: LCCOMB_X70_Y16_N26
\ALUSEL|Mux3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux3~8_combout\ = (\mseq|current_addr\(0) & (\ALUSEL|Mux3~7_combout\ & (\mseq|current_addr\(5) $ (\mseq|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(0),
	datab => \ALUSEL|Mux3~7_combout\,
	datac => \mseq|current_addr\(5),
	datad => \mseq|current_addr\(1),
	combout => \ALUSEL|Mux3~8_combout\);

-- Location: LCCOMB_X72_Y16_N20
\ALUSEL|Mux2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux2~3_combout\ = (\mseq|current_addr\(5) & (\mseq|current_addr\(2) & \mseq|current_addr\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(2),
	datac => \mseq|current_addr\(3),
	combout => \ALUSEL|Mux2~3_combout\);

-- Location: LCCOMB_X72_Y16_N6
\ALUSEL|Mux2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux2~12_combout\ = (!\mseq|current_addr\(1) & (\mseq|current_addr\(0) & (!\mseq|current_addr\(4) & \ALUSEL|Mux2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(0),
	datac => \mseq|current_addr\(4),
	datad => \ALUSEL|Mux2~3_combout\,
	combout => \ALUSEL|Mux2~12_combout\);

-- Location: LCCOMB_X72_Y16_N8
\ALUSEL|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux1~3_combout\ = (\mseq|current_addr\(5) & !\mseq|current_addr\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datac => \mseq|current_addr\(3),
	combout => \ALUSEL|Mux1~3_combout\);

-- Location: LCCOMB_X72_Y16_N2
\ALUSEL|Mux1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux1~9_combout\ = (!\mseq|current_addr\(1) & (!\mseq|current_addr\(4) & (\ALUSEL|Mux1~3_combout\ & \mseq|current_addr\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(1),
	datab => \mseq|current_addr\(4),
	datac => \ALUSEL|Mux1~3_combout\,
	datad => \mseq|current_addr\(0),
	combout => \ALUSEL|Mux1~9_combout\);

-- Location: LCCOMB_X72_Y16_N18
\ALUSEL|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux0~3_combout\ = (\mseq|current_addr\(5) & (\mseq|current_addr\(3) & (!\mseq|current_addr\(2) & !\mseq|current_addr\(1)))) # (!\mseq|current_addr\(5) & (!\mseq|current_addr\(3) & (\mseq|current_addr\(2) & \mseq|current_addr\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mseq|current_addr\(5),
	datab => \mseq|current_addr\(3),
	datac => \mseq|current_addr\(2),
	datad => \mseq|current_addr\(1),
	combout => \ALUSEL|Mux0~3_combout\);

-- Location: LCCOMB_X72_Y16_N0
\ALUSEL|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSEL|Mux0~6_combout\ = (!\mseq|current_addr\(4) & (\ALUSEL|Mux0~3_combout\ & \mseq|current_addr\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mseq|current_addr\(4),
	datac => \ALUSEL|Mux0~3_combout\,
	datad => \mseq|current_addr\(0),
	combout => \ALUSEL|Mux0~6_combout\);

ww_error <= \error~output_o\;

ww_ARLOAD <= \ARLOAD~output_o\;

ww_ARINC <= \ARINC~output_o\;

ww_R <= \R~output_o\;

ww_W <= \W~output_o\;

ww_MEMBUS <= \MEMBUS~output_o\;

ww_BUSMEM <= \BUSMEM~output_o\;

ww_PCINC <= \PCINC~output_o\;

ww_PCLOAD <= \PCLOAD~output_o\;

ww_PCBUS <= \PCBUS~output_o\;

ww_DRLBUS <= \DRLBUS~output_o\;

ww_DRHBUS <= \DRHBUS~output_o\;

ww_DRLOAD <= \DRLOAD~output_o\;

ww_TRLOAD <= \TRLOAD~output_o\;

ww_TRBUS <= \TRBUS~output_o\;

ww_IRLOAD <= \IRLOAD~output_o\;

ww_RLOAD <= \RLOAD~output_o\;

ww_RBUS <= \RBUS~output_o\;

ww_ACLOAD <= \ACLOAD~output_o\;

ww_ACBUS <= \ACBUS~output_o\;

ww_ZLOAD <= \ZLOAD~output_o\;

ww_curr_add_H(0) <= \curr_add_H[0]~output_o\;

ww_curr_add_H(1) <= \curr_add_H[1]~output_o\;

ww_curr_add_H(2) <= \curr_add_H[2]~output_o\;

ww_curr_add_H(3) <= \curr_add_H[3]~output_o\;

ww_curr_add_H(4) <= \curr_add_H[4]~output_o\;

ww_curr_add_H(5) <= \curr_add_H[5]~output_o\;

ww_curr_add_H(6) <= \curr_add_H[6]~output_o\;

ww_curr_add_L(0) <= \curr_add_L[0]~output_o\;

ww_curr_add_L(1) <= \curr_add_L[1]~output_o\;

ww_curr_add_L(2) <= \curr_add_L[2]~output_o\;

ww_curr_add_L(3) <= \curr_add_L[3]~output_o\;

ww_curr_add_L(4) <= \curr_add_L[4]~output_o\;

ww_curr_add_L(5) <= \curr_add_L[5]~output_o\;

ww_curr_add_L(6) <= \curr_add_L[6]~output_o\;

ww_curr_aLU_S(0) <= \curr_aLU_S[0]~output_o\;

ww_curr_aLU_S(1) <= \curr_aLU_S[1]~output_o\;

ww_curr_aLU_S(2) <= \curr_aLU_S[2]~output_o\;

ww_curr_aLU_S(3) <= \curr_aLU_S[3]~output_o\;

ww_curr_aLU_S(4) <= \curr_aLU_S[4]~output_o\;

ww_curr_aLU_S(5) <= \curr_aLU_S[5]~output_o\;

ww_curr_aLU_S(6) <= \curr_aLU_S[6]~output_o\;
END structure;


