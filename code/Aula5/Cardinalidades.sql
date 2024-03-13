1:1 (Um para Um)

Tabelas: Pessoa e NumeroSegurancaSocial
INSERT INTO Pessoa (id, nome) VALUES (1, 'João');
INSERT INTO NumeroSegurancaSocial (id, numero, pessoa_id) VALUES (1, '123-45-6789', 1);
1:0..1 (Um para Zero ou Um)

Tabelas: Funcionario e Gerente
INSERT INTO Funcionario (id, nome) VALUES (2, 'Ana'); (Funcionário sem ser gerente)
INSERT INTO Funcionario (id, nome) VALUES (3, 'Carlos');
INSERT INTO Gerente (id, funcionario_id, departamento) VALUES (1, 3, 'TI');
1:N (Um para Muitos)

Tabelas: Professor e Disciplina
INSERT INTO Professor (id, nome) VALUES (1, 'Dra. Silva');
INSERT INTO Disciplina (id, nome, professor_id) VALUES (1, 'Matemática', 1);
INSERT INTO Disciplina (id, nome, professor_id) VALUES (2, 'Física', 1);
1:0..N (Um para Zero ou Muitos)

Tabelas: Escritor e Livro
INSERT INTO Escritor (id, nome) VALUES (1, 'Luís');
INSERT INTO Livro (id, titulo, escritor_id) VALUES (1, 'A Montanha', 1);
INSERT INTO Livro (id, titulo, escritor_id) VALUES (2, 'O Rio', 1);
N:N (Muitos para Muitos)

Tabelas: Estudante, Disciplina e Matricula (tabela de junção)
INSERT INTO Estudante (id, nome) VALUES (1, 'Maria');
INSERT INTO Disciplina (id, nome) VALUES (3, 'História');
INSERT INTO Matricula (estudante_id, disciplina_id) VALUES (1, 3);
1..N : 1..N (Muitos para Muitos com Restrição de no mínimo um)

Tabelas: Paciente, Médico e Consulta (tabela de junção)
INSERT INTO Paciente (id, nome) VALUES (1, 'José');
INSERT INTO Médico (id, nome) VALUES (1, 'Dr. Mendes');
INSERT INTO Consulta (paciente_id, medico_id) VALUES (1, 1);
0..N : 0..N (Muitos para Muitos sem Restrição)

Tabelas: Usuario, Seguidor (tabela de junção)
INSERT INTO Usuario (id, nome) VALUES (1, 'Rita');
INSERT INTO Usuario (id, nome) VALUES (2, 'Pedro');
INSERT INTO Seguidor (seguidor_id, seguido_id) VALUES (1, 2); (Rita segue Pedro)