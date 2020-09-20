library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Half_Adder_Dataflow_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Half_Adder_Dataflow_vhdl;

architecture Behavioral of Half_Adder_Dataflow_vhdl is

begin

	SUM <= A XOR B;
	COUT <= A AND B;

end Behavioral;

