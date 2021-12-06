create database SP_MADICAL_GRUP_Fe
go 

use SP_MADICAL_GRUP_Fe
go
--DDL inicio--
create table instituicao(
idIstituição smallint primary key identity,
nomeInstuicao varchar(50)not null,
endereco varchar(50) not null,
razaoSocial varchar(100) not null,
CNPJ varchar(18) not null unique
);
create table tipoUsuario(
idTipoUsuario tinyint primary key identity,
tituloTipoUsuario varchar(100) not null unique,
);
CREATE TABLE especializacao(
idEspecializacao smallint primary key identity,
tipoEspecializacao varchar(50) not null
);
create table situacao(
idSituacao smallint primary key identity,
descricao varchar(50) not null

)
-- Criando o usuarios pois vou precisar de seu id na table consulta 

create table usuario(
idUsuario smallint primary key,
idTipoUsuario tinyint foreign key references tipoUsuario(idTipoUsuario),
nomeUsuario varchar(50) not null,
emailUsuario VARCHAR(200) not null unique,
senhaUsuario VARCHAR(20) not null
)
create table paciente(
idPaciente smallint primary key identity,
idUsuario smallint foreign key references usuario(idUsuario),
dataNasc datetime not null,
CPF varchar(11) not null UNIQUE,
RG VARCHAR(15) not null UNIQUE,
Telefone VARCHAR(15),
enderecoPaciente VARCHAR(150) not null 
);
create table  medico(
idMedico smallint primary key identity,
idUsuario smallint foreign key references usuario(idUsuario),
idEspecializacao smallint foreign key references especializacao(idEspecializacao),
idInstituicao smallint foreign key references instituicao(idIstituição),
crm varchar(8) not null unique
);

CREATE TABLE consulta(
idConsulta smallint primary key identity,
idMedico smallint foreign key references medico(idMedico), 
idSituacao smallint foreign key references situacao(idSituacao),
idPaciente smallint foreign key references paciente(idPaciente),
dataConsulta date not null,
descricaoConsulta varchar(100)
);
GO