-- Copyright 2008-2010 Manuel Rábade <manuel@rabade.net>

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
  
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
  
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIR is port (
	CLK: in STD_LOGIC;
	ROM: in STD_LOGIC_VECTOR(29 downto 0);
	DECODE: out STD_LOGIC;
	AMUX: out STD_LOGIC;
	COND: out STD_LOGIC_VECTOR(1 downto 0);
	ALU: out STD_LOGIC_VECTOR(1 downto 0);
	SH: out STD_LOGIC_VECTOR(1 downto 0);
	MBR: out STD_LOGIC;
	MAR: out STD_LOGIC;
	RD: out STD_LOGIC;
	WR: out STD_LOGIC;
	ENC: out STD_LOGIC;
	C: out STD_LOGIC_VECTOR(2 downto 0);
	B: out STD_LOGIC_VECTOR(2 downto 0);
	A: out STD_LOGIC_VECTOR(2 downto 0);
	ADDR: out STD_LOGIC_VECTOR(7 downto 0));
end MIR;

architecture Behavioral of MIR is
begin
	process (CLK, ROM) begin
		if (CLK'EVENT and CLK='1') then
		    DECODE 	<= ROM(29); 
		    AMUX 	<= ROM(28); 
			COND	<= ROM(27 downto 26); 
			ALU 	<= ROM(25 downto 24);
			SH	 	<= ROM(23 downto 22);
			MBR 	<= ROM(21);
			MAR 	<= ROM(20);
			RD	 	<= ROM(19);
			WR	 	<= ROM(18);
			ENC 	<= ROM(17);
			C	 	<= ROM(16 downto 14);
			B	 	<= ROM(13 downto 11);
			A	 	<= ROM(10 downto 8);
			ADDR 	<= ROM(7 downto 0);
		end if;
	end process;
end Behavioral;
