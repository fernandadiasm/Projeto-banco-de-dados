-- inserção de dados e queries

use ecommerce;

show tables;

-- clients
insert into clients (email,phone_number,address_line1,address_line2,postal_code,city,country) values
				('fernandadias.bio@hotmail.com','123456701','Rua A','número 36','21220222','Rio de Janeiro','Brasil'),
				('ramomferraz@hotmail.com','123456910','Rua A','número 36','21223322','Rio de Janeiro','Brasil'),
				('maria@hotmail.com','345678910','Rua D',null,'21220782','Santa Catarina','Brasil');
        
        
        
-- physical_clients
insert into  physical_clients(first_name,middle_name,last_name,CPF,date_of_birthday,gender) values
			       ('Fernanda','Dias','Menezes','12345678910','1997-06-27','F'),
                               ('Ramom','Ferraz','Dias','12345678654','1900-04-27','M'),
                               ('Maria',null,'Borges','98746372850','2000-08-22','F');
 select * from physical_clients; 
 
 
 
 -- legal_clients
insert into legal_clients(social_name,CNPJ) values
				('Empresa MillaSakura LTDA','984756389281736'),
				('Companhia das Letras','184756398756402'),
				('Rocco Jovens Leitores','194857643890');
select * from legal_clients;



-- clients_payment
insert into clients_payment (payment_type, payment_value) values
				('Boleto','100.00'),
                                (default,'59.99'),
                                ('Pix','559.25');
select * from clients_payment; 



-- product
insert into product (name_product, classification_kids, category, product_value, evaluation, size) values
				('Fone de ouvido', false,'Eletrônico','100.00','4',null),
				('Barbie', true,'Brinquedo','59.99','3',null),
				('Sofá retrátil', false,'Móveis','559.25','2','3x57x80');                    
select * from product; 



-- orders
insert into orders (idOrderclient, order_status, order_description, send_value, payment_cash) values
				(1,default,'Compra via aplicativo', null, 1),
				(2,default,'compra via Web site',50,0),
				(3,'Confirmado',null,null,1);
select * from orders;      
          
          
-- product_order
insert into product_order (idProductOrder, idPOorder, po_status, po_quantify) values
			 (1,1,'Indisponível',0),
                         (2,1,'Disponível',1),
                         (3,2,Default,5);
                    
 select * from product_order;                    
                    
-- productstorage
insert into productstorage (storage_location, quantify) values
			    ('Rio de Janeiro',1000),
                            ('São Paulo',200),
                            ('Minas Gerais','10');
   select * from productstorage; 
   
   

-- storagelocation
insert into storagelocation (idLproduct, idLstorage, location) values
			    (1,2,'RJ'),
                            (2,3,'GO');
 select * from storagelocation;                            
                            
     
     
-- supplier
insert into supplier (social_name,CNPJ,contact) values
			    ('Almeida e filhos','948576028195738','21098765789'),
                            ('Eletrônicos Silva','678576028195738','21096765789'),
                            ('Eletrônicos Balma','942346028195738','21098955789');
   select * from supplier;                            
                            
                     
-- seller
insert into seller(social_name, CNPJ, contact,location) values
			    ('Eletrônicos e cia','123456789098764','21987643829','RJ'),
                            ('Livros e cia','128473820964738','21983457067','RJ'),
                            ('Móveis e cia','928374021946578','21973456891','RJ');
  select * from seller; 


-- productseller
insert into productseller (idPseller, idProduct, prod_quantify) values
			    (1,6,80),
                            (2,1,10);
  select * from productseller; 
