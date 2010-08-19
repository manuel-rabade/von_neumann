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

entity BFR is port(
	CLK: in STD_LOGIC;
	BIN: in STD_LOGIC_VECTOR(7 downto 0);
	BOUT: out STD_LOGIC_VECTOR(7 downto 0));
end BFR;

architecture Behavioral of BFR is
begin
	process (CLK, BIN)
	begin
		if (CLK'EVENT and CLK='1') then
			BOUT <= BIN;
		end if;
	end process;
end Behavioral;

