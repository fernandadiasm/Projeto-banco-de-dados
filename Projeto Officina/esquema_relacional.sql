-- criação do banco de dados para o cenário de e-commerce

create database officina;
use officina;

-- tabela de cliente
-- autoincrementação gera um id automático
create table clients (
	idClient int auto_increment primary key,
	first_name varchar(15) not null,
	middle_name varchar(15),
	last_name varchar(15) not null,
	CPF varchar(15) not null,
	phone_number char(9) not null,
    email varchar(35),
	address_line1 varchar(20) not null,
    address_line2 varchar(20),
    postal_Code varchar(10) not null,
    city varchar(15) not null,
    country varchar(10) not null,
    constraint unique_cpf_clients unique (CPF)
);

select * from clients;

alter table clients auto_increment=1;

-- tabela de mecânicos
create table mechanic (
	idMechanic int auto_increment primary key,
    registration varchar(10) not null,
    first_name varchar(15) not null,
    middle_name varchar(15),
    last_name varchar(15) not null,
    address_line1 varchar(20) not null,
    address_line2 varchar(20),
    phone_number char(9) not null,
    constraint unique_registration_mechanic unique (registration)
);


select * from mechanic;
desc table mechanic;


-- tabela de equipe
create table team (
	idTeam int auto_increment primary key,
    idMechanic int,
    speciality varchar(10),
    constraint fk_mechanic foreign key (idMechanic) references Mechanic(idMechanic)
);

select * from team;


-- tabela de serviço
create table service (
	idService int auto_increment primary key,
    idClient int,
    idTeam int,
    value_labor decimal(5,2) not null,
    service enum('Conserto', 'Revisão') default 'Conserto' not null,
    constraint fk_client foreign key (idClient) references clients(idClient),
    constraint fk_team foreign key (idTeam) references team(idTeam)
);

select * from service;

-- tabela de ordem de serviço
create table order_service (
	idOrderService int auto_increment primary key,
    idTeam int,
    solicitation char(10) not null,
    start_date date not null,
    end_date date not null,
    amount_pay decimal (5,2),
    status_service enum('Concluído','Em conserto') not null default 'Concluído',
	constraint fk_team_order foreign key (idTeam) references team(idTeam)
);



select * from order_service;

-- tabela de peças
create table product (
idProduct int auto_increment primary key,
product_type varchar(15) not null,
product_value decimal(5,2) not null
);

select * from product;


-- table da produtos por serviço
create table product_service (
	idProduct_service int auto_increment primary key,
    idOrderService int,
    constraint fk_order_service foreign key (idOrderService) references order_service(idOrderService)
    );
    
    select * from product_service;
