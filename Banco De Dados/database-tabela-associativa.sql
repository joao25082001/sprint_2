CREATE DATABASE Luminar;
USE Luminar;

CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    nome_fantasia VARCHAR(45),
    cnpj VARCHAR(14),
    responsavel VARCHAR(45),
    telefone VARCHAR(11),
    email VARCHAR(45),
    senha VARCHAR(45)
);

CREATE TABLE endereco(
	idEndereco INT PRIMARY KEY auto_increment,
    logradouro VARCHAR(45),
    numero INT,
    bairro VARCHAR(45),
    complemento VARCHAR(45),
    cep VARCHAR(8),
    cidade VARCHAR(20),
    estado VARCHAR(25),
    fkEmpresa INT, FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE usuario(
	idUsuario INT auto_increment,
	cpf VARCHAR (11),
	nome VARCHAR (45),
	usuario VARCHAR (45),
	senha VARCHAR (45),
	setor VARCHAR (45),
	fkEmpresa INT
);

CREATE TABLE Local(
	idLocal INT PRIMARY KEY auto_increment, 
	metros_quadrados INT,
	qtd_sensor INT
);  

CREATE TABLE usuario_local(
FkLocal int,
foreign key (Fklocal) 
references  local(idLocal),
fkUsuario int,
foreign key (FkUsuario)
references usuario (idUsuario)
);

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY auto_increment,
	nome_sensor VARCHAR (45),
	fkLocal INT,
	FOREIGN KEY (fkLocal) REFERENCES Local (idLocal)
);

CREATE TABLE registro(
	idRegistro INT auto_increment,
    valor_luminosidade DECIMAL(4,2),
    data_hora DATETIME,
    fkSensor INT, FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor),
    PRIMARY KEY (idRegistro, fkSensor)
);

-- INSERTS
INSERT INTO empresa values
(NULL, 'C6', 'Banco C6 SA', '31872495000172', 'Joao Victor', '11912345678', 'joao@c6bank.com', md5('c61234')),
(NULL, 'Safra', 'Banco Safra SA', '58160789000128', 'Paulo Silva', '11922345678','paulo@safra.com', md5('safra1234')),
(NULL, 'SPtech', 'Faculdade de tecnologia bandeirantes', '07165496000100', 'Alessandro Rodrigues', '1135894043', 'alessandro@sptech.school', md5('#Gf1234'));

INSERT INTO endereco values
(null, 'Rua Haddock Lobo', 595,'Cerqueira Cesar', '', '01414001', 'São Paulo', 'SP', 3),
(null, 'Av. Nove de Julho', 3186, 'Jardim Paulista', '', '01406000', 'São Paulo', 'SP', 1),
(null, 'Av. Paulista', 2100, 'Bela Vista', '', '01406000', 'São Paulo', 'SP', 2);

INSERT INTO usuario VALUES
(null, '12345678912', 'Hariel Santos', 'hariel@c6bank.com', md5('hariel1234'), 'TI', 1),
(null, '12345678910', 'Larissa', 'larissa@safra.com', md5('larissa1234'), 'RH', 2),
(null, '12345678920', 'Paulo', 'paulo@sptech.school', md5('paulo1234'), 'TI', 3);



INSERT INTO local VALUES
-- id, metros_quadrados, qntSensor, fkFuncionário
(null, 10, 2, 1),
(null, 20, 4, 2),
(null, 8, 1, 3);


INSERT INTO sensor VALUES
-- id, nomeSensor, fkAmbiente
(null, 'luminosidade', 1),
(null, 'luminosidade', 2),
(null, 'luminosidade', 3);

INSERT INTO registro VALUES 
-- id, valorLuminosidade, data_hora, fkSensor
(null, 10.0, '2022-10-02 12:00:00', 1),
(null, 30.0, '2022-10-02 12:30:00', 2),
(null, 20.0, '2022-10-02 13:00:00', 3);

INSERT INTO usuario_local VALUES 
-- fklocal, fkusuario
(1, 1),
(1, 2),
(2, 3),
(2, 2),
(3, 1),
(3, 3);

-- selects das tabelas
select * from empresa;
select * from endereco;
select * from usuario;
select * from local;

select * from sensor;
select * from registro;

-- select dos campos + importantes
-- empresa
select nome from empresa;
select cnpj from empresa;
select responsavel from empresa;
select telefone from empresa;
select email from empresa;
select senha from empresa;

-- endereco
select logradouro from endereco;
select cep from endereco;
select complemento from endereco;
select cidade from endereco;
select estado from endereco;

-- usuario
select cpf from usuario;
select nome from usuario;
select usuario from usuario;
select senha from usuario;
select setor from usuario;

-- ambiente
select metros_quadrados  from local;
select qtd_sensor from local;

-- sensor
select nome_sensor from sensor;

-- registro 
select valor_luminosidade from registro;
select data_hora from registro;

-- ajustar o tamanho do decimal do valorLuminosidade
show tables;
select * from  usuario join empresa on fkempresa = idempresa;
select * from  usuario join empresa on fkempresa = idempresa join local on fuUsuario = idUsuario;
select * from  usuario 
join empresa on fkempresa = idempresa
 join local on 
fkUsuario = idUsuario 
join sensor on idLocal = fklocal;
select * from  usuario 
join empresa on fkempresa = idempresa
 join local on 
fkUsuario = idUsuario 
join sensor on idLocal = fkLocal join registro on idregistro = fksensor;


select * from usuario 
join usuario_local on fkUsuario = idUsuario join local on local_idlocal = idlocal;