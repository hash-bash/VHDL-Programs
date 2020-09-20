library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity D_FF_vhdl is
    Port ( CLK : in  STD_LOGIC;
           PRESET : in  STD_LOGIC;
           CLEAR : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end D_FF_vhdl;

architecture Behavioral of D_FF_vhdl is

begin

	PROCESS(CLK) BEGIN
		
		IF(CLK'EVENT AND CLK ='1') THEN
			IF(CLEAR ='1')	THEN
				Q <= '0';
			ELSIF(PRESET ='1') THEN
				Q <='1';
			ELSE
				Q <= D;
			END IF;
		END IF;
	
	END PROCESS;

end Behavioral;

