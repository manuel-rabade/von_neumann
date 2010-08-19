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

entity MMUX is port(
	SEL: in STD_LOGIC;
	DECODE: in STD_LOGIC;
	MIR: in STD_LOGIC_VECTOR(7 downto 0);
	DATA: in STD_LOGIC_VECTOR(7 downto 0);
	INC: in STD_LOGIC_VECTOR(7 downto 0);
	MPC: out STD_LOGIC_VECTOR(7 downto 0));
end MMUX;

architecture Behavioral of MMUX is
begin
	process (SEL, DECODE, MIR, INC, DATA) begin
		if (DECODE = '1') then
			MPC <= DATA;
		else 
			if (SEL = '1') then
				MPC <= MIR;
			else
				MPC <= INC;
			end if;
		end if;
	end process;
end Behavioral;


