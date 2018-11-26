-- Copyright (c) 2006 - 2011 Projeto de C.Is Digitais II Corp. All Rights Reserved.
library ieee ;
use IEEE.std_logic_1164.all, IEEE.Numeric_STD.all;
entity contador is
	port (clk: in bit;
		  reset : in bit;
		  count1: out integer range 0 to 28;
		  clkdiv: out bit
		 );
end contador;

architecture proc of contador is
	signal count: integer range 0 to 28;

begin
	process(clk, count)
	begin
		if (clk'event and clk='1') then
			if ((reset = '1') or (count = 28)) then count <= 0;
			else count <= count + 1;
			end if;
		end if;
	
		count1 <= count;
		if (count < 16) then clkdiv <= '0';
		else clkdiv <= '1';
		end if;
		
	end process;
end architecture proc;