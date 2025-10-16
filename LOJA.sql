use  DB_03360A_Maicon; 
create table Loja_clientes(
id_c int auto_increment primary key,
nome varchar (80) not null,
email varchar(50) ,
cidade varchar(50)
);
create table Loja_pedido(
id_p int auto_increment primary key,
id_cliente int,
produto varchar(50),
data_pedido date,
foreign key (id_cliente) references Loja_clientes (id_c)
);
-- importacao  
set global local_infile = 1;

load data local infile 'C:/Clientes.csv'
into table Loja_clientes
fields terminated by';'
lines terminated by '\r\n'
ignore 1 rows;
select * from Loja_clientes;
-- importacao
load data local infile 'C:/Pedidos.csv'
into table Loja_pedido
fields terminated by';'
lines terminated by '\r\n'
ignore 1 rows;
select * from Loja_pedido;
select nome,email from Loja_clientes;
select produto,data_pedido from Loja_pedido;
select nome,email from Loja_clientes where cidade='campina grande';
 select * from Loja_pedido where id_cliente <>2; 
 -- = igual
 -- > maior
 -- < menor
 -- >=maior igual
 -- <menor igual
 -- <> diferente 
 select nome from Loja_clientes order by nome asc;-- ordem ascendente
 select nome from Loja_clientes order by nome desc;-- ordem descendente
 select distinct cidade from Loja_clientes; -- item repetidos ele nao traz no relatorio,1 dado de cada vez
 select *from Loja_pedido limit 3;-- limite de ' n' pedidos
 select *from Loja_pedido where data_pedido > '2025-10-13' limit 3; -- limit = limitado a 
 select nome from Loja_clientes where nome like '%a';-- mostrar nome com a like= geral 

 select c.nome ,p.produto,p.data_pedido
 from Loja_pedido as p
 join Loja_clientes as c on p.id_cliente= c.id_c;
