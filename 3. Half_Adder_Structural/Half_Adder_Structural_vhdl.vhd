library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HA_XOR is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end HA_XOR;

architecture DATAFLOW of HA_XOR is

begin

	C <= A XOR B;

end DATAFLOW;

---------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HA_AND is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end HA_AND;

architecture DATAFLOW of HA_AND is

begin

	C <= A AND B;

end DATAFLOW;

----------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Half_Adder_Structural_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Half_Adder_Structural_vhdl;

architecture STRUCTURAL of Half_Adder_Structural_vhdl is

COMPONENT HA_XOR IS
	PORT(A,B : IN STD_LOGIC;
		  C : OUT STD_LOGIC);
END COMPONENT;

COMPONENT HA_AND IS
	PORT(A,B : IN STD_LOGIC;
		  C : OUT STD_LOGIC);
END COMPONENT;


begin

	U1: HA_XOR PORT MAP(A,B,SUM);
	U2: HA_AND PORT MAP(A,B,COUT);

end STRUCTURAL;

