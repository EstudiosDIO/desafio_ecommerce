-- Banco de dados E-commerce

create database ecommerce;
use ecommerce;

create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF),
    Tipo ENUM ('PF', 'PJ')
);

select concat(Fname, ' ', Lname) as nome_completo, CPF, orderStatus as Status_do_Pedido from clients join orders on idClient = idOrderClient;

INSERT INTO clients (Fname, Minit, Lname, CPF, Address, Tipo) VALUES
('Carlos', 'A.', 'Silva', '12345678901', 'Rua das Flores, 123', 'PF'),
('Ana', 'B.', 'Souza', '23456789012', 'Av. Brasil, 456', 'PF'),
('João', 'C.', 'Pereira', '34567890123', 'Rua São Paulo, 789', 'PF'),
('Maria', 'D.', 'Almeida', '45678901234', 'Travessa Rio, 321', 'PF'),
('Lucas', 'E.', 'Gomes', '56789012345', 'Rua Bela Vista, 654', 'PF'),
('Fernanda', 'F.', 'Lima', '67890123456', 'Av. Central, 987', 'PF'),
('Rafael', 'G.', 'Ferreira', '78901234567', 'Praça das Nações, 111', 'PF'),
('Juliana', 'H.', 'Moraes', '89012345678', 'Rua das Palmeiras, 222', 'PF'),
('Empresa1', NULL, 'LTDA', '90123456789', 'Rua do Comércio, 333', 'PJ'),
('Empresa2', NULL, 'SA', '01234567890', 'Av. das Indústrias, 444', 'PJ');



create table produto(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    size varchar(10)
    
    
);

INSERT INTO produto (Pname, classification_kids, category, avaliação, size) VALUES
('Laptop', 0, 'Eletrônico', 4.5, 'Médio'),
('Camiseta', 0, 'Vestimenta', 4.2, 'G'),
('Boneca', 1, 'Brinquedos', 4.8, 'Pequeno'),
('Chocolate', 1, 'Alimentos', 4.7, 'Único'),
('Mesa', 0, 'Móveis', 4.3, 'Grande'),
('Smartphone', 0, 'Eletrônico', 4.6, 'Pequeno'),
('Calça', 0, 'Vestimenta', 4.1, 'M'),
('Carrinho', 1, 'Brinquedos', 4.9, 'Pequeno'),
('Biscoitos', 1, 'Alimentos', 4.4, 'Único'),
('Cadeira', 0, 'Móveis', 4.2, 'Médio');

select * from clients;

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum ('Cancelado', 'Confirmado', 'Em processamento') not null,
    orderDescription varchar(255),
    sendValue float default 10,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
    
    
);

INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue) VALUES
(1, 'Confirmado', 'Compra de 1 Laptop e 1 Smartphone', 15.0),
(2, 'Em processamento', 'Compra de 3 Camisetas', 12.5),
(3, 'Cancelado', 'Compra de 2 Bonecas e 1 Carrinho', 20.0),
(4, 'Confirmado', 'Compra de 5 Chocolates', 10.0),
(5, 'Em processamento', 'Compra de 1 Mesa e 2 Cadeiras', 25.0),
(6, 'Confirmado', 'Compra de 1 Calça e 2 Camisetas', 18.0),
(7, 'Cancelado', 'Compra de 1 Smartphone', 15.0),
(8, 'Confirmado', 'Compra de 2 Carrinhos e 3 Bonecas', 22.5),
(9, 'Em processamento', 'Compra de 4 Biscoitos', 10.0),
(10, 'Confirmado', 'Compra de 1 Mesa e 1 Cadeira', 20.0);

select * from orders;

create table payments(
	IdPayment int auto_increment primary key,
    IdClient int,
    IdOrder int,
    Type_Payment enum ('Cartão', 'Dinheiro', 'Boleto'),
    Valor float,
    constraint fk_payment_client foreign key (IdClient) references clients(idClient),
    constraint fk_payment_order foreign key (IdOrder) references orders(idOrder)
);

