drop database THEHOST
go

create database THEHOST
go

use THEHOST
go

create table Hospedes (
	Id  UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY not null,
	Nome varchar(100) not null,
	Celular varchar(20) not null,
	Telefone varchar(20) null,
	CPF varchar(14) not null,
	Idade date not null
);

create table TipoQuarto (
	Id INT IDENTITY(1,1) PRIMARY KEY not null,
	Descricao varchar(40) not null,
	Valor decimal not null,
	Camas int not null,
)


create table Quartos (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Tipo INT FOREIGN KEY REFERENCES TipoQuarto(Id) not null,
	Numero int not null,
	Andar int not null,
	Estatus int not null,
);

create table Hospedagens (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Entrada date not null,
	Saida date null,
	Estatus int not null,
	Hospede UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Hospedes(Id) not null,
	Quarto int foreign key references Quartos(id) not null,
	Valor decimal null,
);

-- Inserindo Tipos de Quartos
INSERT INTO TipoQuarto (Descricao, Camas, Valor) VALUES ('Single Room (Solteiro)', 01, 30.00)
INSERT INTO TipoQuarto (Descricao, Camas, Valor) VALUES ('Twin Room (Solteiro-2)', 02, 50.00)
INSERT INTO TipoQuarto (Descricao, Camas, Valor) VALUES ('Twin Room (Solteiro-3)', 03, 75.00)
INSERT INTO TipoQuarto (Descricao, Camas, Valor) VALUES ('Twin Room (Solteiro-4)', 04, 90.00)
INSERT INTO TipoQuarto (Descricao, Camas, Valor) VALUES ('Double Room (Casal)', 01, 50.00)
INSERT INTO TipoQuarto (Descricao, Camas, Valor) VALUES ('Double + Single Room (Casal + 1)', 01, 85.00)
INSERT INTO TipoQuarto (Descricao, Camas, Valor) VALUES ('Double + Twin Room (Casal + 2)', 01, 120.00)

--Inserindo Quartos
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(01 , 01 ,01, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(02 , 01 ,01, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(03 , 01 ,03, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(04 , 01 ,04, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(05 , 01 ,03, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(06 , 02 ,05, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(07 , 02 ,07, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(08 , 02 ,05, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(09 , 02 ,07, 0);
INSERT INTO QUARTOS (NUMERO,ANDAR,Tipo,ESTATUS) VALUES(10 , 02 ,06, 0);

--Inserindo Clientes
INSERT INTO HOSPEDES(NOME, CPF, Celular, Telefone, Idade) VALUES ('Alexsandro Rocha Fernandes', '024.944.592.14', '(69)9.9212-0077','(69)3228-4566','09/04/1994')
INSERT INTO HOSPEDES (NOME, CPF, Celular, Idade) VALUES ('Fernando Augusto Ferreira', '024.914.232.24', '(69)9.8232-3237', '09/04/1994')
INSERT INTO HOSPEDES (NOME, CPF, Celular, Idade) VALUES ('Ricardo Ferreira Mendes', '021.344.222.24', '(69)9.9932-3237', '09/04/1994')

