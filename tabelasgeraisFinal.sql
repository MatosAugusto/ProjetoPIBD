CREATE TABLE if not exists Evento(
    sigla varchar(8) primary key,
    nomeExtenso varchar(50) not null,
    pais varchar(20) not null
);

CREATE TABLE if not exists EventoPais(
    pais varchar (20) not null,
    estado varchar(20) not null,
    primary key(pais, estado)
);

CREATE TABLE if not exists EventoEstado(
    estado varchar(20) not null,
    cidade varchar(35) not null,
    primary key (estado, cidade)
);

CREATE TABLE if not exists EventoCidade(
    bairro varchar(35) not null,
    cidade varchar(35) not null,
    primary key (bairro, cidade)
);

CREATE TABLE if not exists EventoBairro(
    bairro varchar(35) not null,
    cep varchar(10) not null,
    primary key (bairro, cep)
);

CREATE TABLE if not exists EventoCep(
    cep varchar(10) not null,
    numero integer not null,
    logradouro varchar(25) not null,
    complemento varchar(25),
    primary key (cep, numero)
);

CREATE TABLE if not exists TiposTrabalhosAceitosEvento(
    tipoTrabalho varchar(20) not null primary key,
    sigla varchar(8) not null,
    foreign key(sigla) references Evento(sigla)
);

CREATE TABLE if not exists ComissaoOrganizadora(
    edicao varchar(10) not null primary key,
    sigla varchar(8) not null,
    ano integer not null,
    pais varchar(20) not null,
    foreign key(sigla) references Evento(sigla)
);

CREATE TABLE if not exists EstadoPais(
    pais varchar(20) not null,
    estado varchar(20) not null,
    primary key(pais, estado)
);

CREATE TABLE if not exists CidadeEstado(
    estado varchar(20) not null,
    cidade varchar(35) not null,
    primary key (estado, cidade)
);

CREATE TABLE if not exists Comite(
    tipo varchar(15) not null primary key,
    descrição varchar(50)
);

CREATE TABLE if not exists ComiteEvento(
    idComite integer GENERATED ALWAYS AS IDENTITY,
    sigla varchar(8) not null,
    tipo varchar(20) not null,
    foreign key(sigla) references Evento(sigla),
    unique(sigla, tipo)
);

/* 
DROP TABLE Pessoa;
DROP TABLE PessoaFiliacao;
DROP TABLE PessoaPais;
DROP TABLE PessoaEstado;
DROP TABLE PessoaCidade;
DROP TABLE PessoaBairro; 
DROP TABLE PessoaCodigoPostal;
DROP TABLE TelefonePessoa; 
DROP TABLE EmailPessoa; 
DROP TABLE Brasileiro;
DROP TABLE Estrangeiro; 
DROP TABLE EstrangeiroNroPassaporte; 
DROP TABLE Membro;
DROP TABLE CompostoPor; 
DROP TABLE MembroComite; 

execute os comandos acima para apagar todas as tabelas criadas
*/

--criação da tabela Pessoa
CREATE TABLE Pessoa (
    idPessoa SERIAL,
    primeiroNome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    CONSTRAINT Pessoa_pk PRIMARY KEY(idPessoa)
);

--criação da tabela PessoaFiliacao
CREATE TABLE PessoaFiliacao (
    idPessoa INTEGER NOT NULL,
    filiacao VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaFiliacao_pk PRIMARY KEY(idPessoa, filiacao),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela PessoaPais
CREATE TABLE PessoaPais (
    pais VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaPais_pk PRIMARY KEY(pais, estado)
);

--criação da tabela PessoaEstado
CREATE TABLE PessoaEstado (
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaEstado_pk PRIMARY KEY(estado, cidade)
);

--criação da tabela PessoaCidade
CREATE TABLE PessoaCidade (
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaCidade_pk PRIMARY KEY(cidade, bairro)
);

--criação da tabela PessoaBairro
CREATE TABLE PessoaBairro (
    bairro VARCHAR(50) NOT NULL,
    codigoPostal INTEGER NOT NULL,
    CONSTRAINT PessoaBairro_pk PRIMARY KEY(bairro, codigoPostal)
);

--criação da tabela PessoaCodigoPostal
CREATE TABLE PessoaCodigoPostal (
    codigoPostal INTEGER NOT NULL,
    numeroEndereco INTEGER NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    complemento VARCHAR(50),
    CONSTRAINT PessoaCodigoPostal_pk PRIMARY KEY(codigoPostal, numeroEndereco)
);

--criação da tabela TelefonePessoa
CREATE TABLE TelefonePessoa (
    idPessoa INTEGER,
    numeroTelefone INTEGER NOT NULL,
    ddi INTEGER NOT NULL,
    ddd INTEGER NOT NULL,
    prefixo INTEGER NOT NULL,
    CONSTRAINT TelefonePessoa_pk PRIMARY KEY(idPessoa, numeroTelefone, ddi, ddd, prefixo),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela EmailPessoa
CREATE TABLE EmailPessoa (
    idPessoa INTEGER,
    dominio VARCHAR(50) NOT NULL,
    login VARCHAR(50) NOT NULL,
    CONSTRAINT EmailPessoa_pk PRIMARY KEY(idPessoa, dominio, login),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela Brasileiro
CREATE TABLE Brasileiro (
    cpf INTEGER NOT NULL,
    idPessoa INTEGER,
    CONSTRAINT Brasileiro_pk PRIMARY KEY(cpf, idPessoa),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela Estrangeiro
CREATE TABLE Estrangeiro (
    idPessoa INTEGER,
    nroPassaporte VARCHAR(20) NOT NULL,
    CONSTRAINT Estrangeiro_pk PRIMARY KEY(idPessoa, nroPassaporte),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela EstrangeiroNroPassaporte
CREATE TABLE EstrangeiroNroPassaporte (
    nroPassaporte INTEGER,
    dataEmissao DATE NOT NULL,
    dataExpiracao DATE NOT NULL,
    govEmissor VARCHAR(50) NOT NULL,
    CONSTRAINT EstrangeiroNroPassaporte_pk PRIMARY KEY(nroPassaporte)
);

--criação da tabela Membro
CREATE TABLE Membro (
    idPessoa INTEGER,
    CONSTRAINT Membro_pk PRIMARY KEY(idPessoa),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela CompostoPor (nao ha atributo sigla)
CREATE TABLE CompostoPor (
    idCompostoPor SERIAL,
    idPessoa INTEGER,
    tipo VARCHAR(15),
    ehResponsavel CHAR(3) NOT NULL,
    ehCorresponsavel CHAR(3) NOT NULL,
    CONSTRAINT CompostoPor_pk PRIMARY KEY(idCompostoPor),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa),
    CONSTRAINT tipo_fk FOREIGN KEY (tipo) 
        REFERENCES Comite(tipo),
    CONSTRAINT ehResponsavel_check CHECK (ehResponsavel IN ('SIM', 'NÃO')),
    CONSTRAINT ehCorresponsavel_check CHECK (ehCorresponsavel IN ('SIM', 'NÃO')),
    CONSTRAINT idPessoa_tipo_unique UNIQUE(idPessoa, tipo)
);

--criação da tabela MembroComite
CREATE TABLE MembroComite (
    idCompostoPor INTEGER,
    CONSTRAINT MembroComite_pk PRIMARY KEY(idCompostoPor),
    CONSTRAINT idCompostoPor_fk FOREIGN KEY (idCompostoPor) 
        REFERENCES CompostoPor(idCompostoPor)
);
