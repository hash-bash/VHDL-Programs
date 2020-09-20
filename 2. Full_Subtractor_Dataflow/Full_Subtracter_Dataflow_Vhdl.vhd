----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:34:56 10/06/2019 
-- Design Name: 
-- Module Name:    Full_Subtracter_Dataflow_Vhdl - Behavioral 
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

entity Full_Subtracter_Dataflow_Vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           BIN : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BOR : out  STD_LOGIC);
end Full_Subtracter_Dataflow_Vhdl;

architecture Behavioral of Full_Subtracter_Dataflow_Vhdl is

begin

	DIFF<= A XOR (B XOR BIN);
	BOR<= ((NOT A) AND B) OR (B AND BIN) OR (BIN AND (NOT A));

end Behavioral;

