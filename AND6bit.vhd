--AND CONCATENADOR DE 6 BITS
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity AND6bit is
	port (
		in5,in4,in3,in2,in1,in0,s : in std_logic;
		A: out std_logic_vector(5 downto 0));
end AND6bit;

--Architecture
architecture solve of AND6bit is
begin
process(s)
begin
		if s='1' then
		   A<=in5 & in4 & in3 & in2 & in1 & in0;
	   else A<=(others =>'0'); end if;
end process;
end solve;