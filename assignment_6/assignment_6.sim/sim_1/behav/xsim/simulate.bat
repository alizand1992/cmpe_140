@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Apr 18 05:11:33 -0700 2020
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim tb_mips_top_behav -key {Behavioral:sim_1:Functional:tb_mips_top} -tclbatch tb_mips_top.tcl -view C:/Users/aliza/Documents/cmpe_140/assignment_6/tb_mips_top_behav.wcfg -log simulate.log"
call xsim  tb_mips_top_behav -key {Behavioral:sim_1:Functional:tb_mips_top} -tclbatch tb_mips_top.tcl -view C:/Users/aliza/Documents/cmpe_140/assignment_6/tb_mips_top_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
