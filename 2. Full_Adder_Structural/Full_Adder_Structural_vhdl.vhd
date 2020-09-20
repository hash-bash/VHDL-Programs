library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HALF_ADDER is
    Port ( A,B : in  STD_LOGIC;
           SUM,COUT : out  STD_LOGIC);
end HALF_ADDER;

architecture DATAFLOW of HALF_ADDER is

begin

	SUM <= A XOR B;
	COUT <= A AND B;

end DATAFLOW;

---------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OR_GATE is
    Port ( A,B : in  STD_LOGIC;
           S : out  STD_LOGIC);
end OR_GATE;

architecture DATAFLOW of OR_GATE is

begin

	S<= A OR B;

end DATAFLOW;

-----------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Full_Adder_Structural_vhdl is
    Port ( A,B,CIN : in  STD_LOGIC;
           SUM,COUT : out  STD_LOGIC);
end Full_Adder_Structural_vhdl;

architecture STRUCTURAL of Full_Adder_Structural_vhdl is

COMPONENT HALF_ADDER IS
	PORT (A,B : IN STD_LOGIC;
			SUM,COUT: OUT STD_LOGIC);
END COMPONENT;

COMPONENT OR_GATE IS
	PORT (A,B : IN STD_LOGIC;
			S: OUT STD_LOGIC);
END COMPONENT;

SIGNAL S1,S2,S3 : STD_LOGIC;
begin

	U1: HALF_ADDER PORT MAP(A=>A,B=>B,SUM=>S1,COUT=>S2);
	U2: HALF_ADDER PORT MAP(A=>S1,B=>CIN,SUM=>SUM,COUT=>S3);
	U3: OR_GATE PORT MAP(A=>S2,B=>S3,S=>COUT);

end STRUCTURAL;

