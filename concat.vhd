--CONCATENADOR 19BITS
--GRUPO 4 P102
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity concat is
	generic ( n: integer:=19);--<-- nbits
	port (
		A18,A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0: in std_logic;
		Q : out std_logic_vector(n-1 downto 0));
end concat;

--Architecture
architecture solve of concat is
begin
		Q<= A18 & A17 & A16 & A15 & A14 & A13 & A12 & A11 & A10 & A9 & A8 & A7 & A6 & A5 & A4 & A3 & A2 & A1 & A0;
end solve;