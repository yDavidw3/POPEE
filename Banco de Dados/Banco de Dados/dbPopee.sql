CREATE DATABASE dbPopee
GO

USE dbPopee;
GO

CREATE TABLE tbUsuario (
	idUsuario INT PRIMARY KEY IDENTITY (1,1)
	,nomeUsuario	NVARCHAR (150) NOT NULL
	,emailUsuario NVARCHAR (100) UNIQUE NOT NULL
	,senha_hash NVARCHAR (255) NOT NULL
	,Usuario_CriadoEM DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE tbSimulado (
 idSimulado INT PRIMARY KEY IDENTITY (1,1)
 ,anoSimulado CHAR (4) NOT NULL
 ,descricaoSimulado VARCHAR (150) 
 ,urlPdfSimulado NVARCHAR (250) NOT NULL
);

CREATE TABLE tbTentativa (
 idTentativa  INT PRIMARY KEY IDENTITY (1,1)
 ,acertoTentativa INT NOT NULL
 ,tempoConcluidoTentativa INT NOT NULL
 ,dataTentativa DATETIME2 DEFAULT SYSDATETIME() NOT NULL
 ,totalQuestaoTentativa INT NOT NULL 
 ,idUsuario INT FOREIGN KEY REFERENCES tbUsuario (idUsuario)  NOT NULL
 ,idSimulado INT FOREIGN KEY REFERENCES tbSimulado (idSimulado) NOT NULL
);

CREATE TABLE tbMateria  (
  idMateria INT PRIMARY KEY IDENTITY (1,1)
  ,nomeMateria NVARCHAR (100) NOT NULL
);

CREATE TABLE tbAssunto  (
  idAssunto INT PRIMARY KEY IDENTITY (1,1)
 ,tituloAssunto NVARCHAR (100) NOT NULL
 ,idMateria INT FOREIGN KEY REFERENCES tbMateria (idMateria) NOT NULL
);

CREATE TABLE tbAula  (
  idAula INT PRIMARY KEY IDENTITY (1,1)
 ,tituloAula NVARCHAR (100) NOT NULL
 ,descricaoAula NVARCHAR (150) NOT NULL
 ,urlAula NVARCHAR (250) NOT NULL
 ,duracaoAula TIME NOT NULL
 ,idAssunto INT FOREIGN KEY REFERENCES tbAssunto (idAssunto) NOT NULL
);

CREATE TABLE tbUsuarioAula  (
  idUsuarioAula INT PRIMARY KEY IDENTITY (1,1)
 ,assistidoUsuarioAula BIT  DEFAULT 0 NOT NULL
 ,dataUltimaView DATETIME2 DEFAULT SYSDATETIME()
 ,idUsuario INT FOREIGN KEY REFERENCES tbUsuario (idUsuario) UNIQUE NOT NULL
 ,idAula INT FOREIGN KEY REFERENCES tbAula (idAula) UNIQUE NOT NULL
);

