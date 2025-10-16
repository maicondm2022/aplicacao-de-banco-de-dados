use  DB_03360A_Maicon;

create table TabelaA(
nome varchar(30));

create table TabelaB(
nome varchar(30));
insert into TabelaA
values
('Fernanda'),('Amanda'),('Jaqueline'),('Ana'),('Pedro'),('Carlos'),('Abel');
insert into TabelaB
values
('Fernando'),('Amarildo'),('Jaqueline'),('Ana'),('Pedro'),('Carla'),('Adriana');
select * from TabelaA;
select a.nome as Nome_TabelaA,b.nome as Nome_TabelaB
from TabelaA as a
inner join TabelaB as b on a.nome=b.nome;
select a.nome as Nome_TabelaA,b.nome as Nome_TabelaB
from TabelaA as a 
left join TabelaB as b on a.nome=b.nome;
select a.nome as Nome_TabelaA,b.nome as Nome_TabelaB
from TabelaA as a 
right join TabelaB as b on a.nome=b.nome;
select a.nome as Nome_TabelaA, b.nome Nome_TabelaB -- apelido da tabela
from TabelaA as a
left join TabelaB as b on a.nome=b.nome
union  -- uniao entre dois select 
select a.nome as TabelaA,b.nome Nome_TabelaB
from TabelaA as a -- TabelaA e a principal
right join TabelaB as b on a.nome=b.nome; -- direita  ,a relacionado com o b

select a.nome as Nome_TabelaA, b.nome Nome_TabelaB -- apelido da tabela
from TabelaA as a
left join TabelaB as b on a.nome=b.nome where b.nome is null
union  -- uniao entre dois select 
select a.nome as TabelaA,b.nome Nome_TabelaB
from TabelaA as a -- TabelaA e a principal
right join TabelaB as b on a.nome=b.nome where a.nome is null; -- direita  ,a relacionado com o b

select a.nome as Nome_TabelaA,b.nome as Nome_TabelaB
from TabelaB as b
left join TabelaA as a on a.nome=b.nome
where a.nome is null; -- mostra na tabela b o que e correspondente na a

select a.nome as Nome_TabelaA,b.nome as Nome_TabelaB
from TabelaB as b
right join TabelaA as a on a.nome=b.nome
where b.nome is null; -- mostra na tabela a o que e correspondente na b


