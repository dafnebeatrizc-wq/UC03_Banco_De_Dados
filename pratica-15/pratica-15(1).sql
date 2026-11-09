-- pergunta 1: O número de cada pedido e o nome do cliente.
SELECT p.numero, c.nome 
FROM pedido p 
INNER JOIN cliente c ON p.cliente_codigo = c.codigo;

-- pergunta 2: Os pedidos da unidade Ponta Verde (mostre o nome da unidade).
SELECT p.numero, u.nome 
FROM pedido p 
INNER JOIN unidade u ON p.unidade_codigo = u.codigo 
WHERE u.nome = 'Ponta Verde';

-- pergunta 3: Os itens do pedido 4: data, nome do produto e quantidade.
SELECT p.data, pr.nome, ip.quantidade 
FROM item_pedido ip 
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo 
INNER JOIN pedido p ON ip.pedido_numero = p.numero 
WHERE p.numero = 4;

-- pergunta 4: Unidades vendidas de cada produto, com o nome, da mais vendida.
SELECT pr.nome, SUM(ip.quantidade) AS total_vendido 
FROM item_pedido ip 
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo 
GROUP BY pr.nome 
ORDER BY total_vendido DESC;
