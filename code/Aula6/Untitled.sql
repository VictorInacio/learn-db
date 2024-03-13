CREATE TABLE Cliente(
    Nome VARCHAR(100),
    Telefone1 VARCHAR(100),
    Telefone2 VARCHAR(100)
);


CREATE TABLE Cliente_1FN(
	cliente_id SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    IDADE VARCHAR(100),
    NATURALIDADE VARCHAR(100),
);

CREATE TABLE Telefones_1FN(
	telefone_id SERIAL PRIMARY KEY,
	cliente_id INT,
    Numero VARCHAR(100),
    FOREIGN key (cliente_id) REFERENCES Cliente_1FN(cliente_id)
);

CREATE TABLE Telefones2(
	telefone_id SERIAL PRIMARY KEY,
	cliente_id INT,
    Numero VARCHAR(100)
);

INSERT INTO public.cliente_1fn (cliente_id, nome) 
VALUES(nextval('cliente_1fn_cliente_id_seq'::regclass), 'CLIENTE 3');


INSERT INTO public.cliente_1fn (nome) 
VALUES('CLIENTE 4');


INSERT INTO public.Telefones_1FN (cliente_id, Numero) 
VALUES(1, '1234123213');


INSERT INTO public.Telefones_1FN (cliente_id, Numero) 
VALUES(1, '46523452435');


INSERT INTO public.Telefones_1FN (cliente_id, Numero) 
VALUES(1, '654745674657');

INSERT INTO public.Telefones2 (cliente_id, Numero) 
VALUES(1, '1234123213');


INSERT INTO public.Telefones2 (cliente_id, Numero) 
VALUES(1, '46523452435');


INSERT INTO public.Telefones2 (cliente_id, Numero) 
VALUES(1, '654745674657');


INSERT INTO public.Telefones2 (cliente_id, Numero) 
VALUES(5, '654745674657');


select * from cliente_1fn;

select * 
from cliente_1fn inner join Telefones_1FN 
on cliente_1fn.cliente_id = Telefones_1FN.cliente_id;

select * 
from cliente_1fn RIGHT OUTER join Telefones2 
on cliente_1fn.cliente_id = Telefones2.cliente_id;


select * 
from cliente_1fn FULL OUTER join Telefones2 
on cliente_1fn.cliente_id = Telefones2.cliente_id;

select * 
from cliente_1fn inner join Telefones_1FN 
on cliente_1fn.cliente_id = Telefones_1FN.cliente_id
union
select * 
from cliente_1fn left OUTER join Telefones_1FN 
on cliente_1fn.cliente_id = Telefones_1FN.cliente_id;


CREATE TABLE Pedidos(
    PedidoID SERIAL PRIMARY key,
    ClienteID INT,
    NomeCliente VARCHAR(100),
    ProdutoID INT,
    NomeProduto VARCHAR(100)
);

INSERT INTO public.pedidos (clienteid, nomecliente, produtoid, nomeproduto) 
VALUES( 1, 'Fulano', 1, 'Livro');

INSERT INTO public.pedidos (clienteid, nomecliente, produtoid, nomeproduto) 
VALUES( 1, 'Fulano', 2, 'Blusa');

INSERT INTO public.pedidos (clienteid, nomecliente, produtoid, nomeproduto) 
VALUES( 2, 'Ciclano', 1, 'Livro');

INSERT INTO public.pedidos (clienteid, nomecliente, produtoid, nomeproduto) 
VALUES( 2, 'Ciclano', 3, 'Camisa');


select * from pedidos;




drop table Produto_2fn CASCADE;

drop table Categorias CASCADE;

CREATE TABLE Categorias(
 CategoriaID SERIAL PRIMARY key,
 NomeCategoria VARCHAR(100)
);

CREATE TABLE Produto_2fn(
    ProdutoID SERIAL PRIMARY key,
    NomeProduto VARCHAR(100),
    CategoriaID INT,
    FOREIGN key (CategoriaID) REFERENCES Categorias(CategoriaID)
);

