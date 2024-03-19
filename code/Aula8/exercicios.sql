-- Exercícios usando UPDATE e DELETE:

-- 1. Atualize o preço de todos os produtos para aumentar em 10%.
UPDATE produtoszSET preco = preco * 1.1;

-- 2. Atualize o status de todos os pedidos pendentes para "concluído".
UPDATE pedidos SET status = 'concluído' WHERE status = 'pendente';

-- 3. Remova todos os clientes que não fizeram nenhum pedido.
DELETE FROM clientes WHERE id NOT IN (SELECT DISTINCT cliente_id FROM pedidos);

-- 4. Atualize o estoque de todos os produtos com menos de 10 unidades para 20 unidades.
UPDATE produtos SET estoque = 20 WHERE estoque < 10;

-- 5. Remova todos os produtos que não foram vendidos nos últimos 6 meses.
DELETE FROM produtos WHERE id NOT IN (SELECT DISTINCT produto_id FROM itens_pedido WHERE data_venda >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH));

-- 6. Atualize o nome do cliente "João" para "José".
UPDATE clientes SET nome = 'José' WHERE nome = 'João';

-- 7. Remova todos os pedidos cancelados.
DELETE FROM pedidos WHERE status = 'cancelado';

-- 8. Atualize a quantidade de itens vendidos em 20% para todos os pedidos concluídos.
UPDATE itens_pedido SET quantidade = quantidade * 1.2 WHERE pedido_id IN (SELECT id FROM pedidos WHERE status = 'concluído');

-- 9. Remova todos os produtos com preço menor que R$ 10,00.
DELETE FROM produtos WHERE preco < 10.00;

-- 10. Atualize a data de entrega de todos os pedidos para amanhã.
UPDATE pedidos SET data_entrega = DATE_ADD(data_entrega, INTERVAL 1 DAY);

-- Exercícios usando UNION, INTERSECT e EXCEPT:

-- 1. Selecione todos os clientes de São Paulo ou Rio de Janeiro.
SELECT * FROM clientes WHERE cidade = 'São Paulo'
UNION
SELECT * FROM clientes WHERE cidade = 'Rio de Janeiro';

-- 2. Selecione todos os produtos vendidos em janeiro de 2024 ou fevereiro de 2024.
(SELECT * FROM produtos_vendidos WHERE MONTH(data_venda) = 1 AND YEAR(data_venda) = 2024)
UNION
(SELECT * FROM produtos_vendidos WHERE MONTH(data_venda) = 2 AND YEAR(data_venda) = 2024);

-- 3. Selecione todos os clientes que também são funcionários.
SELECT * FROM clientes
INTERSECT
SELECT * FROM funcionarios;

-- 4. Selecione todos os produtos que foram vendidos e também estão em estoque.
SELECT * FROM produtos_vendidos
INTERSECT
SELECT * FROM produtos_em_estoque;

-- 5. Selecione todos os pedidos que não foram entregues.
(SELECT * FROM pedidos)
EXCEPT
(SELECT * FROM pedidos WHERE status = 'entregue');

-- 6. Selecione todos os clientes que não são funcionários.
(SELECT * FROM clientes)
EXCEPT
(SELECT * FROM funcionarios);

-- 7. Selecione todos os produtos que foram vendidos, mesmo que não estejam mais em estoque.
(SELECT * FROM produtos_vendidos)
UNION
(SELECT * FROM produtos_em_estoque);

-- 8. Selecione todos os funcionários que também são clientes.
SELECT * FROM funcionarios
INTERSECT
SELECT * FROM clientes;

-- 9. Selecione todos os pedidos feitos por clientes de São Paulo.
SELECT * FROM pedidos WHERE cliente_id IN (SELECT id FROM clientes WHERE cidade = 'São Paulo');

-- 10. Selecione todos os produtos que nunca foram vendidos.
(SELECT * FROM produtos)
EXCEPT
(SELECT * FROM produtos_vendidos);

