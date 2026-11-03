SELECT COUNT(*) AS total_pedidos 
FROM pedido;

SELECT SUM(quantidade) AS total_unidades_vendidas 
FROM item_pedido;

SELECT ROUND(AVG(preco_cobrado), 2) AS preco_medio, MAX(preco_cobrado) AS maior_preco 
FROM item_pedido;

SELECT unidade_codigo, COUNT(*) AS quantidade_pedidos 
FROM pedido 
GROUP BY unidade_codigo 
ORDER BY quantidade_pedidos DESC;
