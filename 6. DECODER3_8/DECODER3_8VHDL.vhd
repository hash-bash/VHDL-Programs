----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:29:48 10/06/2019 
-- Design Name: 
-- Module Name:    DECODER3_8VHDL - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DECODER3_8VHDL is
    Port ( A : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           Y : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end DECODER3_8VHDL;

architecture Behavioral of DECODER3_8VHDL is

begin

PROCESS(A)
	BEGIN
		CASE A IS
		WHEN "111" =>	Y <= "00000001";
		WHEN "110" =>	Y <= "00000010";
		WHEN "101" =>	Y <= "00000100";
		WHEN "100" =>	Y <= "00001000";
		WHEN "011" =>	Y <= "00010000";
		WHEN "010" =>	Y <= "00100000";
		WHEN "001" =>	Y <= "01000000";
		WHEN "000" =>	Y <= "10000000";
		
		WHEN OTHERS => NULL;
		END CASE;
		
		END PROCESS;
end Behavioral;

