----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:38:35 10/08/2019 
-- Design Name: 
-- Module Name:    MUX4_1D_VHDL - Behavioral 
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

entity MUX4_1D_VHDL is
    Port ( X : in  STD_LOGIC;
          Y : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end MUX4_1D_VHDL;

architecture Behavioral of MUX4_1D_VHDL is

begin

Z <= ((not x) and (not y) and A) or
            ((not x) and y and B) or
            (x and (not y) and C) or
            (x and y and D);

end Behavioral;

