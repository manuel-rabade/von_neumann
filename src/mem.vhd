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

entity MEM is port (
	RD: in STD_LOGIC;
	WR: in STD_LOGIC;
	ADDR: in STD_LOGIC_VECTOR(7 downto 0);
	DIN: in STD_LOGIC_VECTOR(7 downto 0);
	DOUT: out STD_LOGIC_VECTOR(7 downto 0));
end MEM;

architecture Behavioral of MEM is
signal flash : STD_LOGIC_VECTOR(7 downto 0);
begin
	process (RD, WR, ADDR, DIN) 
	begin
		if (WR = '1') then
			flash <= DIN;
		end if;
		if (RD = '1') then
			case ADDR is 
				when "00000000" =>  DOUT <= "00010000"; -- lda
				when "00000001" =>  DOUT <= "11001001"; -- 226
				when "00000010" =>  DOUT <= "00100000"; -- suma
				when "00000011" =>  DOUT <= "00000101"; -- 5
				when "00000100" =>  DOUT <= "00110000"; -- bnz
				when "00000101" =>  DOUT <= "00000010";	-- 2
				when "00000110" =>  DOUT <= "00010000"; -- lda
				when "00000111" =>  DOUT <= "00001010"; -- 10
				when "00001000" =>  DOUT <= "01000000"; -- sha
				when "00001001" =>  DOUT <= "00110000"; -- bnz 
				when "00001010" =>  DOUT <= "00001000"; -- 8
				when others =>		DOUT <= "11111111"; 
			end case;
		end if;
	end process; 
end Behavioral;

