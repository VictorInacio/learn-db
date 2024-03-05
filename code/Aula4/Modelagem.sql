-- Criação da tabela Cliente
CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(50)
);

INSERT INTO Cliente (nome, endereco, telefone) 
VALUES ('Cliente 2', 'Rua B', '11 123131212');


INSERT INTO Cliente (nome, endereco, telefone) 
VALUES ('Cliente 3', 'Rua C', '11 123131212');


INSERT INTO Cliente (cliente_id, nome, endereco, telefone) 
VALUES (4, 'Cliente 4', 'Rua D', '11 123131212');


INSERT INTO Cliente (nome, endereco, telefone) 
VALUES ('Cliente 5', 'Rua E', '11 123131212');

SELECT setval('cliente_cliente_id_seq', 78, true);  


INSERT INTO Cliente (nome, endereco, telefone) 
VALUES ('Cliente 6', 'Rua 6', '11 123131212');

SELECT setval('cliente_cliente_id_seq', 6, true); 


INSERT INTO Cliente (nome, endereco, telefone) 
VALUES ('Cliente 7', 'Rua 7', '11 123131212');


-- Criação da tabela Contrato
CREATE TABLE Contrato (
    contrato_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL, -- FOREIGN KEY
    data_inicio VARCHAR(255) NOT NULL,
    data_fim VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

INSERT INTO Contrato (--contrato_id, 
cliente_id, data_inicio, data_fim, valor ) 
VALUES (1, '01/01/2024', '31/12/2024', 1000);

INSERT INTO Contrato (--contrato_id, 
cliente_id, data_inicio, data_fim, valor ) 
VALUES (79, '01/01/2024', '31/12/2024', 500);

-- INTEGRIDADE REFERENCIAL

-- Criação da tabela Equipamento
CREATE TABLE Equipamento (
    equipamento_id SERIAL PRIMARY KEY,
    contrato_id INT,
    descricao VARCHAR(255) NOT NULL,
    modelo VARCHAR(100),
    FOREIGN KEY (contrato_id) REFERENCES Contrato(contrato_id)
);