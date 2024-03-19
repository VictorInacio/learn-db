-- DDL para Tabelas
drop table tabela1;
CREATE TABLE tabela1 (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

drop table tabela2;
CREATE TABLE tabela2 (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

-- Inserindo dados na tabela1
INSERT INTO tabela1 (nome) VALUES 
('João'),
('Alice'),
('Bob'),
('Maria'),
('Tomás'),
('Sara'),
('Emily'),
('David'),
('Laura'),
('Miguel');

-- Inserindo dados na tabela2
INSERT INTO tabela2 (nome) VALUES 
('João'),
('Alice'),
('Pedro'),
('Maria'),
('Tomás'),
('Sara'),
('Eva'),
('David'),
('Sofia'),
('Miguel');

-- Exemplo 1: Recuperar todos os nomes da tabela1
SELECT nome FROM tabela1;

-- Exemplo 2: Recuperar todos os nomes da tabela2
SELECT nome FROM tabela2;

-- Exemplo 3: Recuperar todos os nomes de ambas as tabelas sem duplicatas
SELECT nome FROM tabela1 
UNION 
SELECT nome FROM tabela2;

-- Exemplo 4: Recuperar nomes comuns entre tabela1 e tabela2
SELECT nome FROM tabela1
INTERSECT
SELECT nome FROM tabela2;

-- Exemplo 5: Recuperar nomes da tabela1 que não estão na tabela2
SELECT nome FROM tabela1
EXCEPT
SELECT nome FROM tabela2;

-- Exemplo 6: Recuperar nomes da tabela2 que não estão na tabela1
SELECT nome FROM tabela2
EXCEPT
SELECT nome FROM tabela1;

-- Exemplo 7: Recuperar nomes de qualquer tabela1 ou tabela2, mas não ambos
(select 'tabela 1', nome FROM tabela1
EXCEPT
SELECT 'tabela 1', nome FROM tabela2)
UNION
(SELECT 'tabela 2', nome FROM tabela2
EXCEPT
SELECT 'tabela 2',nome FROM tabela1);

-- Exemplo 8: Recuperar nomes presentes em qualquer tabela1 ou tabela2
(SELECT nome FROM tabela1
UNION
SELECT nome FROM tabela2)
EXCEPT
(SELECT nome FROM tabela1
INTERSECT
SELECT nome FROM tabela2);

-- Exemplo 9: Recuperar nomes da tabela1 e tabela2 e mostrar de qual tabela eles pertencem
SELECT nome, 'tabela1' AS fonte FROM tabela1
UNION ALL
SELECT nome, 'tabela2' AS fonte FROM tabela2;

-- Exemplo 10: Recuperar nomes da tabela1 e tabela2, contar ocorrências e mostrar o total de contagens
WITH nomes_combinados AS (
    SELECT nome, 'tabela1' AS fonte FROM tabela1
    UNION ALL
    SELECT nome, 'tabela2' AS fonte FROM tabela2)
SELECT nome, fonte, COUNT(*) AS ocorrencias
FROM nomes_combinados
INNER JOIN (select upper(nome) from nomes_combinados)
GROUP BY nome, fonte
ORDER BY nome;




SELECT nome, fonte, COUNT(*) AS ocorrencias
FROM (SELECT nome, 'tabela1' AS fonte FROM tabela1
       UNION ALL
      SELECT nome, 'tabela2' AS fonte FROM tabela2)
inner join (select upper(nome) from (SELECT nome, 'tabela1' AS fonte FROM tabela1
								       UNION ALL
								      SELECT nome, 'tabela2' AS fonte FROM tabela2))
GROUP BY nome, fonte
ORDER BY nome;



SELECT nome, COUNT(*) AS ocorrencias
FROM (SELECT nome, 'tabela1' AS fonte FROM tabela1
       UNION ALL
      SELECT nome, 'tabela2' AS fonte FROM tabela2) as t
GROUP BY nome
ORDER BY nome;


SELECT fonte, COUNT(*) AS ocorrencias
FROM (SELECT nome, 'tabela1' AS fonte FROM tabela1
       UNION ALL
      SELECT nome, 'tabela2' AS fonte FROM tabela2) as t
GROUP BY fonte
ORDER BY fonte;
