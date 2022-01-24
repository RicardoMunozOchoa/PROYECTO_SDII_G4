--AND CONCATENADOR 7 BITS
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity AND7bit is
	port (
		in6,in5,in4,in3,in2,in1,in0,s : in std_logic;
		A: out std_logic_vector(6 downto 0));
end AND7bit;

--Architecture
architecture solve of AND7bit is
begin
process(s)
begin
		if s='1' then
		   A<=in6 & in5 & in4 & in3 & in2 & in1 & in0;
	   else A<=(others =>'0'); end if;
end process;
end solve;