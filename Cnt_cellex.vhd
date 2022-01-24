--CONTADOR CON CELDA EXTRA
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Cnt_cellex is
	generic ( n: integer :=4);--<------- nbits
	port(
		Clk,resetn,en,ld,cell: in std_logic;
		q: buffer std_logic_vector(n-1 downto 0));
end Cnt_cellex;

architecture solve of Cnt_cellex is
	signal celda: std_logic_vector(n-1 downto 0);
	begin
	process(resetn,clk)
		begin
			if resetn='0' then
				q<="0000000";
			elsif clk'event and clk='1' then
				if ((en='1') and (ld='0')) then
					q<=q+1;
				elsif ((en='1') and (ld='1')) then
					q<=celda;
				end if;
				if cell='1' then celda<=q+1;end if;
			end if;
	end process;
end solve;