CREATE TABLE Cliente_2fn(
    ClienteID SERIAL PRIMARY key,
    NomeCliente VARCHAR(100)
);

drop table Pedidos_2fn;

CREATE TABLE Pedidos_2fn(
    PedidoID SERIAL PRIMARY key,
    Data VARCHAR(100),
    ProdutoID INT,
    ClienteID INT,
    CategoriaID INT,
    FOREIGN key (ProdutoID) REFERENCES Produto_2fn(ProdutoID),
    FOREIGN key (ClienteID) REFERENCES Cliente_2fn(ClienteID)
);

INSERT INTO public.Cliente_2fn (NomeCliente) 
VALUES( 'Fulano');

INSERT INTO public.Cliente_2fn (NomeCliente) 
VALUES( 'Ciclano');

INSERT INTO public.Produto_2fn (NomeProduto) 
VALUES( 'Livro');

INSERT INTO public.Produto_2fn (NomeProduto) 
VALUES( 'Camisa');

INSERT INTO public.Pedidos_2fn (data, ProdutoID, ClienteID ) 
VALUES('08/03/2024', 1, 2);
INSERT INTO public.Pedidos_2fn (data, ProdutoID, ClienteID ) 
VALUES('08/03/2024', 1, 1);
INSERT INTO public.Pedidos_2fn (data, ProdutoID, ClienteID ) 
VALUES('08/03/2024', 2, 2);

select * from Pedidos_2fn;

select Pedidos_2fn.PedidoId, Cliente_2fn.nomecliente
from Pedidos_2fn inner join Cliente_2fn 
on Pedidos_2fn.ClienteId = Cliente_2fn.ClienteId;

select Pedidos_2fn.PedidoId, Cliente_2fn.nomecliente, Produto_2fn.NomeProduto
from Pedidos_2fn 
inner join Cliente_2fn on Pedidos_2fn.ClienteId = Cliente_2fn.ClienteId
inner join Produto_2fn on Pedidos_2fn.ProdutoId = Produto_2fn.ProdutoId;


CREATE TABLE Produto_3fn(
    ProdutoID SERIAL PRIMARY key,
    NomeProduto VARCHAR(100),
    Categoria VARCHAR(100)
);

INSERT INTO public.Produto_3fn (NomeProduto, Categoria) 
VALUES( 'Livro', 'Biblioteca');

INSERT INTO public.Produto_3fn (NomeProduto, Categoria) 
VALUES( 'Tomate', 'Mercearia');

INSERT INTO public.Produto_3fn (NomeProduto, Categoria) 
VALUES( 'Camisa', 'Roupas');

INSERT INTO public.Produto_3fn (NomeProduto, Categoria) 
VALUES( 'Sapato', 'Roupas');

select * from Produto_3fn;

CREATE TABLE Categorias(
 CategoriaID SERIAL PRIMARY key,
 NomeCategoria VARCHAR(100)
);

drop table Produto_3fn;




INSERT INTO public.Categorias (NomeCategoria) 
VALUES('Biblioteca'), ('Mercearia'),('Roupas');

select * from categorias;

INSERT INTO public.Produto_3fn (NomeProduto, CategoriaID) 
VALUES( 'Livro', 1);

INSERT INTO public.Produto_3fn (NomeProduto, CategoriaID) 
VALUES( 'Tomate', 2);

INSERT INTO public.Produto_3fn (NomeProduto, CategoriaID) 
VALUES( 'Camisa', 3);

INSERT INTO public.Produto_3fn (NomeProduto, CategoriaID) 
VALUES( 'Sapato', 3);

select Produto_3fn.ProdutoId, Produto_3fn.NomeProduto, Categorias.NomeCategoria
from Produto_3fn
inner join Categorias on Produto_3fn.CategoriaID = Categorias.CategoriaID;

