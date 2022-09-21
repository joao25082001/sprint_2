
create database sprint_2;
use sprint_2;
create table empresa (
id_empresa int primary key auto_increment,
nome_empresa varchar(25),
cnpj char (12),
nome_fantasia varchar(50),
endereço varchar(100),
nome_responsavel varchar(30)
);
insert into empresa values
(null,'contex','000100011111','tecnologias ltda','av.paulista','fernando brandao da silva'),
(null,'atma','000100059875','comuc ltda','av.dom joao nery','felipe de jesus'),
(null,'atma','000107878789','serviços telecon ltda','hadock lobo','gustavo marcio');
create table funcionario(
id_func int primary key auto_increment,
nome_func varchar(45),
cpf char(10),
email varchar(80),
senha varchar(30),
setor varchar(25)
);
insert into funcionario values
(null,'silvio','5143760886','silvio@sptech.com','senhasilvio','Administração'),
(null,'giovanna','2587611485','giovanna@sptech.com','senhagi','marketing'),
(null,'julia','5212869452','juliana@sptech.com','senhaju','Recursos humano');
create table sensor(
id_sensor int primary key auto_increment
);
create table dados_lumi(
id_dado int primary key auto_increment,
luminosidade decimal (5,2),
data_hora datetime
);

insert into dados_lumi values
(null,300.89,'2022-09-20 21:43:11'),
(null,500.05,'2022-09-20 14:43:58'),
(null,300.00,'2022-09-20 18:43:55');
alter table funcionario add column fkempresa int;
alter table funcionario add foreign key funcionario(fkempresa) references empresa(id_empresa);
alter table funcionario add column fksensor int;
alter table funcionario add foreign key (fksensor) references sensor(id_sensor);
select * from funcionario;
select * from sensor;
select * from empresa;
select * from  dados_lumi;
alter table sensor add column fkdados int,
select * from empresa join funcionario on id_empresa = fkempresa;
select * from funcionario join sensor on id_sensor = fksensor;
