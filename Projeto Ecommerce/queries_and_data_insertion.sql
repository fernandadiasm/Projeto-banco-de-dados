-- inserção de dados e queries

use ecommerce;

show tables;

-- id client, Fname, Minit, LName, CPF, Address
insert into Clients (email, first_name, middle_name, last_name, CPF, date_of_birthday, gender, phone_number)
			values('fernandadias.bio@hotmail.com','Fernanda','Dias','Ferraz','123456789','1997-06-27','F','123456701'),
                  ('ramomferraz@hotmail.com','Ramom','Ferraz','Dias','123227789','1995-04-27','M','123456711'),
                  ('michael@hotmail.com','Michael','Flores','Assis','223456789','1951-01-13','M','123456910'),
                  ('Julia@hotmail.com','Julia','França','Monteiro','333456789','2000-12-25','F','125678910'),
                  ('maria@hotmail.com','Maria','Dias','Menezes','883456789','1952-08-22','F','345678910');

select * from clients;   
                  
-- idaddress, id client, address_line1, address_line2, postal_code,city,country
insert into client_address (idClient, address_line1, address_line2, postal_code, city, country) values	
							('Rua A','número 36','21220222','Rio de Janeiro','Brasil'),
                            ('Rua A','número 36','21223322','Rio de Janeiro','Brasil'),
                            ('Rua B','número 4','212456722','São Paulo','Brasil'),
                            ('Rua C','número 7','21220852','Rio das Ostras','Brasil'),
                            ('Rua D','número 15','21220782','Santa Catarina','Brasil');

delete from client_address
where idAddress =10;

select * from client_address; 

-- idpayment, idclient, payment_type, payment_value
insert into client_payment ( payment_type, payment_value) values
							('Boleto','13,90'),
                            (null,'50,00'),
                            ('Pix','6000,90'),
                            ('Cartão','10,20'),
                            ('Dois cartões','999,99');
                            
select * from client_payment; 
                            
insert into product (name_product, classification_kids, category, product_value, evaluation, size) values
					('Fone de ouvido', false,'Eletrônico','100.00','4',null),
                    ('Barbie', true,'Brinquedo','59.99','3',null),
                    ('Body Carters', true, 'Vestimenta','39.99','5',null),
                    ('As crônicas de gelo e fogo', false, 'Livro','15.50','5',null),
                    ('Sofá retrátil', false,'Móveis','559.25','2','3x57x80');
                    
select * from product; 
insert into orders (idOrderclient, orderStatus, orderdescription, sedValue, paymentCash) values
					(1,null,'Compra via aplicativo', null, 1),
                    (2,null,'compra via aplicativo',50,0),
                    (3,'Confirmado',null,null,1),
                    (4,null,'compra via web site',150,0);
