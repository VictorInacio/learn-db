SELECT * FROM 
(VALUES 
(1, 'one'), 
(2, 'two'), 
(3, 'three')) AS t

-- Criando as tabelas:

-- Tabela vendedores:

DROP TABLE vendedores CASCADE;

CREATE TABLE vendedores (
    vendedor_id INT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

INSERT INTO vendedores (vendedor_id, nome, sobrenome, email, telefone)
VALUES
    (1, 'João', 'Silva', 'joao@example.com', '(11) 1234-5678'),
    (2, 'Maria', 'Santos', 'maria@example.com', '(11) 9876-5432'),
    (3, 'Pedro', 'Almeida', 'pedro@example.com', '(11) 5555-5555');


-- Tabela produtos:

DROP TABLE produtos CASCADE;
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10, 2)
);

INSERT INTO produtos (produto_id, nome, descricao, preco)
VALUES
    (1, 'Camiseta', 'Camiseta branca de algodão', 29.99),
    (2, 'Calça Jeans', 'Calça jeans azul escuro', 59.99),
    (3, 'Tênis', 'Tênis esportivo preto', 79.99),
   (5, 'Produto nao vendido', 'Produto nao vendido', 79.99);


-- Tabela vendas:
DROP TABLE vendas CASCADE;
CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    produto_id INT,
    vendedor_id INT,
    quantidade INT,
    data DATE
--    ,
--    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id),
--    FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id)
);

INSERT INTO vendas (venda_id, produto_id, vendedor_id, quantidade, data)
VALUES
    (1, 1, 1, 2, '2024-03-01'),
    (2, 2, 2, 1, '2024-03-02'),
    (3, 3, 3, 3, '2024-03-03'),
    (4, 1, 2, 1, '2024-03-04'),
    (5, 2, 1, 2, '2024-03-05'),
    (6, 3, 2, 2, '2024-03-06'),
    (7, 4, 2, 2, '2024-03-06');

select * from produtos p ;
-- 1 - Atualize o preço de um produto específico:
UPDATE produtos
SET preco = 69.99
WHERE produto_id = 2;


select * from vendedores v ;
-- 2 - Atualize o nome de um vendedor:
UPDATE vendedores
SET nome = 'João da'
WHERE vendedor_id = 1;

select * from vendas v ;
-- 3 - Exclua uma venda com base no ID da venda:
DELETE FROM vendas
WHERE venda_id = 4;



-- 4 - Exclua um produto com base no ID do produto:
DELETE FROM vendas
WHERE produto_id = 1;

DELETE FROM produtos
WHERE produto_id = 1;


-- 5 - Exclua um vendedor com base no ID do vendedor:
DELETE FROM vendedores
WHERE vendedor_id = id_do_vendedor;

DELETE FROM vendedores;

select * from produtos v ;
-- 6 - Aumente o preço de todos os produtos em 10%:
UPDATE produtos
SET preco = preco * 1.10;

-- 6 - Aumente o preço de todos os produtos em 10%:
UPDATE produtos
SET preco = 0;

-- 7 - Atualize a quantidade vendida de um produto específico:
UPDATE vendas
SET quantidade = nova_quantidade
WHERE produto_id = 1 and ( NOME = 'Calça' or NOME = 'calça');

-- 8 - Atualize o email de um vendedor específico:
UPDATE vendedores
SET email = novo_email
WHERE vendedor_id = id_do_vendedor;


-- 9 - Atualize o sobrenome de todos os vendedores que possuem um determinado nome.
select * from vendedores v ;
UPDATE vendedores
SET sobrenome = 'dos Santos'
WHERE nome = 'Maria';


-- 10 - Exclua todos os produtos que não foram vendidos: 
select * from produtos p ;

DELETE FROM produtos
WHERE produto_id NOT IN (select distinct produto_id FROM vendas);


-- 11 - Exclua todos os vendedores que não realizaram nenhuma venda:
DELETE FROM vendedores
WHERE vendedor_id NOT IN (SELECT vendedor_id FROM vendas);


-- 12 - Exclua todas as vendas realizadas antes de uma determinada data:
select * from VENDAS;
DELETE FROM vendas
WHERE data < '2024-03-05';

-- 13 - Exclua todos os produtos de um determinado preco:
DELETE FROM produtos
WHERE preco = 'preco_do_produto';


-- 14 - Atualize o preço de todos os produtos vendidos por um vendedor específico para um novo valor e, em seguida, exclua todas as vendas realizadas por esse vendedor que foram feitas antes de uma determinada data:

-- Passo 1: Atualizar o preço dos produtos vendidos pelo vendedor específico
select * from produtos;
UPDATE produtos
SET preco = 999.99
WHERE produto_id IN (
    SELECT produto_id
    FROM vendas
    WHERE vendedor_id = 1
);

-- Passo 2: Excluir todas as vendas realizadas por esse vendedor antes de uma determinada data
DELETE FROM vendas
WHERE vendedor_id = 1 AND data < '2024-01-01';



-- 15 - Atualize o telefone de todos os vendedores que realizaram vendas após uma determinada data para um novo número e, em seguida, exclua todas as vendas desses vendedores.

select * from vendedores;
-- Passo 1: Atualizar o telefone dos vendedores que realizaram vendas após uma determinada data
UPDATE vendedores
SET telefone = '12345'
WHERE vendedor_id IN (
    SELECT vendedor_id
    FROM vendas
    WHERE data > '2020-01-01'
);

select * from vendas;
-- Passo 2: Excluir todas as vendas dos vendedores que tiveram seus telefones atualizados
DELETE FROM vendas
WHERE vendedor_id IN (
    SELECT vendedor_id
    FROM vendas
    WHERE data > '1970-01-01'
);
