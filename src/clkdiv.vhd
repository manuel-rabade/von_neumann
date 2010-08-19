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

entity CLKDIV is port(
	CLK: in STD_LOGIC;
	CLK1: out STD_LOGIC;
	CLK2: out STD_LOGIC;
	CLK3: out STD_LOGIC;
	CLK4: out STD_LOGIC);
end CLKDIV;

architecture Behavioral of CLKDIV is
signal int: STD_LOGIC_VECTOR (1 downto 0);
signal tmp: STD_LOGIC_VECTOR (3 downto 0);
begin
	process (CLK)
	begin
		if (CLK'EVENT and CLK='1') then
			int <= int + 1;
			case int is
				when "00" => tmp <= "0001";
				when "01" => tmp <= "0010";
				when "10" => tmp <= "0100";
				when "11" => tmp <= "1000";
				when others => tmp <= "0000";
			end case;
		end if;
		CLK1 <= tmp(0);
		CLK2 <= tmp(1);
		CLK3 <= tmp(2);
		CLK4 <= tmp(3);
	end process;
end Behavioral;
