library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FS_XOR is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end FS_XOR;

architecture DATAFLOW of FS_XOR is

begin

	C<=A XOR B;

end DATAFLOW;

---------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FS_AND is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end FS_AND;

architecture DATAFLOW of FS_AND is

begin

	C<= A AND B;

end DATAFLOW;

---------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FS_OR is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end FS_OR;

architecture DATAFLOW of FS_OR is

begin

	C<= A OR B;

end DATAFLOW;

----------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Full_Subtrator_Structural_vhdl is
    Port ( A,B,BIN : in  STD_LOGIC;
           DIFF,BOUT : out  STD_LOGIC);
end Full_Subtrator_Structural_vhdl;

architecture STRUCTURAL of Full_Subtrator_Structural_vhdl is

COMPONENT FS_XOR IS
	PORT( A,B : IN STD_LOGIC;
			C	: OUT STD_LOGIC);
END COMPONENT;

COMPONENT FS_AND IS
	PORT( A,B : IN STD_LOGIC;
			C	: OUT STD_LOGIC);
END COMPONENT;

COMPONENT FS_OR IS
	PORT( A,B : IN STD_LOGIC;
			C	: OUT STD_LOGIC);
END COMPONENT;

SIGNAL S0,S1,S2,S3,S4 : STD_LOGIC;
begin

	U1: FS_XOR PORT MAP(A,B,S0);
	U2: FS_XOR PORT MAP(S0,BIN,DIFF);
	U3: FS_AND PORT MAP((NOT A),B,S1);
	U4: FS_AND PORT MAP(B,BIN,S2);
	U5: FS_AND PORT MAP(BIN,(NOT A),S3);
	U6: FS_OR  PORT MAP(S1,S2,S4);
	U7: FS_OR  PORT MAP(S3,S4,BOUT);

end STRUCTURAL;

