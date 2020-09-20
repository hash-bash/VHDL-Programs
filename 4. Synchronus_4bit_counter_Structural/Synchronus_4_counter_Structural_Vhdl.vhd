library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity JK_FF is
    Port ( J,K,CLK,RESET : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end JK_FF;

architecture Behavioral of JK_FF is

SIGNAL S : STD_LOGIC := '0';
begin

	PROCESS(CLK,RESET) BEGIN
		
		IF(RESET = '1') THEN
				S<='0';
		ELSIF(CLK'EVENT AND CLK='1') THEN
			IF(J='0' AND K='0') THEN
				S<=S;
			ELSIF(J='0' AND K='1') THEN
				S<='0';
			ELSIF(J='1' AND K='0') THEN
				S<='1';
			ELSIF(J='1' AND K='1') THEN 
				S<= (NOT S);
			END IF;
		END IF;
		Q<=S;
			
	END PROCESS;

end Behavioral;

----------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Synchronus_4_counter_Structural_Vhdl is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end Synchronus_4_counter_Structural_Vhdl;

architecture STRUCTURAL of Synchronus_4_counter_Structural_Vhdl is

COMPONENT JK_FF is
 Port ( J,K,CLK,RESET : in  STD_LOGIC;
		  Q : out  STD_LOGIC);
end COMPONENT;

SIGNAL T : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S0,S1: STD_LOGIC;
begin

	D0: JK_FF PORT MAP('1' ,'1' ,CLK,RST,T(0));
	D1: JK_FF PORT MAP(T(0),T(0),CLK,RST,T(1));
	S0 <= T(0) AND T(1);
	D2: JK_FF PORT MAP( S0 , S0 ,CLK,RST,T(2));
	S1 <= S0 AND T(2);
	D3: JK_FF PORT MAP( S1 , S1 ,CLK,RST,T(3));
	
	Q(0) <= T(0);
	Q(1) <= T(1);
	Q(2) <= T(2);
	Q(3) <= T(3);
	

end STRUCTURAL;