INSERT INTO payments (IdClient, IdOrder, Type_Payment, Valor) VALUES
(1, 1, 'Cartão', 1500.00),
(2, 2, 'Dinheiro', 200.00),
(3, 3, 'Boleto', 300.00),
(4, 4, 'Cartão', 50.00),
(5, 5, 'Dinheiro', 750.00),
(6, 6, 'Boleto', 100.00),
(7, 7, 'Cartão', 150.00),
(8, 8, 'Dinheiro', 220.00),
(9, 9, 'Boleto', 40.00),
(10, 10, 'Cartão', 400.00);


create table client_pf(
	id_client_pf int auto_increment primary key,
    CPF char(11) unique not null,
    data_nascimento date,
    IdClient int,
    constraint fk_clientepf_client foreign key (IdClient) references clients(idClient)
);

INSERT INTO client_pf (CPF, data_nascimento, IdClient) VALUES
('12345678901', '1985-06-15', 1),
('23456789012', '1990-03-22', 2),
('34567890123', '1988-12-10', 3),
('45678901234', '1995-07-08', 4),
('56789012345', '1980-11-30', 5),
('67890123456', '1992-04-25', 6),
('78901234567', '1987-01-14', 7),
('89012345678', '1993-09-05', 8),
('90123456789', '1989-10-20', 9),
('01234567890', '1982-08-17', 10);


create table client_pj(
	id_client_pj int auto_increment primary key,
    CNPJ char(14) unique not null,
    razao_social varchar(45),
    IdClient int,
    constraint fk_clientepj_client foreign key (IdClient) references clients(idClient)
);

INSERT INTO client_pj (CNPJ, razao_social, IdClient) VALUES
('12345678000101', 'Tech Solutions LTDA', 1),
('23456789000112', 'Alpha Comércio SA', 2),
('34567890000123', 'Beta Construções ME', 3),
('45678901000134', 'Gamma Transportes LTDA', 4),
('56789012000145', 'Delta Consultoria SA', 5),
('67890123000156', 'Epsilon Informática LTDA', 6),
('78901234000167', 'Zeta Educação ME', 7),
('89012345000178', 'Eta Alimentos LTDA', 8),
('90123456000189', 'Theta Móveis SA', 9),
('01234567000190', 'Iota Brinquedos ME', 10);



create table fornecedor(
	id_fornecedor int auto_increment primary key,
    razao_social char(45) unique not null,
    CNPJ char(14)
);

INSERT INTO fornecedor (razao_social, CNPJ) VALUES
('Fornecedor Alpha LTDA', '12345678000199'),
('Fornecedor Beta SA', '23456789000288'),
('Fornecedor Gamma ME', '34567890000377'),
('Fornecedor Delta LTDA', '45678901000466'),
('Fornecedor Epsilon SA', '56789012000555'),
('Fornecedor Zeta ME', '67890123000644'),
('Fornecedor Eta LTDA', '78901234000733'),
('Fornecedor Theta SA', '89012345000822'),
('Fornecedor Iota ME', '90123456000911'),
('Fornecedor Kappa LTDA', '01234567001000');


create table vendedor_terceiro(
	id_vendedor int auto_increment primary key,
    razao_social char(45) unique not null,
    local varchar(45)
);

INSERT INTO vendedor_terceiro (razao_social, local) VALUES
('Vendedor Alpha LTDA', 'São Paulo'),
('Vendedor Beta ME', 'Rio de Janeiro'),
('Vendedor Gamma LTDA', 'Belo Horizonte'),
('Vendedor Delta SA', 'Porto Alegre'),
('Vendedor Epsilon ME', 'Curitiba'),
('Vendedor Zeta LTDA', 'Salvador'),
('Vendedor Eta SA', 'Brasília'),
('Vendedor Theta ME', 'Recife'),
('Vendedor Iota LTDA', 'Fortaleza'),
('Vendedor Kappa SA', 'Manaus');


