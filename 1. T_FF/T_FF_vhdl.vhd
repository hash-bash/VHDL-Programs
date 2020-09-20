library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity T_FF_vhdl is
    Port ( CLK : in  STD_LOGIC;
           CLEAR : in  STD_LOGIC;
           PRESET : in  STD_LOGIC;
           T : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end T_FF_vhdl;

architecture Behavioral of T_FF_vhdl is

SIGNAL S : STD_LOGIC := '0';
begin

	PROCESS(CLK,PRESET,CLEAR) BEGIN
	
		IF(CLEAR='1') THEN
			S<='0';
		ELSIF(PRESET='1') THEN
			S<='1';
		ELSIF(CLK'EVENT AND CLK='1') THEN
			IF(T='0') THEN
				S<=S;
			ELSIF(T='1') THEN 
				S<=(NOT S);
			END IF;
		END IF;
		
		Q<=S;
	END PROCESS;

end Behavioral;

