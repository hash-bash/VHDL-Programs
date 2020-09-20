--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1i
--  \   \         Application : ISE
--  /   /         Filename : Synchronus_4_counter_Structural_Wave.vhw
-- /___/   /\     Timestamp : Tue Oct 08 19:43:39 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: Synchronus_4_counter_Structural_Wave
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY Synchronus_4_counter_Structural_Wave IS
END Synchronus_4_counter_Structural_Wave;

ARCHITECTURE testbench_arch OF Synchronus_4_counter_Structural_Wave IS
    COMPONENT Synchronus_4_counter_Structural_Vhdl
        PORT (
            CLK : In std_logic;
            RST : In std_logic;
            Q : Out std_logic_vector (3 DownTo 0)
        );
    END COMPONENT;

    SIGNAL CLK : std_logic := '0';
    SIGNAL RST : std_logic := '0';
    SIGNAL Q : std_logic_vector (3 DownTo 0) := "0000";

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 100 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : Synchronus_4_counter_Structural_Vhdl
        PORT MAP (
            CLK => CLK,
            RST => RST,
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
                next_Q : std_logic_vector (3 DownTo 0);
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
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  335ns
                WAIT FOR 335 ns;
                RST <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  435ns
                WAIT FOR 100 ns;
                RST <= '0';
                -- -------------------------------------
                WAIT FOR 665 ns;

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