create table produtos_por_vendedor(
	id_vendedor int,
    id_produto int,
    quantidade int,
    constraint fk_id_vendedor foreign key (id_vendedor) references vendedor_terceiro(id_vendedor),
	constraint fk_id_produto foreign key (id_produto) references produto(idProduct)
);

INSERT INTO produtos_por_vendedor (id_vendedor, id_produto, quantidade) VALUES
(1, 1, 15),
(2, 2, 20),
(3, 3, 30),
(4, 4, 10),
(5, 5, 25),
(6, 6, 5),
(7, 7, 8),
(8, 8, 12),
(9, 9, 18),
(10, 10, 22);


create table fornecedor_produto(
	id_fornecedor int,
    id_produto int,
    constraint fk_idfornecedor foreign key (id_fornecedor) references fornecedor(id_fornecedor),
	constraint fk_fornecedor_id_produto foreign key (id_produto) references produto(idProduct)
);

INSERT INTO fornecedor_produto (id_fornecedor, id_produto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


create table produto_pedido(
	id_produto int,
    id_pedido int,
    constraint fk_pedido_produto foreign key (id_produto) references produto(idProduct),
	constraint fk_produto_pedido foreign key (id_pedido) references orders(idOrder)
);

INSERT INTO produto_pedido (id_produto, id_pedido) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


create table estoque(
	id_estoque int auto_increment primary key,
    localidade varchar(45)
);

INSERT INTO estoque (localidade) VALUES
('São Paulo'),
('Rio de Janeiro'),
('Belo Horizonte'),
('Porto Alegre'),
('Curitiba'),
('Salvador'),
('Brasília'),
('Recife'),
('Fortaleza'),
('Manaus');


create table produto_tem_estoque(
	id_produto int,
    id_estoque int,
    quantidade int,
    constraint fk_estoque_produto foreign key (id_produto) references produto(idProduct),
    constraint fk_id_estoque foreign key (id_estoque) references estoque(id_estoque)
);

INSERT INTO produto_tem_estoque (id_produto, id_estoque, quantidade) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 100),
(4, 4, 25),
(5, 5, 75),
(6, 6, 60),
(7, 7, 80),
(8, 8, 20),
(9, 9, 90),
(10, 10, 40);


create table entrega(
	id_entrega int auto_increment primary key,
    id_pedido int,
    id_client int,
    status_entrega varchar(45),
    codigo_rastreio varchar(45),
    constraint fk_entrega_pedido foreign key (id_pedido) references orders(idOrder),
    constraint fk_entrega_client foreign key (id_client) references clients(IdClient)
);

INSERT INTO entrega (id_pedido, id_client, status_entrega, codigo_rastreio) VALUES
(1, 1, 'Em trânsito', 'ABC123456789'),
(2, 2, 'Entregue', 'DEF234567890'),
(3, 3, 'Em processamento', 'GHI345678901'),
(4, 4, 'Cancelada', 'JKL456789012'),
(5, 5, 'Em trânsito', 'MNO567890123'),
(6, 6, 'Entregue', 'PQR678901234'),
(7, 7, 'Em processamento', 'STU789012345'),
(8, 8, 'Cancelada', 'VWX890123456'),
(9, 9, 'Em trânsito', 'YZA901234567'),
(10, 10, 'Entregue', 'BCD012345678');

-- Recuperação simples com SELECT Statement

SELECT * FROM clients;

-- Filtros com WHERE Statement 
-- Exemplo de consulta para recuperar CPF e Endereço de clientes com o nome "Carlos"

Select CPF, Address as Endereço from clients WHERE Fname = 'Carlos';

-- Criar expressões para gerar atributos derivados
-- Exemplo de consulta que calcula o total do pagamento (valor + envio) para os pedidos na tabela payments:

