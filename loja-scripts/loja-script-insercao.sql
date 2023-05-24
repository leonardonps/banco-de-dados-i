-- Uniesp - Centro Universit�rio
-- Sistemas para Internet - Banco de dados I e II
-- Script de inser��o

-- Utilizando o banco de dados
use loja;

-- Inserindo dados do DIRETOR: Nome e Telefone
INSERT INTO diretor VALUES
(
	'Jo�o Feij�o', 83988775561
),
(
	'Maria OutrasVais', 83988775562
),
(
	'Mariana Ana', 83988775563
),
(
	'Jos� Louro', 83988775564
),
(
	'Torre das Torres', 83988775564
);

-- Inserindo dados do GERENTE: Diretor, Nome e N�mero do Operador
INSERT INTO gerente VALUES
(
	1, 'J�ssica Rodrigues', 2
),
(
	5, 'Marcelo das Torres', 2
),
(
	5, 'Pedro Paulo', 2
),
(
	3, 'Rodrigo Rodrigues', 2
),
(
	1, 'Jos� Leandro Fortes', 3
);

-- Inserindo dados do SETOR: Id do Gerente, Nome e Quantidade de funcion�rios
INSERT INTO setor VALUES
(
	1, 'Setor de Compras', 5
),
(
	2, 'Setor de Vendas', 6
),
(
	3, 'Setor de Marketing', 2
),
(
	4, 'Setor de Planejamento e Execu��o', 3
),
(
	5, 'Setor Financeiro', 3
);

-- Inserindo dados do FUNCIONARIO: Id do Setor, Nome, Fun��o, Sal�rio e N�mero do Operador
INSERT INTO funcionario VALUES
(
	1, 'J�ssica Paula Monteiro', 'Subgerente', 5000, 3
),
(
	1, 'Carla Mendon�a', 'Supervisor j�nior', 3200.59, 4
),
(
	2, 'Jo�o da Cruz', 'Vendedor', 2000, 5
),
(
	2, 'Frederico Kennedy', 'Vendedor', 2000, 5
),
(
	2, 'Sara Sarou', 'Vendedor', 2000, 5
),
(
	5, 'Lee Young', 'Contador', 4000, 3
),
(
	4, 'Timone Sebet', 'Supervisora de Planejamento', 3000, 2
);


-- Inserindo dados do CLIENTE: Nome, Telefone, Endere�o, CPF ou CNPJ
INSERT INTO cliente VALUES
(
	'Ana Maria Fernandes', 83988667701, 'Rua do Medo, n�mero 1', 12345678901, null
),
(
	'Louis Fernandes', 83988667702, 'Rua do Medo, n�mero 2', 12345678902, null
),
(
	'Tom Jobim', 83988667703, 'Rua da Praia, n�mero 150', 12345678903, null
),
(
	'Kennedy da Sylva', 83988667704, 'Rua Norte Americana, n�m. 1919', 12345678904, null
),
(
	'Socorro Jesus da Silva', 83988667705, 'Rua dos Socorros, n�m. 150', 12345678905, null
);

-- Inserindo dados de VENDA: Id do Pedido, Valor total da venda e Data da venda
INSERT INTO venda VALUES
(
	1, 1351, '20/05/2023'
),
(
	2, 250.50, '13/04/2023'
),
(
	3, 100.50, '11/08/2022'
),
(
	4, 301.50, '12/09/2022'
), 
(
	5, 404, '01/02/2023'
);

-- Inserindo dados do PEDIDO: Id do Cliente e Id do Funcion�rio
INSERT INTO pedido VALUES 
(
	1, 3
),
(
	2, 3
),
(
	3, 5
),
(
	4, 3
),
(
	5, 4
);

-- Inserindo dados do PRODUTO: Nome, Pre�o e Tipo do produto
INSERT INTO produto VALUES
(
	'Mouse El rat�n', 100, 'Mouse'
),
(
	'Teclado Teclando Generation T', 50.50, 'Teclado'
),
(
	'Bateria para notebook Cell series 15600', 50, 'Bateria para notebook'
),
(
	'Headphones HearTheHead 120 series HTHD', 250, 'Headphones em geral'
), 
(
	'Fonte E o vento levou Basic VL 5600 series ', 100.50, 'Fontes'
);

-- Inserindo dados na tabela RECEBE: Id do Pedido, Id do Produto, Valor (Pre�o do produto x Quantidade) e Quantidade
INSERT INTO recebe VALUES
(
	1, 1, 500, 5
),
(
	1, 2, 101, 2
),
(
	1, 4, 750, 3
),
(
	2, 1, 200, 2
), 
(
	2, 2, 50.50, 1
),
(
	3, 5, 100.50, 1
),
(
	4, 5, 301.50, 3
),
(
	5, 2, 404, 8
);

-- Inserindo dados do ESTOQUE: Descri��es do Almoxarifado e Estoque
INSERT INTO estoque VALUES
(
	'E1 - Computadores e pe�as', 'Estoque 1 - lado direito da sala do diretor'
),
(
	'E2 - Notebooks e pe�as', 'Estoque 2 - no lado esquerdo da sala do diretor'
),
(
	'E3 - Pe�as de computadores antigos para reciclar', 'Estoque 3 - em cima da sala do estoque 1'
),
(
	'E4 - Acess�rios/Pe�as gerais para pcs e notebooks', 'Estoque 4 - em cima ao lado do estoque 3'
),
(
	'E5 - Pe�as revendidas', 'Estoque 5 - em frente ao estoque 1'
);

-- Inserindo dados do FORNECEDOR: CNPJ, Nome e Endere�o
INSERT INTO fornecedor VALUES
(
	'12345678910001', 'COMPF Fornecedora de computadores', 'Rua do Medo, n�mero 1666'
),
(
	'12345678910002', 'PE�ASACESS Fornecedora de pe�as e acess�rios', 'Endere�o n�o apresentado'
),
(
	'12345678910003', 'ComputadoresNovo Fornecedora de computadores', 'Rua do Medo, n�mero 10123'
),
(
	'12345678910004', 'NotePe�as Fornecedora de notebooks e pe�as', 'Rua das Flores e Florestas, n�mero 12'
),
(
	'12345678910005', 'ReUsePe�as - fornecedora de pe�as usadas', 'Rua da Mata Queima, s/n'
);

-- Inserindo dados na TABELA CONTEM: Id do Estoque, Id do produto e Quantidade do produto no estoque
INSERT INTO contem VALUES
(
	1, 1, 50
),
(
	1, 5, 5
),
(
	
	4, 4, 150
), 
(
	2, 3, 50
),
(
	1, 2, 20
);

-- Inserindo dados na TABELA POSSUI: Id do Estoque e ID do Fornecedor
INSERT INTO possui VALUES
(
	1, 1
),
(
	1, 2
),
(
	2, 4
),
(
	1, 3
),
(
	5, 5
);
