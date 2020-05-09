@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Tue Apr 28 14:57:07 -0700 2020
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim Factorial_with_wrapper_TB_behav -key {Behavioral:fact+wrapper:Functional:Factorial_with_wrapper_TB} -tclbatch Factorial_with_wrapper_TB.tcl -view D:/Documents/CMPE 140/cmpe_140-assignment-8/assignment_8/Factorial_with_wrapper_TB_behav.wcfg -log simulate.log"
call xsim  Factorial_with_wrapper_TB_behav -key {Behavioral:fact+wrapper:Functional:Factorial_with_wrapper_TB} -tclbatch Factorial_with_wrapper_TB.tcl -view D:/Documents/CMPE 140/cmpe_140-assignment-8/assignment_8/Factorial_with_wrapper_TB_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
