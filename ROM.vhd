--ROM
--GRUPO4 ADRIANA PONCE Y RICARDO MUÑOZ
--GRUPO 4 P102
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

--Entity
entity ROM is 
	generic(n: integer:=19;-- n-bits per data
	m: integer:=8); -- m-bits of addresses
	port(
		clk,oe: in std_logic; 
		addr : in std_logic_vector(m-1 downto 0); 
		Dout : out std_logic_vector(n-1 downto 0)); 
end ROM;

--Architecture
architecture solve of ROM is
	-- Signals,Constants,Variables,Components	
	type rom_type is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0); 
	signal tmp_rom: rom_type; 
	begin
	--Process #1:
Tmp_rom(conv_integer(1))<="0100101010001000110";
Tmp_rom(conv_integer(2))<="1100101010001000110";
Tmp_rom(conv_integer(3))<="0100101010001000110";
Tmp_rom(conv_integer(4))<="1100101010001000110";
Tmp_rom(conv_integer(5))<="0100101010001000110";
Tmp_rom(conv_integer(6))<="1100101010001111110";
Tmp_rom(conv_integer(7))<="0100101010001000110";
Tmp_rom(conv_integer(8))<="1100101010001000110";
Tmp_rom(conv_integer(9))<="0100101010001000110";
Tmp_rom(conv_integer(10))<="0100101010001000110";
Tmp_rom(conv_integer(11))<="0100101010001000110";
Tmp_rom(conv_integer(12))<="1100110011010100000";
Tmp_rom(conv_integer(13))<="0100011001111111011";
Tmp_rom(conv_integer(14))<="0000010010000000101";
Tmp_rom(conv_integer(15))<="1011111010110101110";
Tmp_rom(conv_integer(16))<="0100011001111111011";
Tmp_rom(conv_integer(17))<="0000010010000000101";
Tmp_rom(conv_integer(18))<="0101010101111111000";
Tmp_rom(conv_integer(19))<="0011100000000000000";
Tmp_rom(conv_integer(20))<="0000010010000000101";
Tmp_rom(conv_integer(21))<="0011111000000000000";
Tmp_rom(conv_integer(22))<="1100110011010100001";
Tmp_rom(conv_integer(23))<="0011111110000000000";
Tmp_rom(conv_integer(24))<="0000010010000000100";
Tmp_rom(conv_integer(25))<="0011111111100000000";
Tmp_rom(conv_integer(26))<="0011000000000000000";
Tmp_rom(conv_integer(27))<="0000010010000000101";
Tmp_rom(conv_integer(28))<="0000010010001110100";
Tmp_rom(conv_integer(29))<="0100011001111111010";
Tmp_rom(conv_integer(30))<="0100011001111111010";
Tmp_rom(conv_integer(31))<="0101010101111111000";
Tmp_rom(conv_integer(32))<="0000010010000000100";
Tmp_rom(conv_integer(33))<="1100110011010100010";
Tmp_rom(conv_integer(34))<="1001000100101010000";
Tmp_rom(conv_integer(35))<="1011111010110101101";
Tmp_rom(conv_integer(36))<="0000010010000000101";
Tmp_rom(conv_integer(37))<="1101110101000011111";
Tmp_rom(conv_integer(38))<="0000010010000000101";
Tmp_rom(conv_integer(39))<="1001000100101010010";
Tmp_rom(conv_integer(40))<="0101010101111111000";
Tmp_rom(conv_integer(41))<="1011111010100101100";
Tmp_rom(conv_integer(42))<="0000010010000000101";
Tmp_rom(conv_integer(43))<="1100110011010100010";
Tmp_rom(conv_integer(44))<="1001000100101010001";
Tmp_rom(conv_integer(45))<="0000010010000000101";
Tmp_rom(conv_integer(46))<="0000010010000000100";
Tmp_rom(conv_integer(47))<="0100011001111111000";
Tmp_rom(conv_integer(48))<="0000010010000000101";
Tmp_rom(conv_integer(49))<="1100110011010100010";
Tmp_rom(conv_integer(50))<="0000010010000000101";
Tmp_rom(conv_integer(51))<="1100110011010100001";
Tmp_rom(conv_integer(52))<="1001000100101010001";
Tmp_rom(conv_integer(53))<="0100011001111111010";
Tmp_rom(conv_integer(54))<="0101010101111111000";
Tmp_rom(conv_integer(55))<="1100110011010100001";
Tmp_rom(conv_integer(56))<="1011111010111101100";
Tmp_rom(conv_integer(57))<="0100011001111111000";
Tmp_rom(conv_integer(58))<="1011111010110001101";
Tmp_rom(conv_integer(59))<="0100011001111111010";
Tmp_rom(conv_integer(60))<="0100011001111111011";
Tmp_rom(conv_integer(61))<="1101110101000011100";
Tmp_rom(conv_integer(62))<="0000010010000000101";
Tmp_rom(conv_integer(63))<="1100110011010100000";
Tmp_rom(conv_integer(64))<="1101110101000011111";
Tmp_rom(conv_integer(65))<="0100011001111111010";
Tmp_rom(conv_integer(66))<="1101110101001011101";
Tmp_rom(conv_integer(67))<="1001000100101010000";
Tmp_rom(conv_integer(68))<="0101010101111111000";
Tmp_rom(conv_integer(69))<="0000010010000000101";
Tmp_rom(conv_integer(70))<="0000010010000000101";
Tmp_rom(conv_integer(71))<="0000010010000000101";
Tmp_rom(conv_integer(72))<="0000010010000000101";
Tmp_rom(conv_integer(73))<="1100110011010100010";
Tmp_rom(conv_integer(74))<="1101110101001011100";
Tmp_rom(conv_integer(75))<="0100011001111111001";
Tmp_rom(conv_integer(76))<="0100011001111111000";
Tmp_rom(conv_integer(77))<="0100011001111111010";
Tmp_rom(conv_integer(78))<="0100011001111111010";
Tmp_rom(conv_integer(79))<="0101010101111111000";
Tmp_rom(conv_integer(80))<="0100011001111111010";
Tmp_rom(conv_integer(81))<="1101110101000011101";
Tmp_rom(conv_integer(82))<="1101110101000011100";
Tmp_rom(conv_integer(83))<="0000010010000000101";
Tmp_rom(conv_integer(84))<="0100011001111111010";
Tmp_rom(conv_integer(85))<="1100110011010100010";
Tmp_rom(conv_integer(86))<="1101110101000011100";
Tmp_rom(conv_integer(87))<="0000010010000000110";
Tmp_rom(conv_integer(88))<="0100011001111111010";
Tmp_rom(conv_integer(89))<="0100011001111111000";
Tmp_rom(conv_integer(90))<="0100011001111111000";
Tmp_rom(conv_integer(91))<="1011111010110101101";
Tmp_rom(conv_integer(92))<="0100011001111111010";
Tmp_rom(conv_integer(93))<="0100011001111111010";
Tmp_rom(conv_integer(94))<="0100011001111111010";
Tmp_rom(conv_integer(95))<="0100011001111111010";
Tmp_rom(conv_integer(96))<="1011111010101101110";
Tmp_rom(conv_integer(97))<="1100110011010100010";
Tmp_rom(conv_integer(98))<="0100011001111111000";
Tmp_rom(conv_integer(99))<="1111111111111111111";
Tmp_rom(conv_integer(100))<="0000000000000000000";
Tmp_rom(conv_integer(101))<="0000000000000000000";
Tmp_rom(conv_integer(102))<="0000000000000000000";
Tmp_rom(conv_integer(103))<="0000000000000000000";
Tmp_rom(conv_integer(104))<="0000000000000000000";
Tmp_rom(conv_integer(105))<="0000000000000000000";
Tmp_rom(conv_integer(106))<="0000000000000000000";
Tmp_rom(conv_integer(107))<="0000000000000000000";
Tmp_rom(conv_integer(108))<="0000000000000000000";
Tmp_rom(conv_integer(109))<="0000000000000000000";
Tmp_rom(conv_integer(110))<="0000000000000000000";
Tmp_rom(conv_integer(111))<="0000000000000000000";
Tmp_rom(conv_integer(112))<="0000000000000000000";
Tmp_rom(conv_integer(113))<="0000000000000000000";
Tmp_rom(conv_integer(114))<="0000000000000000000";
Tmp_rom(conv_integer(115))<="0000000000000000000";
Tmp_rom(conv_integer(116))<="0000000000000000000";
Tmp_rom(conv_integer(117))<="0000000000000000000";
Tmp_rom(conv_integer(118))<="0000000000000000000";
Tmp_rom(conv_integer(119))<="0000000000000000000";
Tmp_rom(conv_integer(120))<="0000000000000000000";
Tmp_rom(conv_integer(121))<="0000000000000000000";
Tmp_rom(conv_integer(122))<="0000000000000000000";
Tmp_rom(conv_integer(123))<="0000000000000000000";
Tmp_rom(conv_integer(124))<="0000000000000000000";
Tmp_rom(conv_integer(125))<="0000000000000000000";
Tmp_rom(conv_integer(126))<="0000000000000000000";
Tmp_rom(conv_integer(127))<="0000000000000000000";
Tmp_rom(conv_integer(128))<="0000000000000000000";
Tmp_rom(conv_integer(129))<="0000000000000000000";
Tmp_rom(conv_integer(130))<="0000000000000000000";
Tmp_rom(conv_integer(131))<="0000000000000000000";
Tmp_rom(conv_integer(132))<="0000000000000000000";
Tmp_rom(conv_integer(133))<="0000000000000000000";
Tmp_rom(conv_integer(134))<="0000000000000000000";
Tmp_rom(conv_integer(135))<="0000000000000000000";
Tmp_rom(conv_integer(136))<="0000000000000000000";
Tmp_rom(conv_integer(137))<="0000000000000000000";
Tmp_rom(conv_integer(138))<="0000000000000000000";
Tmp_rom(conv_integer(139))<="0000000000000000000";
Tmp_rom(conv_integer(140))<="0000000000000000000";
Tmp_rom(conv_integer(141))<="0000000000000000000";
Tmp_rom(conv_integer(142))<="0000000000000000000";
Tmp_rom(conv_integer(143))<="0000000000000000000";
Tmp_rom(conv_integer(144))<="0000000000000000000";
Tmp_rom(conv_integer(145))<="0000000000000000000";
Tmp_rom(conv_integer(146))<="0000000000000000000";
Tmp_rom(conv_integer(147))<="0000000000000000000";
Tmp_rom(conv_integer(148))<="0000000000000000000";
Tmp_rom(conv_integer(149))<="0000000000000000000";
Tmp_rom(conv_integer(150))<="0000000000000000000";
Tmp_rom(conv_integer(151))<="0000000000000000000";
Tmp_rom(conv_integer(152))<="0000000000000000000";
Tmp_rom(conv_integer(153))<="0000000000000000000";
Tmp_rom(conv_integer(154))<="0000000000000000000";


	process(clk,oe)
	--Sequential programming
		begin 
			if (clk'event and clk='1') then 
				if oe='0' then --write
					Dout<= tmp_rom(conv_integer(addr));--read
				else Dout<=(others => '0');
				end if; 
			end if; 
	end process; 
	--Process #n...
end solve;
