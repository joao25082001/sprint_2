CREATE DATABASE Luminar;
USE Luminar;

CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    nome_fantasia VARCHAR(45),
    cnpj VARCHAR(14),
    responsavel VARCHAR(45),
    email VARCHAR(45),
    telefone VARCHAR(11)
);

CREATE TABLE endereco(
	idEndereco INT PRIMARY KEY auto_increment,
    logradouro VARCHAR(45),
    numero INT,
    complemento VARCHAR(45),
    cep VARCHAR(8),
    cidade VARCHAR(20),
    estado VARCHAR(25),
    fkEmpresa INT, FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);


CREATE TABLE funcionario(
	idFuncionario INT auto_increment,
	cpf VARCHAR (11),
	nome VARCHAR (45),
	usuario VARCHAR (45),
	senha VARCHAR (45),
	setor VARCHAR (45),
	fkEmpresa INT,
	FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
	PRIMARY KEY (idFuncionario, fkEmpresa)
); 
-- Tabela Local
CREATE TABLE ambiente(
	idAmbiente INT PRIMARY KEY auto_increment, 
	metros_quadrados INT,
	qtd_sensor INT,
	fkFuncionario INT, 
	FOREIGN KEY (fkFuncionario) REFERENCES funcionario (idFuncionario)
);

-- Tabela sensor
CREATE TABLE sensor(
	idSensor INT PRIMARY KEY auto_increment,
	nome_sensor VARCHAR (45),
	fkAmbiente INT,
	FOREIGN KEY (fkAmbiente) REFERENCES ambiente (idAmbiente)
);

CREATE TABLE registro(
	idRegistro INT auto_increment,
    valor_luminosidade DECIMAL(4,2),
    data_hora DATETIME,
    fkSensor INT, FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor),
    PRIMARY KEY (idRegistro, fkSensor)
);

