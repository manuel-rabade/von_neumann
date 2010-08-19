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

entity ALU is port(
	CTRL: in STD_LOGIC_VECTOR(1 downto 0);
	N: out STD_LOGIC;
	Z: out STD_LOGIC;
	A: in STD_LOGIC_VECTOR(7 downto 0);
	B: in STD_LOGIC_VECTOR(7 downto 0);
	C: out STD_LOGIC_VECTOR(7 downto 0));
end ALU;

architecture Behavioral of ALU is
signal tmp: STD_LOGIC_VECTOR(7 downto 0);
begin
	process (CTRL, A, B)
	begin
		case CTRL is
			when "00" =>
				tmp <= A + B;
				case tmp is
					when "00000000" => Z <= '1';
					when others => Z <= '0';
				end case;
				if (tmp(7) = '1') then
					N <= '1';
				else
					N <= '0';
				end if;
			when "01" =>
				tmp <= A and B;
				case tmp is
					when "00000000" => Z <= '1';
					when others => Z <= '0';
				end case;
				if (tmp(7) = '1')then
					N <= '1';
				else
					N <= '0';
				end if;
			when "10" =>
				tmp <= A;
				case tmp is
					when "00000000" => Z <= '1';
					when others => Z <= '0';
				end case;
				if (tmp(7) = '1')then
					N <= '1';
				else
					N <= '0';
				end if;
			when "11" =>
				tmp <= not A;
				case tmp is
					when "00000000" => Z <= '1';
					when others => Z <= '0';
				end case;
				if (tmp(7) = '1') then
					N <= '1';
				else
					N <= '0';
				end if;
			when others =>
				tmp <= A;
				N <= '0';
				Z <= '0';
		end case;
		C <= tmp;
	end process;
end Behavioral;
