library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Synchronus_3bit_Counter_vhdl is
    Port ( RST,CLK,UP : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR(2 DOWNTO 0));
end Synchronus_3bit_Counter_vhdl;

architecture Behavioral of Synchronus_3bit_Counter_vhdl is

signal zint:  STD_LOGIC_VECTOR( 2 downto 0 ):="000" ; 
begin
  Z<= std_logic_vector(zint);   
  process (CLK)
  begin
    if (CLK'EVENT AND CLK='1') then
      if RST ='1' then                    
        zint <= "000" ;              
		elsif (UP='1') then
        zint <= zint+1;
      else
        zint <= zint-1;
      end if;
    end if;
  end process;
end Behavioral;