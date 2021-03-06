--CONCATENADOR 8 BITS
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity concat2 is
	generic ( n: integer:=8);--<-- nbits
	port (
		A7,A6,A5,A4,A3,A2,A1,A0: in std_logic;
		Q : out std_logic_vector(n-1 downto 0));
end concat2;

--Architecture
architecture solve of concat2 is
begin
		Q<= A7 & A6 & A5 & A4 & A3 & A2 & A1 & A0;
end solve;