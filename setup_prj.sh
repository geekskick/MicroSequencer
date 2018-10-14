#!/usr/bin/env bash
VIVADO_PATH=/opt/Xilinx/Vivado/2018.1/bin; export VIVADO_PATH
mkdir -p ~/Documents/vivado/rs_cpu
$VIVADO_PATH/vivado -source vivado_setup.tcl
