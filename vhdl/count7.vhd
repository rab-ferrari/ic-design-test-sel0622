-- Descricao contador 8 (ASSINCRONO) em VHDL
--
-- ENTRADAS:
--		CLK : sinal de clock (circuito sincrono)
--		SM  : sinal de controle da saida MC
--
-- SAIDAS:
--		SAI : sinal de clock dividido por 8
-- 		MC  : sinal de controle
-- 				SM = 1 e contagem = 0 --> MC = 1
--				c.c.                  --> MC = 0
--
-- @author: Rodrigo Ferrari
-- @date  : 10/31/18

entity count7 is
	port (clk  : in bit;
		  sm   : in bit;
		  mc   : out bit;
		  sai8 : out bit
		  );
end count7;

architecture INTERFACE of count8 is
	-- definicao dos estados possiveis
	type int is range 0 to 7;
	signal count: int;
begin

	-- processo unico para verificacao da contagem
	-- e atualizacao do valor do contador
	update : process (clk)
	begin
		if clk'event and clk = '1' then
			if count < 7 then
				count <= count + 1;
			else
				count <= 0;
			end if;
		end if;
	end process;
	
	outputs : process (clk, count)
	begin
		if count < 4 then
			sai8 <= '0';
		else
			sai8 <= '1';
		end if;
		
		if (count = 0) and (sm = '1') then
			mc <= '0';
		else
			mc <= '1';
		end if;
	end process;
end INTERFACE;