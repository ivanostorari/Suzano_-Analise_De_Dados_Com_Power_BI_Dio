SHOW DATABASES;
USE e_commerce;
SHOW TABLES;
DESC cliente;

-- Inserindo Clientes

INSERT INTO cliente (primeiro_nome, nome_meio, ultimo_nome, documento, tipo_conta, data_nascimento, rua,
	bairro, cidade, numero, complemento, estado, pais) VALUES ('Carlos', 'AS', 'Junior', 123456789, 'PJ', '2007-05-08',
    'Rua A', 'Bairro B', 'Andradas', '53', '', 'MG', 'BR'),
    ('Isaac', 'C', 'Silva', 987654321, 'PJ', '2007-05-08',
    'Rua A', 'Bairro B', 'Andradas',  '53', '', 'MG', 'BR'),
    ('Rosilene', 'C', 'Silva', 987651234, 'PJ', '2007-05-08',
    'Rua A', 'Bairro B', 'Andradas',  '53', '', 'MG', 'BR');
    
-- Inserindo Cartões dos clientes

DESC cartoes;

INSERT INTO cartoes (nro_cartao, nome_cartao, bandeira_cartao, idCliente) VALUES
	('345645674332', 'Carlos Junior', 'Visa', 1),
    ('345645674332', 'Isaac Silva', 'Visa', 2),
    ('345645674332', 'Rosilene Couto', 'Visa', 3);
    
-- Inserindo Fornecedor

DESC fornecedor;

INSERT INTO fornecedor (razao_social, cnpj, telefone) VALUES
	('Fulano Brinquedos', '345566556563425', '3599996006'),
    ('Siclando Modas', '565656565656789', '11677653456');
    
-- Inserindo Produtdo

DESC produto;

INSERT INTO produto (nome, categoria, descricao, valor, classificacao_criancas,
altura_cm, largura_cm, comprimento_cm, peso_kg) VALUES
	('Camisa Preta', 'Roupas', 'Camisa masculina com várias cores.', 30.50, 0, 30, 30, 10, 0.200),
	('Carrinho de controle remoto', 'Brinquedos', 'Carrinho com pilhas recarregáveis.', 70.00, 1, 20, 30, 40, 0.500),
	('Calça jeans', 'Roupas', 'Calça jeans feminina', 60.99, 0, 30, 30, 5, 0.200),
    ('Boneco Soldado', 'Brinquedos', 'Boneco de soldado', 60.99, 0, 30, 30, 5, 0.200);

-- Inserindo Relaçao Produto-Fornecedor

DESC fornecimento_de_produto;

INSERT INTO fornecimento_de_produto VALUES
	(1, 2),
    (2, 1),
    (2, 3);
    
-- Inserindo Vendedor terceiro

DESC terceiro;

INSERT INTO terceiro (razao_social, endereco, nome_fantasia, cnpj, cpf) VALUES
	('Terceiro Moda LTDA', 'Rua A, 32, Jd B, São Paulo, SP', 'Roupas Daora', '64517366000115', ''),
    ('Pequenino Importação LTDA', 'Rua C, 12, Jd D, Diadema, SP', 'Pequeninos Brinquedos', '35478258000182', '');
    
-- Inserindo Produto por terceiro

DESC produto_por_vendedor;

INSERT INTO produto_por_vendedor (Terceiro_idTerceiro, Produto_idProduto, quantidade) VALUES
	(1, 4, 10);
    
-- Inserindo dados de estoque

DESC estoque;

INSERT INTO estoque (locacao, endereco) VALUES
	('Box B, 203', 'Armazem A'),
    ('Box A, 123', 'Armazem B'),
    ('', 'Armazenado por terceiro');
    
-- Inserindo dados de estoque dos produtos

DESC estoque_do_produto;

INSERT INTO estoque_do_produto (Produto_idProduto, Estoque_idEstoque, quantidade) VALUES
	(1, 1, 22),
    (2, 1, 32),
    (3, 2, 10),
    (4, 3, 21);
    
-- Inserindo pedidos

DESC pedido;

INSERT INTO pedido (status, descricao, Cliente_idCliente, Frete, valor_total) VALUES
	('Em andamento', '', 1, 25.60, 300.00),
    ('Processando', '', 2, 34.00, 500.00),
    ('Enviado', '', 3, 0.00, 70.00),
    ('Entregue', 'Finalizado', 3, 20.00, 80.00);
    
-- Inserindo entrega

DESC entrega;

INSERT INTO entrega (cod_rastreio, data_entrega, data_saida, status, transportadora, idPedido) VALUES
	('FGFG56565', NULL, NULL, 'Em separação', 'Correios', 1),
    ('FGFG56565', NULL, NULL, 'Aguardando', 'Correios', 2),
    ('FGFG56565', '2007-05-08', NULL, 'Saiu para entrega', 'Correios', 3),
    ('FGFG56565', '2007-05-08', '2007-05-18', 'Entregue', 'Correios', 4);
    
-- Inserindo pagamento

DESC pagamento;

INSERT INTO pagamento (idCliente, tipo, data_pagamento, id_cartao, codigo_pix, link_boleto, idPedido) VALUES
	('1', 'boleto', '2008-12-12', NULL, NULL, 'https://boleto.com', 1),
    ('2', 'boleto', '2008-12-12', NULL, NULL, 'https://boleto.com', 2),
    ('3', 'pix', '2008-12-12', NULL, 'governo.etc', NULL, 3),
    ('3', 'cartao_credito', '2008-12-12', 3, NULL, NULL, 1);