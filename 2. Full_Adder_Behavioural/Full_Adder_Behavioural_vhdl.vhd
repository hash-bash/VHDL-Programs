library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Full_Adder_Behavioural_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Full_Adder_Behavioural_vhdl;

architecture Behavioral of Full_Adder_Behavioural_vhdl is

begin
	PROCESS(A,B,CIN) BEGIN
		if(A<='0' AND B<='0' AND CIN<='0') THEN 
			SUM<='0';
			COUT<='0';	
		ELSIF(A<='0' AND B<='0' AND CIN<='1')	THEN
			SUM<='1';
			COUT<='0';
		ELSIF(A<='0' AND B<='1' AND CIN<='0')	THEN
			SUM<='1';
			COUT<='0';
		ELSIF(A<='0' AND B<='1' AND CIN<='1')	THEN
			SUM<='0';
			COUT<='1';
		ELSIF(A<='1' AND B<='0' AND CIN<='0')	THEN
			SUM<='1';
			COUT<='0';
		ELSIF(A<='1' AND B<='0' AND CIN<='1')	THEN
			SUM<='0';
			COUT<='1';
		ELSIF(A<='1' AND B<='1' AND CIN<='0')	THEN
			SUM<='0';
			COUT<='1';
		ELSIF(A<='1' AND B<='1' AND CIN<='1')	THEN
			SUM<='1';
			COUT<='1';
		END IF;
	END PROCESS;
end Behavioral;

