-- criar banco de dados para o cenário E-commerce
CREATE DATABASE `ecommerce_dio`;

DROP DATABASE `ecommerce_dio`;


-- criando tabela cliente
create table clients(
		id_client int auto_increment primary key,
		Fname varchar(10),
		Minit char(3),
		Lname varchar(20),
		CPF char(11) not null,
		Address varchar(30),
		constraint unique_cpf_client unique (CPF)
);

-- deletando tabela cliente
 drop table clients;
 
 -- criar tabela produto
create table product(
		id_product int auto_increment primary key,
        Pname varchar(10),
        category enum('Eletrônico', 'Roupas',  'Móveis') not null,
        size varchar(10)
);

-- criar tabela pagamento
create table payments(
	id_clientent int,
        id_payment int,
        typePayment enum('Boleto', 'Dois cartões','Um cartão','pix'), 
        limitAvailable float,
        primary key(id_clientent, id_payment)
)

-- criar tabela pedido
create table orders(
	id_order int auto_increment primary key,
        id_order_client int,
        order_status enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
        order_escription varchar(255),
        send_value float default 10,
        payment_cash bool default false,
        constraint fk_orders_client foreign key(id_order_client) references clients(id_client)
);

-- criar tabela estoque
create table product_storage(
	id_Prod_storage int auto_increment primary key,
        storage_location varchar(255),
        quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
		id_supplier int auto_increment primary key,
        SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
		id_seller int auto_increment primary key,
        Socia_name varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(9),
        location varchar(255),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
);

create table product_seller(
		idP_seller int,
		idPproduct int,
		prodQuantity int default 1,
		primary key (idP_seller, idPproduct),
		constraint fk_productorder_seller foreign key (idP_seller) references seller(id_seller),
		constraint fk_productorder_product foreign key (idPproduct) references product(id_product)
	);
    
create table product_order(
		idP_oproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_product_seller foreign key (idPOproduct) references product(id_product),
        constraint fk_product_product foreign key (idPOorder) references orders(idOrder)
);

create table storage_location(
		idL_product int,
        idLstorage int,
        location varchar (500) not null,
        primary key (idL_product, idLstorage),
        constraint fk_storage_location_product foreign key (idL_product) references product(id_product),
		constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table product_supplier(
		idPs_Supplier int,
        idPsProduct int,
        quantity int not null,
        primary key (idPs_Supplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key (idPs_Supplier) references supplier(id_supplier),
		constraint fk_product_supplier_product foreign key (idPsProduct) references product(id_product)

);


insert into clients (Fname, Minit, Lname, CPF, Address)
		values('Antonio', 'X', 'Idonea', 12346789, 'rua N, cidade Verde'),
		('carlos', 'O', 'Santos', 987654321, 'rua alameda 289, Centro - cidade Verde'),
              ('Francisco', 'F', 'Souza', 45678913, 'avenida Calos de santos 10, cidade Verde'),
              ('Ana', 'S', 'Andrade', 789123456, 'rua mixirica 44, Centro - cidade Verde'),
              ('Lidia', 'G', 'Antares', 98745631, 'rua Xicara 10 - cidade Verde');
	      
	     
ALTER TABLE `clients`
CHANGE `Address` `Address` varchar(255) COLLATE 'utf8mb4_general_ci' NULL AFTER `CPF`;


              
          
insert into product (Pname, category, size) values
		    ('Notebook', 'Eletrônico',  null),
                  
                    ('Body', 'roupas',  null),
                    ('Microfone', 'Eletrônico',  null),
                    ('Sofá ',  'Móveis',  '3x57x80');
                    
                    
select * from clients;
select * from product;


insert into orders (id_order_client, order_status, order_escription, send_value, payment_cash) values
			(6, default, 'compra via aplicativo', null, 1),
            (7, default, 'compra via aplicativo', 50, 0),
            (9, 'Confirmado', null, null, 1),
            (10, default, 'compra via web site', 150, 0);


insert into productStorage (storageLocation, quantity) values
	  ('Anacleto Jarbas', 1000),
            ('Guamiranga', 500),
            ('Santos', 10),
            ('Santos', 100),
            ('Rio Branco', 10),
            ('Brasília', 60);