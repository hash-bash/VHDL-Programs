--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1i
--  \   \         Application : ISE
--  /   /         Filename : D_FF_WAVE.vhw
-- /___/   /\     Timestamp : Sun Oct 06 22:54:16 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: D_FF_WAVE
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY D_FF_WAVE IS
END D_FF_WAVE;

ARCHITECTURE testbench_arch OF D_FF_WAVE IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT D_FF_vhdl
        PORT (
            CLK : In std_logic;
            PRESET : In std_logic;
            CLEAR : In std_logic;
            D : In std_logic;
            Q : Out std_logic
        );
    END COMPONENT;

    SIGNAL CLK : std_logic := '0';
    SIGNAL PRESET : std_logic := '0';
    SIGNAL CLEAR : std_logic := '0';
    SIGNAL D : std_logic := '0';
    SIGNAL Q : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : D_FF_vhdl
        PORT MAP (
            CLK => CLK,
            PRESET => PRESET,
            CLEAR => CLEAR,
            D => D,
            Q => Q
        );

        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            PROCEDURE CHECK_Q(
                next_Q : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (Q /= next_Q) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns Q="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Q);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Q);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  85ns
                WAIT FOR 85 ns;
                D <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  285ns
                WAIT FOR 200 ns;
                CLEAR <= '1';
                D <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 200 ns;
                CLEAR <= '0';
                D <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  685ns
                WAIT FOR 200 ns;
                PRESET <= '1';
                D <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  885ns
                WAIT FOR 200 ns;
                PRESET <= '0';
                D <= '1';
                -- -------------------------------------
                WAIT FOR 315 ns;

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