-- Exercícios usando UPDATE e DELETE:

-- 1. Atualize o preço de todos os produtos para aumentar em 10%.
UPDATE produtos SET preco = preco * 1.1;

-- 2. Atualize o status de todos os pedidos pendentes para "concluído".
UPDATE pedidos SET status = 'concluído' WHERE status = 'pendente';

-- 3. Remova todos os clientes que não fizeram nenhum pedido.
DELETE FROM clientes WHERE id NOT IN (SELECT DISTINCT cliente_id FROM pedidos);

-- 4. Atualize o estoque de todos os produtos com menos de 10 unidades para 20 unidades.
UPDATE produtos SET estoque = 20 WHERE estoque < 10;

-- 5. Remova todos os produtos que não foram vendidos nos últimos 6 meses.
DELETE FROM produtos WHERE id NOT IN (SELECT DISTINCT produto_id FROM itens_pedido WHERE data_venda >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH));

-- 6. Atualize o nome do cliente "João" para "José".
UPDATE clientes SET nome = 'José' WHERE nome = 'João';

-- 7. Remova todos os pedidos cancelados.
DELETE FROM pedidos WHERE status = 'cancelado';

-- 8. Atualize a quantidade de itens vendidos em 20% para todos os pedidos concluídos.
UPDATE itens_pedido SET quantidade = quantidade * 1.2 WHERE pedido_id IN (SELECT id FROM pedidos WHERE status = 'concluído');

-- 9. Remova todos os produtos com preço menor que R$ 10,00.
DELETE FROM produtos WHERE preco < 10.00;

-- 10. Atualize a data de entrega de todos os pedidos para amanhã.
UPDATE pedidos SET data_entrega = DATE_ADD(data_entrega, INTERVAL 1 DAY);

-- Exercícios usando UNION, INTERSECT e EXCEPT:

-- 1. Selecione todos os clientes de São Paulo ou Rio de Janeiro.
SELECT * FROM clientes WHERE cidade = 'São Paulo'
UNION
SELECT * FROM clientes WHERE cidade = 'Rio de Janeiro';

-- 2. Selecione todos os produtos vendidos em janeiro de 2024 ou fevereiro de 2024.
(SELECT * FROM produtos_vendidos WHERE MONTH(data_venda) = 1 AND YEAR(data_venda) = 2024)
UNION
(SELECT * FROM produtos_vendidos WHERE MONTH(data_venda) = 2 AND YEAR(data_venda) = 2024);

-- 3. Selecione todos os clientes que também são funcionários.
SELECT * FROM clientes
INTERSECT
SELECT * FROM funcionarios;

-- 4. Selecione todos os produtos que foram vendidos e também estão em estoque.
SELECT * FROM produtos_vendidos
INTERSECT
SELECT * FROM produtos_em_estoque;

-- 5. Selecione todos os pedidos que não foram entregues.
(SELECT * FROM pedidos)
EXCEPT
(SELECT * FROM pedidos WHERE status = 'entregue');

-- 6. Selecione todos os clientes que não são funcionários.
(SELECT * FROM clientes)
EXCEPT
(SELECT * FROM funcionarios);

-- 7. Selecione todos os produtos que foram vendidos, mesmo que não estejam mais em estoque.
(SELECT * FROM produtos_vendidos)
UNION
(SELECT * FROM produtos_em_estoque);

-- 8. Selecione todos os funcionários que também são clientes.
SELECT * FROM funcionarios
INTERSECT
SELECT * FROM clientes;

-- 9. Selecione todos os pedidos feitos por clientes de São Paulo.
SELECT * FROM pedidos WHERE cliente_id IN (SELECT id FROM clientes WHERE cidade = 'São Paulo');

-- 10. Selecione todos os produtos que nunca foram vendidos.
(SELECT * FROM produtos)
EXCEPT
(SELECT * FROM produtos_vendidos);