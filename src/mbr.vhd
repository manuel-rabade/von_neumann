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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MBR is port(
	CLK: in STD_LOGIC;
	EN: in STD_LOGIC;
	DIN: in STD_LOGIC_VECTOR(7 downto 0);
	DOUT: out STD_LOGIC_VECTOR(7 downto 0);
	MIN: in STD_LOGIC_VECTOR(7 downto 0);
	MOUT: out STD_LOGIC_VECTOR(7 downto 0));
end MBR;

architecture Behavioral of MBR is
begin
	process (CLK, EN, DIN, MIN)
	begin
		if (CLK'EVENT and CLK='1') then
			if (EN = '1') then
				MOUT <= DIN;
			end if;
			DOUT <= MIN;
		end if;
	end process;
end Behavioral;

