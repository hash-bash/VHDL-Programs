library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Full_Adder_Dataflow_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Full_Adder_Dataflow_vhdl;

architecture DATAFLOW of Full_Adder_Dataflow_vhdl is

begin

	SUM <= A XOR (B XOR CIN);
	COUT <= (A AND B) OR (B AND CIN) OR (CIN AND A);

end DATAFLOW;

