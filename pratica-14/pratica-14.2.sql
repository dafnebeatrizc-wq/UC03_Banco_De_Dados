-- Quantas unidades de cada produto foram vendidas, da mais vendida?
SELECT produto_codigo, SUM(quantidade) AS total_vendido 
FROM item_pedido 
GROUP BY produto_codigo 
ORDER BY total_vendido DESC;

-- Quais produtos venderam 3 unidades ou mais?
SELECT produto_codigo, SUM(quantidade) AS total_vendido 
FROM item_pedido 
GROUP BY produto_codigo 
HAVING total_vendido >= 3;

-- Quantos pedidos houve em cada dia (dd/mm)?
SELECT DATE_FORMAT(data_hora, '%d/%m') AS dia, COUNT(*) AS total_pedidos 
FROM pedido 
GROUP BY dia 
ORDER BY MIN(data_hora);

-- A etiqueta do cardápio: NOME EM MAIÚSCULAS – R$ preço (só os disponíveis).
-- (Nota: Ajuste os nomes das colunas de acordo com o seu banco original se forem ligeiramente diferentes)
SELECT CONCAT(UPPER(nome), ' – R$ ', ROUND(preco, 2)) AS etiqueta 
FROM produto 
WHERE disponivel = 1; 
