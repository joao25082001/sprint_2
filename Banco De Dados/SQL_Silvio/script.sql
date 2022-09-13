-- criando banco

CREATE DATABASE sprint1;

-- selecionando banco
USE sprint1;

-- CRIANDO TABELAS

CREATE TABLE cadastro (
id INT PRIMARY KEY auto_increment,
NomeEmpresa VARCHAR(60)NOT NULL,
CNPJ CHAR(14) NOT NULL,
NomeResponsavel VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
senha VARCHAR(100) NOT NULL
);
-- exibindo descrição da tabela
DESC cadastro;

-- criando segunda tabela
CREATE TABLE arduino (
id INT PRIMARY KEY auto_increment,
dataHora DATETIME,
luminosidade DOUBLE);

-- exibindo descrição da tabela
DESC arduino;

-- inseridno dados na tabela de login
INSERT INTO cadastro VALUES 
(NULL, 'sptech', '12345678901234', 'Fernando Brandão', 'fernando.brandao@sptech.school', md5('#Gf12345678900')),
(NULL, 'empresa2','12345678901234', 'João Silva', 'joao.silva@empresa2.com', md5('@ep12345678900'));

-- selecionando dados
SELECT * FROM cadastro;

-- inserindo dados na tabela arduino

INSERT INTO arduino VALUES 
(NULL, '2022-09-06 10:00:00', 450.25),
(NULL, '2022-09-01 13:30:00', 500.00);


-- selecionando dados
SELECT 
concat('O sensor identificou que na data e hora ',dataHora,' foi resgistrado que o ambiante estava com ',luminosidade,' Lúmens.') 
AS Retorno FROM arduino;

-- limpando tabelas após o teste

TRUNCATE table cadastro;
TRUNCATE table arduino;