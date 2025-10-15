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

load data local infile 'C:/Users\tecmd\OneDrive\Documentos\Clientes1.csv'
into table Loja_clientes
fields terminated by';'
lines terminated by '\r\n'
ignore 1 rows;
