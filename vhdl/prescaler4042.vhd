-- Descricao do prescaler 40/42 usando blocos
-- divisor 5/7 (dv57) e contador 8 (count8)
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
-- @date  : 11/01/18
library work;

entity prescaler4042 is
	port (clk : in bit;
		  sm  : in bit;
		  sai : out bit
		 );
end prescaler4042;

architecture INTERFACE of prescaler4042 is
	-- sinais de conexao entre os componentes
	signal mc, clkcount: bit;
	
begin
	c1: entity work.div57  port map (clk => clk, mc => mc, s => '1', sai => clkcount);
	c2: entity work.count8 port map (clk => clkcount, sm => sm, mc => mc, sai8 => sai);
end INTERFACE;
