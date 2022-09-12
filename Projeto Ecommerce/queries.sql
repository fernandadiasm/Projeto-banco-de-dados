-- criação do banco de dados para o cenário de e-commerce

create database ecommerce;
use ecommerce;

-- tabela de cliente
-- autoincrementação gera um id automático
create table clients (
	idClient int auto_increment primary key,
    email varchar(30),
    first_name varchar(30) not null,
    middle_name varchar(30),
    last_name varchar(30) not null,
    CPF char(11) not null,
    date_of_birthday date not null,
    gender char(5) check (gender in ('F','M','Outro')),
    phone_number varchar(9),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

desc clients;

-- tabela de endereço do cliente
create table client_address(
	idAddress int auto_increment primary key, 
    idClient int,
    address_line1 varchar(10) not null,
    address_line2 varchar(10),
    postal_Code varchar(10) not null,
    city varchar(15) not null,
    country varchar(10) not null,
    constraint fk_client_address foreign key (idclient) references clients (idClient)
);

ALTER TABLE client_address
CHANGE city city VARCHAR(15);

desc client_address;

-- tabela de pagamento
create table client_payment (
	idpayment int auto_increment primary key,
    idClient int,
    payment_type enum('Boleto','Cartão','Dois cartões', 'Pix') default 'Boleto' not null, 
    payment_value decimal (5,2),
	constraint fk_client foreign key (idclient) references clients (idClient)
    );
    
    ALTER TABLE client_payment
CHANGE payment_value payment_value decimal;
    
    desc client_payment;
    
-- tabela produto
-- size equivale a dimensão do produto
create table product (
	idProduct int auto_increment primary key,
    idSupplier int,
    name_product varchar(30) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedo','Livro','Alimento','Móveis') not null,
    product_value decimal (5,2),
    evaluation float default 0, 
    size varchar(10),
    constraint fk_supplier foreign key (idSupplier) references supplier(idSupplier)
);


-- tabela pedido
create table orders (
	idOrder int auto_increment primary key,
    idOrderClient int,
    idpayment int,
    order_status enum('Cancelado','Confirmado','Em processamento') default 'Em processamento' not null,
    order_description varchar(255),
    send_value float default 10,
	payment_cash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient),
     constraint fk_client_payment foreign key (idpayment) references client_payment(idpayment)
);

-- tabela estoque
create table productstorage (
	idProdStorage int auto_increment primary key,
    storage_location varchar (255) not null,
    quantify int default 0
    );
    
-- tabela fornecedor
create table supplier (
	idsupplier int auto_increment primary key,
    social_name varchar (255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
    );
    
-- tabela vendedor
create table seller (
	idseller int auto_increment primary key,
    social_name varchar (255) not null,
    abs_name varchar(255),
    CNPJ char(15) not null,
    contact char(11) not null,
    location varchar(255),
    constraint unique_cnpj_seller unique (CNPJ)
    );
    
    drop table seller;
    desc seller;

-- tabela produtos/vendedor
create table productseller (
	idPseller int,
    idProduct int,
    prod_quantify int default 1,
    primary key (idPseller, idProduct),
    constraint fk_productseller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product foreign key (idProduct) references product(idproduct)
);

create table product_order(
	idProductOrder int,
    idPOorder int, 
    po_quantify int default 1 not null,
    po_status enum ('Disponível', 'Indisponível') default 'Disponível' not null,
    primary key (idProductOrder, idPOorder),
    constraint fk_productorder_seller foreign key (idProductOrder) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storagelocation (
	idLproduct int,
    idLstorage int,
    location varchar (255) not null,
    primary key (idLproduct,idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
    constraint fk_storage_location_storage foreign key (idLproduct) references productstorage (idProdstorage)
    );