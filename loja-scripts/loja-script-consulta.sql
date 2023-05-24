-- Uniesp - Centro Universitário
-- Sistemas para Internet - Banco de dados I e II

use loja;

-- Consultas sobre a parte de venda da Loja

-- Consulta para listar os produtos na ordem do mais caro ao mais barato
SELECT produto.nome, produto.preco 
FROM produto
ORDER BY produto.preco DESC;

-- Consulta para listar os produtos na ordem dos mais vendidos
SELECT recebe.id_produto id_produto, produto.nome nome, sum(recebe.quant) quantidade_vendida
FROM recebe
INNER JOIN produto ON recebe.id_produto = produto.id_produto
GROUP BY recebe.id_produto, produto.nome
ORDER BY quantidade_vendida DESC;

-- Consulta para saber a quantidade total de produtos por estoque
SELECT contem.id_estoque, estoque.almoxarifado, sum(quant_produto_estoque) quantidade_total 
FROM contem
INNER JOIN estoque ON contem.id_estoque = estoque.id_estoque
GROUP BY contem.id_estoque, estoque.almoxarifado
ORDER BY quantidade_total DESC;

-- Consulta para saber quantidade total de pedidos feito por cliente
SELECT pedido.id_cliente, cliente.nome, count(*) qtd_pedidos 
FROM pedido 
INNER JOIN cliente ON pedido.id_cliente = cliente.id_cliente
GROUP BY pedido.id_cliente, cliente.nome
ORDER BY qtd_pedidos DESC;

-- Consulta para saber a ordem dos funcionários que mais venderam
SELECT pedido.id_funcionario, funcionario.nome, funcionario.funcao, count(*) qtd_pedidos
FROM pedido
INNER JOIN funcionario ON pedido.id_funcionario = funcionario.id_funcionario
GROUP BY pedido.id_funcionario, funcionario.nome, funcionario.funcao
ORDER BY qtd_pedidos DESC;

-- Consultas sobre a parte administrativa da Loja

-- Consulta para listar gerente, seu setor e o diretor o qual ele está subordinado
SELECT gerente.nome gerente_nome, setor.nome setor_nome, diretor.nome diretor_nome 
FROM setor
INNER JOIN gerente ON setor.id_gerente = gerente.id_gerente
INNER JOIN diretor ON gerente.id_diretor = diretor.id_diretor;

-- Consulta para pegar todos os funcionários e seus salários com o nome do setor em que eles trabalham
SELECT setor.nome setor, funcionario.nome funcionario, funcionario.salario salario_funcionario 
FROM funcionario 
INNER JOIN setor ON funcionario.id_setor = setor.id_setor;

-- Consulta para saber o salário médio dos funcionários por setor
SELECT funcionario.id_setor id_setor, setor.nome nome_setor, AVG(funcionario.salario) salario_media
FROM funcionario
INNER JOIN setor ON funcionario.id_setor = setor.id_setor
GROUP BY funcionario.id_setor, setor.nome
ORDER BY salario_media DESC;

-- Consulta para saber a quantidade de funcionários por função na empresa
SELECT funcionario.funcao funcionario_funcao, count(*) quantidade_funcionario 
FROM funcionario 
GROUP BY funcionario.funcao;

-- Consultar para saber a quantidade de funcionários por setor
SELECT funcionario.id_setor, setor.nome, count(*) quantidade_funcionario
FROM funcionario 
INNER JOIN setor ON funcionario.id_setor = setor.id_setor
GROUP BY funcionario.id_setor, setor.nome
ORDER BY quantidade_funcionario DESC;




