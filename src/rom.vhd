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

entity ROM is port (
	ADDR: in STD_LOGIC_VECTOR(7 downto 0);
	DATA: out STD_LOGIC_VECTOR(29 downto 0));
end ROM;

architecture Behavioral of ROM is
begin
	process (ADDR) 
	begin
	  case ADDR is 
									  -- 987654321098765432109876543210
									  -- ||--++==|||||---|||---||||||||
			when "00000000" =>  DATA <= "001100000000000000000000000001";
			when "00000001" =>	DATA <= "000000000110000000000000000000"; -- fetch: MAR <- PC, RD <- 1
			when "00000010" =>	DATA <= "100000000000000000000000000000"; -- decode: MPC <- MBR
									  -- LDA #
									  -- ||--++==|||||---|||---||||||||
			when "00010000" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "00010001" =>	DATA <= "000000000110000000000000000000"; -- MAR <- PC, RD <- 1
			when "00010010" =>	DATA <= "010010000000110000000000000000"; -- A <- MBR
			when "00010011" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "00010100" =>  DATA <= "001100000000000000000000000001"; -- regreso a fetch/decode
									  -- SUMA #
									  -- ||--++==|||||---|||---||||||||
			when "00100000" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "00100001" =>	DATA <= "000000000110000000000000000000"; -- MAR <- PC, RD <- 1
			when "00100010" =>	DATA <= "010010000000111100000000000000"; -- D <- MBR
			when "00100011" =>	DATA <= "000000000000110011110000000000"; -- A <- A + D
			when "00100100" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "00100101" =>  DATA <= "001100000000000000000000000001"; -- regreso a fetch/decode	
									  -- BNZ
									  -- ||--++==|||||---|||---||||||||
			when "00110000" =>  DATA <= "001010000000000000010000110101"; -- MPC <- 00110101 ? Z
			when "00110001" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "00110010" =>	DATA <= "000000000110000000000000000000"; -- MAR <- PC, RD <- 1
			when "00110011" =>	DATA <= "010010000000100000000000000000"; -- PC <- MBR
			when "00110100" =>  DATA <= "001100000000000000000000000001"; -- regreso a fetch/decode	
			when "00110101" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "00110110" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "00110111" =>  DATA <= "001100000000000000000000000001"; -- regreso a fetch/decode	
									  -- SHA
									  -- ||--++==|||||---|||---||||||||
			when "01000000" =>	DATA <= "000010010000110000010000000000"; -- A <- A / 2
			when "01000001" =>  DATA <= "000000000000100001100000000000"; -- PC <- PC + 1
			when "01000010" =>  DATA <= "001100000000000000000000000001"; -- regreso a fetch/decode	
									  -- secuencia de prueba
									  -- ||--++==|||||---|||---||||||||
--			when "00000001" =>  DATA <= "001100000000000000000011110000"; -- PC <- 11110000
--			when "11110000" =>  DATA <= "000000000000110001110000000000"; -- B <- +1, A <- RA, C <- A + B, RA <- C
--			when "11110001" =>  DATA <= "000010001101000011010000000000"; -- B <- RC, A <- RA, C <- A, RA <- C, MAR <- 1, MBR <- 1, WR <- 1
--			when "11110010" =>  DATA <= "001100000000000000000011110000"; -- PC <- 11111000
									  -- ||--++==|||||---|||---||||||||
			when others =>		DATA <= "001100000000000000000000000000"; 
		end case;
	end process; 
end Behavioral;

