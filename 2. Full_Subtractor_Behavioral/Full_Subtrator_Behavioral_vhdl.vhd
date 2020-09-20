library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Full_Subtrator_Behavioral_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           BIN : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BOUT : out  STD_LOGIC);
end Full_Subtrator_Behavioral_vhdl;

architecture Behavioral of Full_Subtrator_Behavioral_vhdl is

begin

	PROCESS(A,B,BIN) BEGIN
	
		IF(A<='0' AND B<='0' AND BIN<='0')	THEN
			DIFF<='0';
			BOUT<='0';
		ELSIF(A<='0' AND B<='0' AND BIN<='1')	THEN
			DIFF<='1';
			BOUT<='1';
		ELSIF(A<='0' AND B<='1' AND BIN<='0')	THEN
			DIFF<='1';
			BOUT<='1';
		ELSIF(A<='0' AND B<='1' AND BIN<='1')	THEN
			DIFF<='0';
			BOUT<='1';
		ELSIF(A<='1' AND B<='0' AND BIN<='0')	THEN
			DIFF<='1';
			BOUT<='0';
		ELSIF(A<='1' AND B<='0' AND BIN<='1')	THEN
			DIFF<='0';
			BOUT<='0';
		ELSIF(A<='1' AND B<='1' AND BIN<='0')	THEN
			DIFF<='0';
			BOUT<='0';
		ELSIF(A<='1' AND B<='1' AND BIN<='1')	THEN
			DIFF<='1';
			BOUT<='1';
		END IF;
	
	END PROCESS;

end Behavioral;

