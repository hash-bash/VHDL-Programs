library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HS_XOR is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end HS_XOR;

architecture DATAFLOW of HS_XOR is

begin

	C <= A XOR B;

end DATAFLOW;

----------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HS_AND is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end HS_AND;

architecture DATAFLOW of HS_AND is

begin

	C <= A AND B;

end DATAFLOW;

-----------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Half_Subtractor_Structural_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BOUT : out  STD_LOGIC);
end Half_Subtractor_Structural_vhdl;

architecture STRUCTURAL of Half_Subtractor_Structural_vhdl is

COMPONENT HS_XOR IS
	PORT(A,B : IN STD_LOGIC;
		  C : OUT STD_LOGIC);
END COMPONENT;

COMPONENT HS_AND IS
	PORT(A,B : IN STD_LOGIC;
		  C : OUT STD_LOGIC);
END COMPONENT;

begin

	U1: HS_XOR PORT MAP(A,B,DIFF);
	U2: HS_AND PORT MAP((NOT A),B,BOUT);

end STRUCTURAL;

