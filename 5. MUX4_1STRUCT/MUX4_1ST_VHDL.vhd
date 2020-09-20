----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:54:12 10/08/2019 
-- Design Name: 
-- Module Name:    MUX4_1ST_VHDL - Behavioral 
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
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AND_GATE is
    Port ( A,B,C : in  STD_LOGIC;
           S : out  STD_LOGIC);
end AND_GATE;

architecture DATAFLOW of AND_GATE is

begin

	S<= A AND B AND C;

end DATAFLOW;

-----------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NOT_GATE is
    Port ( A: in  STD_LOGIC;
           S : out  STD_LOGIC);
end NOT_GATE;

architecture DATAFLOW of NOT_GATE is

begin

	S<= NOT A;

end DATAFLOW;

-----------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OR_GATE is
    Port ( A,B,C,D : in  STD_LOGIC;
           S : out  STD_LOGIC);
end OR_GATE;

architecture DATAFLOW of OR_GATE is

begin

	S<= A OR B OR C OR D;

end DATAFLOW;

-----------------------------------------------------------------------------------------------------------------------------

-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX4_1ST_VHDL is
port ( Sel0,Sel1 : in std_logic;
	A, B, C, D : in std_logic;
	Y : out std_logic );
end MUX4_1ST_VHDL;

architecture Behavioral of MUX4_1ST_VHDL is

component NOT_GATE

 Port ( A: in  STD_LOGIC;
           S : out  STD_LOGIC);

end component;

component AND_GATE

 Port ( A,B,C : in  STD_LOGIC;
           S : out  STD_LOGIC);
end component;

component OR_GATE

 Port ( A,B,C,D : in  STD_LOGIC;
           S : out  STD_LOGIC);

end component;

signal selbar0,selbar1,t1,t2,t3,t4: std_logic;


begin

INV0: NOT_GATE port map (Sel0, selbar1);

INV1: NOT_GATE port map (Sel1, selbar1);

A1: AND_GATE port map (A, selbar0, selbar1, t1);

A2: AND_GATE port map (B, Sel0, selbar1, t2);

A3: AND_GATE port map (C, selbar0, Sel1, t3);

A4: AND_GATE port map (D, Sel0, Sel1, t4);

O1: OR_GATE port map (t1, t2, t3, t4, Y);

end Behavioral;

