/* Prática 13 – Lanchonete – perguntas ao banco */
USE lanchonete;

-- pergunta 1: Nome e preço de tabela dos produtos, com o preço chamado preco_rs.
SELECT nome, preco_tabela AS preco_rs 
FROM produto;

-- pergunta 2: Em quais unidades já houve pedido? Cada código uma vez só.
SELECT DISTINCT unidade_codigo 
FROM pedido;

-- pergunta 3: Quais produtos custam de 12 a 15 reais?
SELECT * 
FROM produto 
WHERE preco_tabela BETWEEN 12.00 AND 15.00;

-- pergunta 4: Quais produtos têm Açaí no começo do nome?
SELECT * 
FROM produto 
WHERE nome LIKE 'Açaí%';

-- pergunta 5: Quais pedidos foram retirados no balcão (sem entregador)?
SELECT * 
FROM pedido 
WHERE entregador_codigo IS NULL;

-- pergunta 6: Quais pedidos são das unidades 1 e 3?
SELECT * 
FROM pedido 
WHERE unidade_codigo IN (1, 3);

-- pergunta 7: Quais são os 3 produtos disponíveis mais caros?
SELECT * 
FROM produto 
WHERE disponivel = TRUE 
ORDER BY preco_tabela DESC 
LIMIT 3;

-- pergunta 8: Os pedidos, do mais recente para o mais antigo.
SELECT * 
FROM pedido 
ORDER BY data_hora DESC;

-- pergunta Extra: os itens com quantidade 2 ou mais, do maior preço cobrado para o menor.
SELECT * 
FROM item_pedido 
WHERE quantidade >= 2 
ORDER BY preco_cobrado DESC;
