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

entity count8 is
	port (clk  : in bit;
		  sm   : in bit;
		  mc   : out bit;
		  sai8 : out bit
		  );
end count8;

architecture INTERFACE of count8 is
	signal xuxa: bit_vector (2 downto 0);

begin
	-- saidas
	mc <= sm and (not xuxa(0)) and (not xuxa(1)) and (not xuxa(2));
	sai8 <= xuxa(2);
	
	update0 : process(clk)
	begin
		if clk'event and clk='1' then
			xuxa(0) <= not xuxa(0);
		end if;
	end process;
	
	update1 : process(xuxa(0))
	begin
		if xuxa(0)'event and xuxa(0)='1' then
			xuxa(1) <= not xuxa(1);
		end if;
	end process;
	
	update2 : process(xuxa(1))
	begin
		if xuxa(1)'event and xuxa(1)='1' then
			xuxa(2) <= not xuxa(2);
		end if;
	end process;
	
	
end INTERFACE;