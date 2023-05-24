-- Uniesp - Centro Universitário
-- Sistemas para Internet - Banco de dados I e II
-- Script de criação

-- Criação do banco de dados configurando algumas propriedades
CREATE DATABASE loja ON
(
	NAME = loja_dat,
	FILENAME = 'C:\bd-ii\projeto-loja\script-bd-loja\loja.mdf',
	SIZE = 5,
	MAXSIZE = 30,
	FILEGROWTH = 5
)
LOG ON
(
	NAME = loja_log,
	FILENAME = 'C:\bd-ii\projeto-loja\script-bd-loja\loja.ldf',
	SIZE = 10,
	MAXSIZE = 50,
	FILEGROWTH = 10
)


-- Utilizando o banco de dados criado
use loja;

-- Criação da tabela DIRETOR com seus respectivos atributos.
CREATE TABLE diretor
(
	id_diretor int IDENTITY(1,1) NOT NULL,
	nome varchar(150) NOT NULL,
	telefone char(11) NOT NULL,

	CONSTRAINT PK_diretor PRIMARY KEY (id_diretor),
	CONSTRAINT CK_diretor_nome CHECK(LEN(nome) >= 4)
)

-- Criação da tabela GERENTE com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): DIRETOR
CREATE TABLE gerente
(
	id_gerente int IDENTITY(1,1) NOT NULL,
	id_diretor int NOT NULL,
	nome varchar(150) NOT NULL,
	operador int NOT NULL,

	CONSTRAINT PK_gerente PRIMARY KEY (id_gerente),
	CONSTRAINT FK_gerente_id_diretor FOREIGN KEY (id_diretor) REFERENCES diretor(id_diretor),
	CONSTRAINT CK_gerente_nome CHECK(LEN(nome) >= 4),
	CONSTRAINT CK_gerente_operador CHECK(operador > 0 AND operador <= 10)
)

-- Criação da tabela SETOR com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): GERENTE
CREATE TABLE setor
(
	id_setor int IDENTITY(1,1) NOT NULL,
	id_gerente int NOT NULL,
	nome varchar(80) NOT NULL UNIQUE,
	quant_funcionario int NOT NULL,

	CONSTRAINT PK_setor PRIMARY KEY (id_setor),
	CONSTRAINT FK_setor_id_gerente FOREIGN KEY (id_gerente) REFERENCES gerente(id_gerente),
	CONSTRAINT CK_setor_nome CHECK(LEN(nome) >= 4),
)

-- Criação da tabela FUNCIONARIO com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): SETOR
CREATE TABLE funcionario
(
	id_funcionario int IDENTITY(1,1) NOT NULL,
	id_setor int NOT NULL,
	nome varchar(150) NOT NULL UNIQUE,
	funcao varchar(50) NOT NULL,
	salario decimal(7,2) NOT NULL,
	operador int NOT NULL,

	CONSTRAINT PK_funcionario PRIMARY KEY (id_funcionario),
	CONSTRAINT FK_funcionario_id_setor FOREIGN KEY (id_setor) REFERENCES setor(id_setor),
	CONSTRAINT CK_funcionario_nome CHECK(LEN(nome) >= 4),
	CONSTRAINT CK_funcionario_operador CHECK(operador > 0 AND operador <= 10)
)

-- Criação da tabela CLIENTE com seus respectivos atributos.
CREATE TABLE cliente
(
	id_cliente int IDENTITY(1,1) NOT NULL,
	nome varchar(150) NOT NULL,
	telefone char(11) NOT NULL,
	endereco varchar(200) NOT NULL,
	cpf char(11),
	cpnj char(14),

	CONSTRAINT PK_cliente PRIMARY KEY (id_cliente),
	CONSTRAINT CK_cliente_nome CHECK(LEN(nome) >= 4)
)

-- Criação da tabela VENDA com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): PEDIDO
CREATE TABLE venda
(
	id_venda int IDENTITY(1,1) NOT NULL,
	id_pedido int NOT NULL,
	valor_total decimal(7,2) NOT NULL,
	data_venda date NOT NULL,

	CONSTRAINT PK_venda PRIMARY KEY (id_venda),
	CONSTRAINT FK_venda_id_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
)

-- Criação da tabela PEDIDO com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): CLIENTE E FUNCIONARIO
CREATE TABLE pedido
(
	id_pedido int IDENTITY(1,1) NOT NULL,
	id_cliente int NOT NULL,
	id_funcionario int NOT NULL,

	CONSTRAINT PK_pedido PRIMARY KEY (id_pedido),
	CONSTRAINT FK_pedido_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT FK_pedido_id_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
)

-- Criação da tabela PRODUTO com seus respectivos atributos.
CREATE TABLE produto
(
	id_produto int IDENTITY(1,1)NOT NULL,
	nome varchar(100) NOT NULL,
	preco decimal(6,2) NOT NULL,
	tipo varchar(50),

	CONSTRAINT PK_produto PRIMARY KEY (id_produto),
	CONSTRAINT CK_produto_nome CHECK(LEN(nome)>= 5)
)

-- Criação da tabela RECEBE com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): PEDIDO E PRODUTO
CREATE TABLE recebe
(
	id_pedido int NOT NULL,
	id_produto int NOT NULL,
	valor decimal(6,2) NOT NULL,
	quant int NOT NULL,

	CONSTRAINT FK_recebe_id_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
	CONSTRAINT FK_recebe_id_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
)

-- Criação da tabela ESTOQUE com seus respectivos atributos.
CREATE TABLE estoque
(
	id_estoque int IDENTITY(1,1) NOT NULL,
	almoxarifado varchar(255) NOT NULL,
	local varchar(80) NOT NULL,

	CONSTRAINT PK_estoque PRIMARY KEY (id_estoque),
	CONSTRAINT CK_estoque_almoxarifado CHECK(LEN(almoxarifado) >= 4),
	CONSTRAINT CK_estoque_local CHECK(LEN(local) >= 10)

)

-- Criação da tabela FORNECEDOR com seus respectivos atributos.
CREATE TABLE fornecedor(
	id_fornecedor int IDENTITY(1,1) NOT NULL,
	cnpj char(14) NOT NULL,
	nome varchar(80) NOT NULL,
	endereco varchar(100) NOT NULL,

	CONSTRAINT PK_fornecedor PRIMARY KEY (id_fornecedor),
	CONSTRAINT CK_fornecedor_nome CHECK(LEN(nome) >= 4),
	CONSTRAINT CK_fornecedor_endereco CHECK(LEN(endereco) >= 10)
)

-- Criação da tabela CONTEM com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): ESTOQUE E PRODUTO
CREATE TABLE contem
(
	id_estoque int NOT NULL,
	id_produto int NOT NULL,
	quant_produto_estoque int

	CONSTRAINT FK_contem_id_estoque FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
	CONSTRAINT FK_contem_id_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
)

-- Criação da tabela CONTEM com seus respectivos atributos. CHAVE(S) ESTRANGEIRA(S): ESTOQUE E FORNECEDOR
CREATE TABLE possui
(
	id_estoque int NOT NULL,
	id_fornecedor int NOT NULL,

	CONSTRAINT FK_possui_id_estoque FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
	CONSTRAINT FK_possui_id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
)

