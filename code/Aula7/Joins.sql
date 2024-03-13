-- Exemplos de INNER JOIN normais:

-- Clientes e Pedidos:

SELECT clientes.nome, pedidos.numero
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- Departamentos e Funcionários:

SELECT departamentos.nome, funcionarios.nome
FROM departamentos
INNER JOIN funcionarios ON departamentos.id = funcionarios.departamento_id;

-- Artigos e Comentários:

SELECT artigos.titulo, comentarios.texto
FROM artigos
INNER JOIN comentarios ON artigos.id = comentarios.artigo_id;

-- Chave Estrangeira Duplicada:
-- DDL:

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE pedidos (
    numero INT PRIMARY KEY,
    cliente_id INT
);
-- INSERT:


INSERT INTO clientes (id, nome) VALUES
(1, 'Cliente A'),
(2, 'Cliente B');

INSERT INTO clientes (id, nome) VALUES
(3, 'Cliente C'),
(4, 'Cliente D');


INSERT INTO pedidos (numero, cliente_id) VALUES
(101, 1),
(102, 1),
(103, 2);

INSERT INTO pedidos (numero, cliente_id) VALUES
(104, 99),
(105, 98),
(106, 98);
-- SELECT:

SELECT * from clientes;

SELECT clientes.nome, pedidos.numero
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

SELECT clientes.nome, pedidos.numero
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;

SELECT clientes.nome, pedidos.numero
FROM clientes
RIGHT JOIN pedidos ON clientes.id = pedidos.cliente_id;

SELECT clientes.nome, pedidos.numero
FROM pedidos
RIGHT JOIN clientes ON clientes.id = pedidos.cliente_id;

-- Join por Texto:
DDL:

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE enderecos (
    id INT PRIMARY KEY,
    endereco VARCHAR(200)
);
INSERT:

INSERT INTO clientes (id, nome) VALUES
(1, 'Cliente A'),
(2, 'Cliente B');

INSERT INTO enderecos (id, endereco) VALUES
(1, 'Endereço 1'),
(2, 'Endereço 2');

-- SELECT:


SELECT clientes.nome, enderecos.endereco
FROM clientes
INNER JOIN enderecos ON clientes.nome = enderecos.endereco;
Join com Tabelas Sem Chaves Estrangeiras:

-- DDL:


CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- INSERT:

INSERT INTO departamentos (id, nome) VALUES
(1, 'Departamento A'),
(2, 'Departamento B');

INSERT INTO funcionarios (id, nome) VALUES
(101, 'Funcionário 1'),
(102, 'Funcionário 2');
SELECT:

SELECT departamentos.nome, funcionarios.nome
FROM departamentos, funcionarios;

-- Esses exemplos ilustram as exceções mencionadas nos joins. 
-- No entanto, é importante notar que a última consulta usando um join implícito entre tabelas é menos comum e geralmente não é uma prática recomendada, 
-- pois pode levar a resultados cartesianos indesejados.





DDL:

sql
Copy code
CREATE TABLE vendedor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    salario DECIMAL(10, 2)
);

CREATE TABLE produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

CREATE TABLE venda (
    id SERIAL PRIMARY KEY,
    id_vendedor INT REFERENCES vendedor(id),
    id_produto INT REFERENCES produto(id),
    quantidade INT,
    data DATE
);
Consultas:

-- LEFT JOIN para listar todas as vendas com informações de produtos e vendedores, incluindo vendas sem correspondência:

SELECT venda.*, vendedor.nome AS nome_vendedor, produto.nome AS nome_produto
FROM venda
LEFT JOIN vendedor ON venda.id_vendedor = vendedor.id
LEFT JOIN produto ON venda.id_produto = produto.id;

-- LEFT JOIN para listar todas as vendas de um vendedor específico, incluindo vendas sem correspondência:

SELECT venda.*, vendedor.nome AS nome_vendedor, produto.nome AS nome_produto
FROM venda
LEFT JOIN vendedor ON venda.id_vendedor = vendedor.id
LEFT JOIN produto ON venda.id_produto = produto.id
WHERE venda.id_vendedor = 1;

-- LEFT JOIN para listar todos os produtos, incluindo os que não foram vendidos:

SELECT produto.*, venda.id AS id_venda, venda.quantidade
FROM produto
LEFT JOIN venda ON produto.id = venda.id_produto;

-- RIGHT JOIN para listar todas as vendas com informações de produtos e vendedores, incluindo produtos vendidos que não estão na tabela de produtos:

SELECT venda.*, vendedor.nome AS nome_vendedor, produto.nome AS nome_produto
FROM venda
RIGHT JOIN vendedor ON venda.id_vendedor = vendedor.id
RIGHT JOIN produto ON venda.id_produto = produto.id;

-- RIGHT JOIN para listar todas as vendas de um produto específico, incluindo vendas sem correspondência:

SELECT venda.*, vendedor.nome AS nome_vendedor, produto.nome AS nome_produto
FROM venda
RIGHT JOIN vendedor ON venda.id_vendedor = vendedor.id
RIGHT JOIN produto ON venda.id_produto = produto.id
WHERE venda.id_produto = 1;

-- Essas consultas ilustram como usar LEFT e RIGHT JOIN para recuperar informações das tabelas de vendas, vendedor e produtos, incluindo casos em que pode não haver correspondência entre elas.



-- https://www.youtube.com/watch?v=Yh4CrPHVBdE

