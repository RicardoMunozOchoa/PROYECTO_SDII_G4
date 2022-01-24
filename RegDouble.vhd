--REGISTRO DOBLE SOSTENIMIENTO
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity RegDouble is
	generic ( n: integer :=8);--<-- nbits
	port(
		Clk,resetn,en1,en2,R1,R2: in std_logic;
		d: in std_logic_vector(n-1 downto 0);
		q1: out std_logic_vector(n-1 downto 0);
		q2: out std_logic_vector(n-1 downto 0));
end RegDouble;

--Architecture
architecture solve of RegDouble is
	-- Signals,Constants,Variables,Components
	begin
	--Process #1
	process(resetn,clk)
	--Sequential programming
		begin
			if resetn='0' then
				q1<=(others => '0');
				q2<=(others => '0');
			elsif clk'event and clk='1' then
				if en1='1' then
					q1<=d;
				end if;
				if en2='1' then
					q2<=d;
				end if;
				if R2='1' then
					q2<=(others => '0');
				end if;
				if R1='1' then
					q1<=(others => '0');
				end if;
			end if;
	end process;
	--Process #n...
end solve;