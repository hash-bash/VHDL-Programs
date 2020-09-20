library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Half_Subtractor_Dataflow_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BOUT : out  STD_LOGIC);
end Half_Subtractor_Dataflow_vhdl;

architecture DATAFLOW of Half_Subtractor_Dataflow_vhdl is

begin

	DIFF <= A XOR B;
	BOUT <= (NOT A) AND B;

end DATAFLOW;

