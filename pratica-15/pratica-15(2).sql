-- pergunta 5: Quais produtos nunca foram vendidos?
SELECT pr.nome 
FROM produto pr 
LEFT JOIN item_pedido ip ON pr.codigo = ip.produto_codigo 
WHERE ip.produto_codigo IS NULL;

-- pergunta 6: Quais clientes não fizeram nenhum pedido?
SELECT c.nome 
FROM cliente c 
LEFT JOIN pedido p ON c.codigo = p.cliente_codigo 
WHERE p.numero IS NULL;

-- pergunta 7: Quais produtos têm preço de tabela acima da média?
SELECT nome, preco 
FROM produto 
WHERE preco > (SELECT AVG(preco) FROM produto);

-- pergunta 8: Qual a média de pedidos por unidade?
SELECT AVG(t.total_pedidos) AS media_pedidos_unidade 
FROM (
    SELECT unidade_codigo, COUNT(numero) AS total_pedidos 
    FROM pedido 
    GROUP BY unidade_codigo
) AS t;
