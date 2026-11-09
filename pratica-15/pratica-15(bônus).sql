-- faturamento de cada unidade, com o nome da unidade
SELECT u.nome, SUM(ip.quantidade * pr.preco) AS faturamento 
FROM pedido p 
INNER JOIN unidade u ON p.unidade_codigo = u.codigo 
INNER JOIN item_pedido ip ON p.numero = ip.pedido_numero 
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo 
GROUP BY u.nome;
