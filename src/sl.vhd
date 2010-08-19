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

entity SL is port (
	COND: in STD_LOGIC_VECTOR(1 downto 0);
	N: in STD_LOGIC;
	Z: in STD_LOGIC;
	SEL: out STD_LOGIC);
end SL;

architecture Behavioral of SL is
begin
	process (COND, N, Z)
	begin
		case COND is
			when "00" => SEL <= '0';
			when "01" =>
				if(N = '0')then
					SEL <= '0';
				else
					SEL <= '1';
				end if;
			when "10" =>
				if(Z = '0')then
					SEL <= '0';
				else
					SEL <= '1';
				end if;
			when "11" => SEL <= '1';
			when others => SEL <= '0';
		end case;
	end process;
end Behavioral;


