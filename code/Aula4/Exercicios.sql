-- 1. Empresas (a a b)
-- Exercícios de Inserção:

-- Adicione três empresas diferentes na tabela empresa.
-- Insira departamentos para cada uma dessas empresas na tabela departamento.
-- Adicione funcionários em diferentes departamentos na tabela funcionario.
-- Exercícios de Seleção:

-- Selecione todos os funcionários de um determinado departamento.
-- Liste todos os departamentos de uma empresa específica.
-- Encontre o número total de funcionários em cada empresa.
-- 2. Escolas (e p r)
-- Exercícios de Inserção:

-- Insira duas escolas na tabela escola.
-- Para cada escola, adicione várias classes na tabela classe.
-- Insira estudantes em diferentes classes na tabela estudante.
-- Exercícios de Seleção:

-- Liste todos os estudantes em uma classe específica.
-- Conte o número de classes em cada escola.
-- Selecione as escolas que têm mais de 10 classes.
-- 3. Hospitais (j f l)
-- Exercícios de Inserção:

-- Adicione dois hospitais na tabela hospital.
-- Crie vários departamentos para cada hospital na tabela departamento_hospital.
-- Insira médicos nesses departamentos na tabela medico.
-- Exercícios de Seleção:

-- Encontre todos os médicos especializados em uma determinada especialidade.
-- Liste todos os departamentos de um hospital específico.
-- Conte o número de médicos em cada hospital.
-- 4. Organizações Governamentais (g r j)
-- Exercícios de Inserção:

-- Insira duas organizações governamentais na tabela governo.
-- Adicione departamentos para essas organizações na tabela departamento_governo.
-- Inclua funcionários nos departamentos na tabela funcionario_governo.
-- Exercícios de Seleção:

-- Selecione todos os funcionários de um determinado departamento governamental.
-- Liste todos os departamentos em uma organização governamental específica.
-- Encontre o número total de funcionários em cada organização governamental.
-- 5. Clubes Esportivos (w w v)
-- Exercícios de Inserção:

-- Adicione três clubes esportivos na tabela clube.
-- Para cada clube, crie várias equipes na tabela equipe.
-- Adicione atletas nessas equipes na tabela atleta.
-- Exercícios de Seleção:

-- Liste todos os atletas de um clube específico.
-- Conte quantas equipes existem em cada clube.
-- Selecione clubes que possuem equipes em mais de um tipo de esporte.


CREATE TABLE clube (
    id_clube INT PRIMARY KEY,
    nome_clube VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL
);


CREATE TABLE equipe (
    id_equipe INT PRIMARY KEY,
    nome_equipe VARCHAR(255) NOT NULL,
    id_clube INT,
    FOREIGN KEY (id_clube) REFERENCES clube(id_clube)
);

CREATE TABLE atleta (
    id_atleta INT PRIMARY KEY,
    nome_atleta VARCHAR(255) NOT NULL,
    posicao VARCHAR(255) NOT NULL,
    id_equipe INT,
    FOREIGN KEY (id_equipe) REFERENCES equipe(id_equipe)
);

INSERT INTO clube (id_clube, nome_clube, cidade)
VALUES
    (1, 'Clube A', 'Cidade A'),
    (2, 'Clube B', 'Cidade B'),
    (3, 'Clube C', 'Cidade C');
INSERT INTO equipe (id_equipe, nome_equipe, id_clube)
VALUES
    (1, 'Equipe 1 Clube A', 1),
    (2, 'Equipe 2 Clube A', 1),
    (3, 'Equipe 1 Clube B', 2),
    (4, 'Equipe 2 Clube B', 2),
    (5, 'Equipe 1 Clube C', 3),
    (6, 'Equipe 2 Clube C', 3);
INSERT INTO atleta (id_atleta, nome_atleta, posicao, id_equipe)
VALUES
    (1, 'Atleta 1', 'Atacante', 1),
    (2, 'Atleta 2', 'Meio-Campo', 1),
    (3, 'Atleta 3', 'Defensor', 2),
    (4, 'Atleta 4', 'Goleiro', 3),
    (5, 'Atleta 5', 'Atacante', 4),
    (6, 'Atleta 6', 'Meio-Campo', 5);

select * from clube,equipe,atleta;
select * from equipe;
select * from atleta;

