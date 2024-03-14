-- Criando as tabelas:

-- Tabela vendedores:

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
    (3, 'Tênis', 'Tênis esportivo preto', 79.99);


-- Tabela vendas:

CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    produto_id INT,
    vendedor_id INT,
    quantidade INT,
    data DATE,
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id),
    FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id)
);

INSERT INTO vendas (venda_id, produto_id, vendedor_id, quantidade, data)
VALUES
    (1, 1, 1, 2, '2024-03-01'),
    (2, 2, 2, 1, '2024-03-02'),
    (3, 3, 3, 3, '2024-03-03'),
    (4, 1, 2, 1, '2024-03-04'),
    (5, 2, 1, 2, '2024-03-05'),
    (6, 3, 2, 2, '2024-03-06');


-- 1 - Atualize o preço de um produto específico:
UPDATE produtos
SET preco = novo_preco
WHERE produto_id = id_do_produto;


-- 2 - Atualize o nome de um vendedor:
UPDATE vendedores
SET nome = novo_nome
WHERE vendedor_id = id_do_vendedor;

-- 3 - Exclua uma venda com base no ID da venda:
DELETE FROM vendas
WHERE venda_id = id_da_venda;


-- 4 - Exclua um produto com base no ID do produto:
DELETE FROM produtos
WHERE produto_id = id_do_produto;


-- 5 - Exclua um vendedor com base no ID do vendedor:
DELETE FROM vendedores
WHERE vendedor_id = id_do_vendedor;

-- 6 - Aumente o preço de todos os produtos em 10%:
UPDATE produtos
SET preco = preco * 1.10;

-- 7 - Atualize a quantidade vendida de um produto específico:
UPDATE vendas
SET quantidade = nova_quantidade
WHERE produto_id = id_do_produto;

-- 8 - Atualize o email de um vendedor específico:
UPDATE vendedores
SET email = novo_email
WHERE vendedor_id = id_do_vendedor;


-- 9 - Atualize o sobrenome de todos os vendedores que possuem um determinado nome.

UPDATE vendedores
SET sobrenome = novo_sobrenome
WHERE nome = 'nome_desejado';


-- 10 - Exclua todos os produtos que não foram vendidos: 
DELETE FROM produtos
WHERE produto_id NOT IN (SELECT produto_id FROM vendas);


-- 11 - Exclua todos os vendedores que não realizaram nenhuma venda:
DELETE FROM vendedores
WHERE vendedor_id NOT IN (SELECT vendedor_id FROM vendas);


-- 12 - Exclua todas as vendas realizadas antes de uma determinada data:
DELETE FROM vendas
WHERE data < 'data_especifica';

-- 13 - Exclua todos os produtos de um determinado preco:
DELETE FROM produtos
WHERE preco = 'preco_do_produto';


-- 14 - Atualize o preço de todos os produtos vendidos por um vendedor específico para um novo valor e, em seguida, exclua todas as vendas realizadas por esse vendedor que foram feitas antes de uma determinada data:

-- Passo 1: Atualizar o preço dos produtos vendidos pelo vendedor específico
UPDATE produtos
SET preco = novo_preco
WHERE produto_id IN (
    SELECT produto_id
    FROM vendas
    WHERE vendedor_id = id_do_vendedor
);

-- Passo 2: Excluir todas as vendas realizadas por esse vendedor antes de uma determinada data
DELETE FROM vendas
WHERE vendedor_id = id_do_vendedor AND data < 'data_especifica';



-- 15 - Atualize o telefone de todos os vendedores que realizaram vendas após uma determinada data para um novo número e, em seguida, exclua todas as vendas desses vendedores.

-- Passo 1: Atualizar o telefone dos vendedores que realizaram vendas após uma determinada data
UPDATE vendedores
SET telefone = novo_telefone
WHERE vendedor_id IN (
    SELECT vendedor_id
    FROM vendas
    WHERE data > 'data_especifica'
);

-- Passo 2: Excluir todas as vendas dos vendedores que tiveram seus telefones atualizados
DELETE FROM vendas
WHERE vendedor_id IN (
    SELECT vendedor_id
    FROM vendas
    WHERE data > 'data_especifica'
);
