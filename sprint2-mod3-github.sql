create database `resilia`;

use `resilia`;

select * from `alunos`;
select * from `entregas`;
select * from `fac_soft`;
select * from `fac_tech`;
select * from `turmas`;

-- alteração do id do joão de 0 para 10

update entregas
set id_alunos = 10
where id = 1000;

-- criaçao das tabelas

create TABLE `turmas` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255),
    `id_facilitador_soft` int,
    `id_facilitador_tech` INT,
    `curso` VARCHAR(255)
);

create TABLE `alunos` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(255),
    `id_turmas` int,
    `CPF` VARCHAR(11),
    `Email` VARCHAR(255),
    `Data_de_Nascimento` date,
    `Telefone` VARCHAR(15)
);

create TABLE `fac_soft` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(255),
	`frente` VARCHAR(50),
    `id_turmas` int
);

create TABLE `fac_tech` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(255),
	`frente` VARCHAR(4),
    `id_turmas` int
);

create TABLE `entregas` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Link_repositorio` VARCHAR(255),
	`Modulo_projeto` VARCHAR(50),
    `id_alunos` int,
    `Conceito` VARCHAR(255)
);

-- populando as tabelas

-- entregas

INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1000,'https://github.com/joao/projeto1','modulo 1',0,'colocou tudo em prática');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1001,'https://github.com/maria/projeto1','modulo 1',1,'pronto');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1002,'https://github.com/paulo/projeto1','modulo 1',2,'provou seu diferencial');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1003,'https://github.com/jose/projeto1','modulo 1',3,'pronto');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1004,'https://github.com/mariana/projeto1','modulo 1',4,'provou seu diferencial');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1005,'https://github.com/roberto/projeto1','modulo 1',5,'colocou tudo em prática');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1006,'https://github.com/rafael/projeto1','modulo 1',6,'provou seu diferencial');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1007,'https://github.com/luciano/projeto1','modulo 1',7,'pronto');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1008,'https://github.com/gabriella/projeto1','modulo 1',8,'colocou tudo em prática');
INSERT INTO entregas(id,link_repositorio,modulo_projeto,id_alunos,conceito) VALUES (1009,'https://github.com/carme/projeto1','modulo 1',9,'provou seu diferencial');

-- turmas

INSERT INTO turmas(id,nome,id_facilitador_soft,id_facilitador_tech,curso) VALUES ('20220101','Dinossauro',101,102,'web dev');
INSERT INTO turmas(id,nome,id_facilitador_soft,id_facilitador_tech,curso) VALUES ('20220201','Dragão',103,104,'dados');

-- alunos

INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (10,'João','20220101',12345678911,'joao_novinho@hotmail.com','1996-05-12',5571999888771);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (1,'Maria','20220201',12345678912,'maria_92@icloud.com','1992-06-08',5511992345441);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (2,'Paulo','20220101',12345678913,'paulo_94@icloud.com','1994-06-08',5511956655441);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (3,'José','20220201',12345678914,'jose_98@icloud.com','1998-06-08',5511996690441);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (4,'Mariana','20220101',12345678915,'mariana_90@icloud.com','1990-06-08',5511996647341);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (5,'Roberto','20220201',12345678916,'roberto_00@icloud.com','1990-06-08',5511993615441);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (6,'Rafael','20220101',12345678917,'rafael_92@icloud.com','1992-06-08',5511988655441);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (7,'Luciano','20220201',12345678918,'luciano_95@icloud.com','1995-06-08',5511974455441);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (8,'Gabriella','20220101',12345678919,'gabriella_99@icloud.com','1999-06-08',5511981655441);
INSERT INTO alunos(id,nome,id_turmas,CPF,Email,Data_de_Nascimento,Telefone) VALUES (9,'Carme','20220201',12345678910,'carme_86@icloud.com','1986-06-08',5511988655441);

-- fac_soft

INSERT INTO fac_soft(id,nome,frente,id_turmas) VALUES (101,'Anna','soft','20220101');
INSERT INTO fac_soft(id,nome,frente,id_turmas) VALUES (103,'Bruna','soft','20220201');

-- fac_tech

INSERT INTO fac_tech(id,nome,frente,id_turmas) VALUES (102,'Leo','tech','20220101');
INSERT INTO fac_tech(id,nome,frente,id_turmas) VALUES (104,'Jarros','tech','20220201');

-- QUERY 1

select alunos.id, alunos.nome, entregas.conceito
from entregas
inner join alunos on entregas.id_alunos = alunos.id
where conceito = 'provou seu diferencial' or conceito = 'pronto';

-- QUERY 2

-- turma 1 (id = 20220101)
select id_turmas,
count(id)
from alunos
group by id_turmas
having id_turmas = 20220101;

-- turma 2 (id = 20220201)
select id_turmas,
count(id)
from alunos
group by id_turmas
having id_turmas = 20220201;

-- QUERY 3
-- nessa realmente não tem nenhum aluno com esses conceitos, por isso a tabela veio vazia

select alunos.id, alunos.nome, entregas.conceito
from entregas
inner join alunos on entregas.id_alunos = alunos.id
where conceito = 'ainda não está pronto' or conceito = 'chegando lá';

-- QUERY 4

select alunos.id_turmas, entregas.conceito, count(id_turmas)
from entregas
inner join alunos on entregas.id_alunos = alunos.id
where conceito = 'provou seu diferencial'
group by id_turmas;