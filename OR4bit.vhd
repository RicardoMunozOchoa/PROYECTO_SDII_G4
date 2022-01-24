--OR DE VECTORES DE 4 BITS
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity OR4bit is
	port (
		A,B,C,D: in std_logic_vector(3 downto 0);
		Q3,Q2,Q1,Q0 : out std_logic);
end OR4bit;

--Architecture
architecture solve of OR4bit is
begin
		Q3<=A(3) or B(3) or C(3) or D(3);
		Q2<=A(2) or B(2) or C(2) or D(2);
		Q1<=A(1) or B(1) or C(1) or D(1);
		Q0<=A(0) or B(0) or C(0) or D(0);
end solve;