Copy code
-- DDL (Definição de Dados):
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    idade INT
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    produto VARCHAR(100),
    quantidade INT,
    valor_total DECIMAL(10, 2),
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- INSERTS (Inserções de Dados):
INSERT INTO clientes (nome, cidade, idade) VALUES
('João', 'São Paulo', 35),
('Maria', 'Rio de Janeiro', 28),
('Carlos', 'Belo Horizonte', 40);

INSERT INTO pedidos (cliente_id, produto, quantidade, valor_total, data_pedido) VALUES
(1, 'Camisa', 2, 50.00, '2024-03-10'),
(1, 'Calça', 1, 70.00, '2024-03-11'),
(2, 'Tênis', 1, 120.00, '2024-03-12'),
(3, 'Camiseta', 3, 45.00, '2024-03-13');

-- Exemplos de Consultas:
-- 1. Listar todos os clientes e a quantidade de pedidos que cada um fez:
SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome;

-- 2. Calcular o valor médio dos pedidos por cidade:
SELECT cidade, AVG(valor_total) AS media_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY cidade;

-- 3. Encontrar o produto mais vendido:
SELECT produto, SUM(quantidade) AS total_vendido
FROM pedidos
GROUP BY produto
ORDER BY total_vendido DESC
LIMIT 1;

-- 4. Determinar a idade média dos clientes por cidade:
SELECT cidade, AVG(idade) AS media_idade
FROM clientes
GROUP BY cidade;

-- 5. Listar as cidades com mais de 2 clientes:
SELECT cidade, COUNT(id) AS total_clientes
FROM clientes
GROUP BY cidade
HAVING COUNT(id) > 2;

-- 6. Calcular o valor total de vendas por mês:
SELECT EXTRACT(MONTH FROM data_pedido) AS mes, SUM(valor_total) AS total_vendas
FROM pedidos
GROUP BY EXTRACT(MONTH FROM data_pedido);