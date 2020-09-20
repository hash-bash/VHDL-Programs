library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX4_1VHDL is
    Port ( S : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end MUX4_1VHDL;

architecture Behavioral of MUX4_1VHDL is

begin
PROCESS(S,A,B,C,D)
BEGIN
	IF	(S="00")	THEN	Y<=A;
	ELSIF	(S="01")	THEN	Y<=B;
	ELSIF	(S="10")	THEN	Y<=C;
	ELSIF	(S="11")	THEN	Y<=D;
	
	END IF;
	
	END PROCESS;

end Behavioral;

