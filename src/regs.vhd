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

entity REGS is port (
	CLK: in STD_LOGIC;
	SELA: in STD_LOGIC_VECTOR (2 downto 0);
	SELB: in STD_LOGIC_VECTOR (2 downto 0);
	SELC: in STD_LOGIC_VECTOR (2 downto 0);
	ENC: in STD_LOGIC;
	C: in STD_LOGIC_VECTOR (7 downto 0);
	A: out STD_LOGIC_VECTOR (7 downto 0);
	B: out STD_LOGIC_VECTOR (7 downto 0));
end REGS;

architecture Behavioral of REGS is
signal pc, sp, ra, rb, rc, rd, tmp: STD_LOGIC_VECTOR (7 downto 0);
begin
	process (CLK, SELA, SELB, SELC, ENC, C) begin
		if (CLK'EVENT and CLK = '1') then
			if (ENC = '1') then
				case SELC is
					when "000" => pc <= C;
					when "001" => sp <= C;
					when "100" => ra <= C;
					when "101" => rb <= C;
					when "110" => rc <= C;
					when "111" => rd <= C;
					when others => tmp <= C;
				end case;
			end if;
		end if;
		case SELA is
				when "000" => A <= pc;
				when "001" => A <= sp;
				when "010" => A <= "00000000";
				when "011" => A <= "00000001";
				when "100" => A <= ra;
				when "101" => A <= rb;
				when "110" => A <= rc;
				when "111" => A <= rd;
				when others => A <= "00000000";
		end case;
		case SELB is
				when "000" => B <= pc;
				when "001" => B <= sp;
				when "010" => B <= "00000000";
				when "011" => B <= "00000001";
				when "100" => B <= ra;
				when "101" => B <= rb;
				when "110" => B <= rc;
				when "111" => B <= rd;
				when others => B <= "00000000";
		end case;
	end process;
end Behavioral;
