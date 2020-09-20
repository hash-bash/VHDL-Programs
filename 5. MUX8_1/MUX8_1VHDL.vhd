----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:18 10/06/2019 
-- Design Name: 
-- Module Name:    MUX8_1VHDL - Behavioral 
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

entity MUX8_1VHDL is
    Port ( S : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           F : in  STD_LOGIC;
           G : in  STD_LOGIC;
           H : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end MUX8_1VHDL;

architecture Behavioral of MUX8_1VHDL is

begin
PROCESS(S,A,B,C,D,E,F,G,H)
BEGIN

IF	(S="000")	THEN	Y<=A;
ELSIF	(S="001")	THEN	Y<=B;
ELSIF	(S="010")	THEN	Y<=C;
ELSIF	(S="011")	THEN	Y<=D;
ELSIF	(S="100")	THEN	Y<=E;
ELSIF	(S="101")	THEN	Y<=F;
ELSIF	(S="110")	THEN	Y<=G;
ELSE	Y<=H;

END IF;

END PROCESS;

end Behavioral;

