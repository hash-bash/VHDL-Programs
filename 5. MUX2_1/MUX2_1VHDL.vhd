----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:53 10/06/2019 
-- Design Name: 
-- Module Name:    MUX2_1VHDL - Behavioral 
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

entity MUX2_1VHDL is
    Port ( S : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end MUX2_1VHDL;

architecture Behavioral of MUX2_1VHDL is

begin
PROCESS(S,A,B)
BEGIN
	IF	(S='0')	THEN	Y<=A;
	ELSIF	(S='1')	THEN	Y<=B;

END IF;

END PROCESS;
end Behavioral;

