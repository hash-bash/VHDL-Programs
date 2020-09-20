library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Half_Adder_Behhavioural_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Half_Adder_Behhavioural_vhdl;

architecture Behavioral of Half_Adder_Behhavioural_vhdl is

begin

	PROCESS(A,B)	BEGIN
		
		IF(A<='0' AND B<='0') THEN
			SUM <= '0';
			COUT <= '0';
		ELSIF(A<='0' AND B<='1') THEN
			SUM <= '1';
			COUT <= '0';
		ELSIF(A<='1' AND B<='0') THEN
			SUM <= '1';
			COUT <= '0';
		ELSIF(A<='1' AND B<='1') THEN
			SUM <= '1';
			COUT <= '1';
		END IF;
	
	END PROCESS;

end Behavioral;

