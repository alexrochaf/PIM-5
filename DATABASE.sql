CREATE TABLE Hotel (
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nome VARCHAR(255) NOT NULL,
);

CREATE TABLE Usuario(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nome VARCHAR(255) NOT NULL,
Login VARCHAR(10) NOT NULL,
Senha VARCHAR(255) NOT NULL,
Hotel_Id INT FOREIGN KEY REFERENCES dbo.Hotel(Id),
);

CREATE table Hospede (
	Id  UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY not null,
	Nome varchar(100) not null,
	Celular varchar(20) not null,
	Telefone varchar(20) null,
	CPF varchar(14) not null,
	DataNascimento date not NULL,
    Rua varchar(255) NOT NULL,
	Numero INT NOT NULL,
	Complemento VARCHAR(255) NULL,
	Cep VARCHAR(255) NOT NULL,
	Bairro VARCHAR(255) NOT NULL,
	Estado_Id INT FOREIGN KEY REFERENCES Estado(Id) NOT NULL,
	Municipio INT FOREIGN KEY REFERENCES Municipio(Id) NOT NULL,
);

create table TipoQuarto (
	Id INT IDENTITY(1,1) PRIMARY KEY not null,
	Descricao varchar(40) not null,
	Valor decimal not null,
	Camas int not null,
	Hotel_Id INT FOREIGN KEY REFERENCES Hotel(Id) NOT NULL,
);


create table Quarto (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Tipo_Id INT FOREIGN KEY REFERENCES TipoQuarto(Id) not null,
	Numero int not null,
	Andar int not null,
	Estatus int not null,
	Hotel_Id INT FOREIGN KEY REFERENCES Hotel(Id) NOT NULL,
);

create table Hospedagen (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Entrada date not null,
	Saida date null,
	Estatus int not null,
	Hospede_Id UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Hospede(Id) not null,
	Quarto int foreign key references Quarto(id) not null,
	Valor decimal null,
);

-- Inserindo Hotel
INSERT INTO dbo.Hotel ( Nome )
VALUES ( 'LoroJose Hotels' -- Nome - varchar(255)
       )

	   -- Inserindo User
	   INSERT INTO dbo.Usuario ( 
	                               Nome ,
	                               Login ,
	                               Senha ,
	                               Hotel_Id
	                           )
	   VALUES (
	              'Alexsandro Rocha Fernandes' , -- Nome - varchar(255)
	              'alex' , -- Login - varchar(10)
	              'alex' , -- Senha - varchar(255)
	              1    -- Hotel_Id - int
	          )


-- Inserindo Tipos de Quartos
INSERT INTO TipoQuarto (Descricao, Camas, Valor, Hotel_Id) VALUES ('Single Room (Solteiro)', 01, 30.00,1)
INSERT INTO TipoQuarto (Descricao, Camas, Valor, Hotel_Id) VALUES ('Twin Room (Solteiro-2)', 02, 50.00,1)
INSERT INTO TipoQuarto (Descricao, Camas, Valor, Hotel_Id) VALUES ('Twin Room (Solteiro-3)', 03, 75.00,1)
INSERT INTO TipoQuarto (Descricao, Camas, Valor, Hotel_Id) VALUES ('Twin Room (Solteiro-4)', 04, 90.00,1)
INSERT INTO TipoQuarto (Descricao, Camas, Valor, Hotel_Id) VALUES ('Double Room (Casal)', 01, 50.00,1)
INSERT INTO TipoQuarto (Descricao, Camas, Valor, Hotel_Id) VALUES ('Double + Single Room (Casal + 1)', 01, 85.00,1)
INSERT INTO TipoQuarto (Descricao, Camas, Valor, Hotel_Id) VALUES ('Double + Twin Room (Casal + 2)', 01, 120.00,1)