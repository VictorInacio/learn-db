-- Criando as tabelas:

-- Tabela vendedor:

CREATE TABLE vendedor (
    id_vendedor INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100));

INSERT INTO vendedor (id_vendedor, nome, cidade) VALUES
(1, 'João', 'São Paulo'),
(2, 'Maria', 'Rio de Janeiro'),
(3, 'Carlos', 'São Paulo');


-- Tabela produto:

CREATE TABLE produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100));

INSERT INTO produto (id_produto, nome, categoria) VALUES
(101, 'Celular', 'Eletrônicos'),
(102, 'TV', 'Eletrônicos'),
(103, 'Livro', 'Cultura');

-- Tabela venda:

CREATE TABLE venda (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    id_vendedor INT,
    quantidade INT,
    preco DECIMAL(10,2),
    data DATE);

INSERT INTO venda (id_venda, id_produto, id_vendedor, quantidade, preco, data) VALUES
(1, 101, 1, 2, 1500.00, '2024-03-10'),
(2, 102, 2, 1, 2000.00, '2024-03-11'),
(3, 101, 3, 3, 4500.00, '2024-03-12'),
(4, 103, 1, 5, 100.00, '2024-03-13'),
(5, 102, 1, 1, 1800.00, '2024-03-14'),
(6, 101, 2, 2, 2800.00, '2024-03-15'),
(7, 103, 3, 3, 90.00, '2024-03-16'),
(8, 101, 1, 1, 1500.00, '2024-03-17'),
(9, 102, 3, 2, 2200.00, '2024-03-18'),
(10, 103, 2, 4, 120.00, '2024-03-19');


-- 01 - Selecione o nome e o preço mínimo de cada produto:


-- 02 - Liste o nome do produto, o preço máximo e o vendedor associado a cada produto:


-- 03 - Liste o nome do produto, o preço médio e o número de vendas para cada produto:


-- 04 - Selecione o nome do produto mais caro em cada categoria.


-- 05 - Liste o nome do vendedor, o número total de vendas e a média de preço das vendas para cada vendedor:


-- 06 - Calcule o total de vendas realizadas por cada vendedor em cada mês:


-- 07 - Liste o nome do produto, a quantidade mínima vendida e o vendedor associado a cada produto:


-- 08 - Selecione o nome do vendedor, a data da primeira venda registrada e a data da última venda registrada para cada vendedor.


-- 09 - Liste o nome do produto, o número total de vendas e o total de receita para cada produto, ordenado pelo total de receita em ordem decrescente:


-- 10 - Calcule a soma total de vendas para cada vendedor: 


-- 11 - Selecione o nome do vendedor e o número total de vendas realizadas por ele:


-- 12 - Liste o nome do produto, a quantidade total vendida e o preço médio para cada produto:


-- 13 - Calcule o valor total de vendas realizadas em cada categoria de produto:


-- 14 - Selecione o nome do produto, a quantidade mínima e a quantidade máxima vendida para cada produto.


-- 15 - Selecione o nome do produto, a quantidade total vendida e o preço médio por produto, excluindo produtos com vendas nulas:


