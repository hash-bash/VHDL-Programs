--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1i
--  \   \         Application : ISE
--  /   /         Filename : DECODER3_8WAVE.vhw
-- /___/   /\     Timestamp : Sun Oct 06 12:50:22 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: DECODER3_8WAVE
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY DECODER3_8WAVE IS
END DECODER3_8WAVE;

ARCHITECTURE testbench_arch OF DECODER3_8WAVE IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT DECODER3_8VHDL
        PORT (
            A : In std_logic_vector (2 DownTo 0);
            Y : Out std_logic_vector (7 DownTo 0)
        );
    END COMPONENT;

    SIGNAL A : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL Y : std_logic_vector (7 DownTo 0) := "00000000";

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : DECODER3_8VHDL
        PORT MAP (
            A => A,
            Y => Y
        );

        PROCESS
            PROCEDURE CHECK_Y(
                next_Y : std_logic_vector (7 DownTo 0);
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (Y /= next_Y) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns Y="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Y);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Y);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                A <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  150ns
                WAIT FOR 50 ns;
                CHECK_Y("00010000", 150);
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 50 ns;
                A <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  350ns
                WAIT FOR 150 ns;
                CHECK_Y("01010000", 350);
                -- -------------------------------------
                -- -------------  Current Time:  1000ns
                WAIT FOR 650 ns;
                A <= "010";

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

