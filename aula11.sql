use  DB_03360A_Maicon;
create table Escola_aluno(
AlunoID int primary key auto_increment,
Nome varchar (100) not null,
Sobrenome varchar (100) not null,
Email varchar(150) unique,
DatadeNascimento date,
Ativo boolean default true
);

create table Escola_Cursos(
CursoID int primary key auto_increment,
Titulo varchar(200) not null,
Descricao text,
CargaHoraria int,
Preco decimal(10,2)
);
show tables;
insert into Escola_aluno (Nome,Sobrenome,Email,DatadeNascimento)
values
('Ana','Costa','ana.costa@email.com','2000-01-10');
insert into Escola_aluno (Nome,Sobrenome,Email,DatadeNascimento,Ativo)
values
('Pedro','Lima','pedro.henrique@email.com','1998-03-22',false);
insert into Escola_aluno (Nome,Sobrenome,Email)
values
('Mariana','Souza','mariana.s@email.com');
insert into Escola_aluno (Nome,Sobrenome,Email,DatadeNascimento)
values
('Carlos','Gomes','carlos.g@email.com','2001-11-05');


insert into Escola_Cursos( Titulo,Descricao,CargaHoraria,Preco)
values
('Inrtoducaon ao SQL','Curso basico de sql para iniciante ',40,299.90);
insert into Escola_Cursos( Titulo,Descricao,CargaHoraria,Preco)
values
('Desenvolvimento Web com Pyton','Aprenda a criar aplicacao web com pyton e django','80',599.90);
insert into Escola_Cursos( Titulo,Descricao,CargaHoraria,Preco)
values
('Banco de dados avancado','topico avancado em otimizacao e modelagem',60,450.00);
select *from Escola_aluno;
select *from Escola_Cursos;
update Escola_aluno
set Email ='pedro.novo@email.com'
where AlunoID=2;
begin; -- tentativa desativar MAriana--
update Escola_aluno
set ativo = false
where AlunoID = 3;
select Nome,ativo from Escola_aluno where Nome='Mariana'; -- verificar a alteracaoantes de comitar(opcional,mas bom para demostracao--
rollback;-- desfaz a alteracao de ativo para mariana--
select Nome,ativo from Escola_aluno where Nome='Mariana';
update  Escola_Cursos
set
  CargaHoraria=45,
  Preco =320.00
  where CursoID = 1;
  commit; -- se nao estiver em modo auto commit--
  select * from Escola_aluno where Nome ='Pedro';
  
  begin;-- inicia a transacao
  -- excluir pedro--
  delete from Escola_aluno
  where AlunoID = 2;
  rollback;-- desfaz a exclusao de pedro--
  select * from Escola_aluno where Nome='Pedro';
  begin;
  delete from Escola_aluno 
  where ativo=true;
  select * from Escola_aluno;
  rollback;-- desfaz delete
    select * from Escola_aluno;
    truncate table Escola_aluno; -- TRUNCATE TABLE não usa WHERE e não permite ROLLBACK. É como 'limpar o quadro' da tabela de forma rápida e definitiva."

  select * from Escola_aluno;
