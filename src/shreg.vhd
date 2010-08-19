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

entity SHREG is port(
	CTRL: in STD_LOGIC_VECTOR(1 downto 0);
	RIN: in STD_LOGIC_VECTOR(7 downto 0);
	ROUT: out STD_LOGIC_VECTOR(7 downto 0));
end SHREG;

architecture Behavioral of SHREG is
signal tmp: STD_LOGIC_VECTOR(7 downto 0);
begin
	process (CTRL, RIN)
	begin
		case CTRL is
			when "00" => tmp <= RIN;
			when "01" =>
				tmp(7) <= '0';
				tmp(6 downto 0) <= RIN(7 downto 1);
			when "10" =>
				tmp(0) <= '0';
				tmp(7 downto 1) <= RIN(6 downto 0);
			when others => tmp <= RIN;
		end case;
		ROUT <= tmp;
	end process;
end Behavioral;