SELECT p.IdPayment as ID_Pagamento, p.IdClient as ID_Cliente, p.IdOrder as ID_Pedido, p.Valor + o.sendValue AS Total_Do_Pagamento
FROM payments p
JOIN orders o ON p.IdOrder = o.idOrder;

-- Definir ordenações dos dados com ORDER BY
-- Exemplo de consulta que ordena os produtos por avaliação em ordem decrescente:

SELECT Pname as Produto, avaliação FROM produto
ORDER BY avaliação DESC;

-- Condições de filtros aos grupos – HAVING Statement
-- Exemplo de consulta que encontra os vendedores que têm mais de 50 unidades de um produto em estoque:

SELECT p.idProduct, v.id_vendedor, SUM(pte.quantidade) AS Total_Quantidade
FROM produto p
JOIN produtos_por_vendedor ppv ON p.idProduct = ppv.id_produto
JOIN vendedor_terceiro v ON ppv.id_vendedor = v.id_vendedor
JOIN produto_tem_estoque pte ON p.idProduct = pte.id_produto
GROUP BY p.idProduct, v.id_vendedor
HAVING SUM(pte.quantidade) > 50;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Exemplo de consulta que junta as tabelas orders, clients, e entrega para obter informações sobre pedidos, incluindo nome do cliente, status do pedido e status da entrega

SELECT concat(c.Fname, ' ', c.Lname) as Nome_Completo, o.idOrder as ID_do_Pedido, o.orderStatus, e.status_entrega
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
JOIN entrega e ON o.idOrder = e.id_pedido;

-- Junção com múltiplas tabelas
-- Exemplo de consulta que junta as tabelas produto, fornecedor_produto e fornecedor para listar os produtos e seus respectivos fornecedores:

SELECT p.Pname as Produto, f.razao_social
FROM produto p
JOIN fornecedor_produto fp ON p.idProduct = fp.id_produto
JOIN fornecedor f ON fp.id_fornecedor = f.id_fornecedor;

-- Consultas com agregações
-- Exemplo de consulta que calcula o total de produtos vendidos por categoria e a média de avaliação de cada categoria de produto:

SELECT p.category as Categoria, COUNT(pp.id_produto) AS Total_Vendidos, ROUND(AVG(p.avaliação),2) AS Media_Avaliacao
FROM produto p
JOIN produto_pedido pp ON p.idProduct = pp.id_produto
GROUP BY p.category;

--  Consulta com subconsulta
-- Exemplo de consulta que retorna os pedidos cujo valor de envio é maior do que o valor médio dos pedidos:

SELECT * FROM orders
WHERE sendValue > (SELECT AVG(sendValue) FROM orders);

--  Consulta com IN para múltiplos valores
-- Exemplo de consulta que recupera pedidos com status "Confirmado" ou "Em processamento":

SELECT * FROM orders
WHERE orderStatus IN ('Confirmado', 'Em processamento');

-- Consulta com BETWEEN para intervalos
-- Exemplo de consulta para encontrar produtos com avaliações entre 4.2 e 4.5:

SELECT Pname as produto, avaliação FROM produto
WHERE avaliação BETWEEN 4.2 AND 4.5;

-- Consulta com DISTINCT
-- Exemplo de consulta que retorna os diferentes tipos de pagamento usados na tabela payments:

SELECT DISTINCT Type_Payment FROM payments;

-- Consulta com JOIN e filtros com WHERE
-- Exemplo de consulta que recupera pedidos que contêm produtos da categoria "Eletrônico" e cujo status de entrega é "Em trânsito":

SELECT o.idOrder, o.orderStatus, e.status_entrega, p.Pname as Produto
FROM orders o
JOIN produto_pedido pp ON o.idOrder = pp.id_pedido
JOIN produto p ON pp.id_produto = p.idProduct
JOIN entrega e ON o.idOrder = e.id_pedido
WHERE p.category = 'Eletrônico' AND e.status_entrega = 'Em trânsito';
