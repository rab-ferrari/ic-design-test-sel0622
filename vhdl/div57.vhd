-- Descricao divisor 5/7 em VHDL
-- Caminho critico do circuito otimizado: 1,4ns (ou 1,5ns)
--
-- ENTRADAS:
--		CLK : sinal de clock (circuito sincrono)
--		MC  : sinal de controle - 
--				MC = 0 --> conta 5
--				MC = 1 --> conta 7
--		S	: sinal negativo de reset
--				S = 0 --> para a contagem
--
-- SAIDAS:
--		sai : sinal de clock dividido por 5 ou 7
--
-- @author: Rodrigo Ferrari
-- @date  : 10/31/18

entity div57 is
	port (clk : in bit;
		  mc  : in bit;
		  s	  : in bit;
		  sai : out bit
		  );
end div57;

architecture INTERFACE of div57 is
	-- definicao dos estados
	type state_type is (s000, s001, s010, s011, s100, s101, s110, s111);
	signal present_state, next_state : state_type;
begin
	-- processo de atualizacao do estado
	update : process (clk, s)
	begin
		-- sinal de reset
		-- se nao for usado, comentar as duas linhas abaixo
		-- e trocar o 'elsif' da terceira linha por 'if'
		if s = '0' then
			present_state <= s000;
		elsif clk'event and clk = '1' then
			present_state <= next_state;
		end if;
	end process;
	
	-- processo que calcula as transicoes e a saida 'sai'
	transitions : process (present_state, mc)
	begin
		case present_state is
			when s000 =>
				sai <= '0';
				next_state <= s001;
			
			when s001 =>
				sai <= '0';
				next_state <= s011;
			
			when s010 =>
				sai <= '1';
				next_state <= s110;
			
			when s011 =>
				sai <= '1';
				next_state <= s010;
			
			when s101 =>
				sai <= '0';
				next_state <= s000;
			
			when s110 =>
				sai <= '1';
				if (mc = '0') then
					next_state <= s000;
				else
					next_state <= s111;
				end if;
			
			when s111 =>
				sai <= '1';
				next_state <= s101;
			
			-- estado nao usado
			when s100 =>
				sai <= '0';
				next_state <= s110;
				
		end case;
	end process;
end INTERFACE;
