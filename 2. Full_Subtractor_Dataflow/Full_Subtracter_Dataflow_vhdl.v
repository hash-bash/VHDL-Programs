----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:39:13 10/05/2019 
-- Design Name: 
-- Module Name:    Full_Adder_Dataflow_vhdl - Behavioral 
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

entity Full_Adder_Dataflow_vhdl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Full_Adder_Dataflow_vhdl;

architecture Behavioral of Full_Adder_Dataflow_vhdl is

begin

	SUM <= A XOR (B XOR CIN);
	COUT <= (A AND B) OR (B AND CIN) OR (CIN AND A);

end Behavioral;

