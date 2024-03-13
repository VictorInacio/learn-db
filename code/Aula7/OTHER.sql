-- DDL das tabelas
CREATE TABLE IF NOT EXISTS produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

-- DDL das tabelas
CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Inserindo dados nas tabelas
INSERT INTO produtos (nome, preco) VALUES
    ('Camisa', 29.99),
    ('Calça', 39.99),
    ('Sapato', 59.99),
    ('Meia', 9.99);
   
INSERT INTO produtos (nome, preco) VALUES
    ('Cemisa', 29.99),
    ('Celça', 39.99),
    ('Sepato', 59.99),
    ('Maia', 9.99);

INSERT INTO clientes (nome, email) VALUES
    ('João', 'joao@example.com'),
    ('Maria', 'maria@example.com'),
    ('Pedro', 'pedro@example.com');

-- Exemplo de SELECT usando ORDER BY
SELECT * FROM produtos ORDER BY preco DESC;

-- Exemplo de SELECT usando LIMIT e ORDER BY

SELECT * 
FROM produtos 
ORDER BY preco DESC, nome DESC;




SELECT * FROM produtos ORDER BY preco DESC, nome ASC;

SELECT * FROM produtos ORDER BY preco DESC, nome ASC  OFFSET 3;


-- Exemplo de SELECT usando LIMIT para paginar resultados
SELECT * FROM produtos ORDER BY preco ASC LIMIT 5 OFFSET 0; -- Primeira página
SELECT * FROM produtos ORDER BY preco ASC LIMIT 5 OFFSET 5; -- Segunda página

-- Exemplo de SELECT usando LIMIT para retornar os N primeiros resultados
SELECT * FROM produtos ORDER BY preco DESC LIMIT 3;

-- Exemplo de SELECT usando LIMIT para retornar os últimos N resultados
SELECT * FROM produtos ORDER BY preco ASC LIMIT 3;

-- Exemplo de SELECT usando LIMIT para retornar um intervalo de resultados
SELECT * FROM produtos ORDER BY preco DESC LIMIT 2 OFFSET 2; -- Terceiro e quarto produtos mais caros

-- Exemplo de SELECT usando ORDER BY em uma coluna não numérica
SELECT * FROM produtos ORDER BY nome ASC;

-- Exemplo de SELECT usando ORDER BY em várias colunas
SELECT * FROM produtos ORDER BY preco DESC, nome ASC;

-- Exemplo de SELECT usando ORDER BY com expressão
SELECT * FROM produtos ORDER BY preco * 2 DESC;
