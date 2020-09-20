library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity JK_FF_vhdl is
    Port ( CLK : in  STD_LOGIC;
           CLEAR : in  STD_LOGIC;
           PRESET : in  STD_LOGIC;
           J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end JK_FF_vhdl;

architecture Behavioral of JK_FF_vhdl is

SIGNAL S : STD_LOGIC := '0';
begin

	PROCESS(CLK,CLEAR,PRESET) BEGIN
		
		IF(CLEAR = '1') THEN
				S<='0';
		ELSIF(PRESET = '1') THEN
				S<='1';
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

