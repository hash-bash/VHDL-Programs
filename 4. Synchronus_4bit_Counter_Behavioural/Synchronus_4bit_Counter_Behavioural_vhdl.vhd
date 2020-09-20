----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:50:55 10/08/2019 
-- Design Name: 
-- Module Name:    Synchronus_4bit_Counter_Behavioural_vhdl - Behavioral 
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

entity Synchronus_4bit_Counter_Behavioural_vhdl is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (4 downto 0));
end Synchronus_4bit_Counter_Behavioural_vhdl;

architecture Behavioral of Synchronus_4bit_Counter_Behavioural_vhdl is

begin


end Behavioral;

