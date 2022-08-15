DROP TABLE IF EXISTS Autor CASCADE;
DROP TABLE IF EXISTS Avaliador CASCADE;
DROP TABLE IF EXISTS FormatosCitacao CASCADE;
DROP TABLE IF EXISTS PrazoRespostaAvaliador CASCADE;
DROP TABLE IF EXISTS Avaliacao CASCADE;
DROP TABLE IF EXISTS PrazoAvaliacao CASCADE;
DROP TABLE IF EXISTS Avalia CASCADE;
DROP TABLE IF EXISTS ArquivosCertificado CASCADE;
DROP TABLE IF EXISTS AreasAptas CASCADE;
DROP TABLE IF EXISTS AreasInaptas CASCADE;
DROP TABLE IF EXISTS CertificadoAvaliador CASCADE;

-- Criação da tabela Autor
CREATE TABLE IF NOT EXISTS Autor(
	idPessoa BIGSERIAL NOT NULL,
	CONSTRAINT autor_pk PRIMARY KEY(idPessoa),
	CONSTRAINT idPessoa_fk FOREIGN KEY(idPessoa)
		REFERENCES Pessoa(idPessoa)
			ON DELETE CASCADE ON UPDATE CASCADE
); 

-- Criação da tabela FormatosCitacao 
CREATE TABLE IF NOT EXISTS FormatosCitacao(
	idAutor BIGSERIAL NOT NULL,
	forma VARCHAR(40),
	CONSTRAINT formatosCitacao_pk PRIMARY KEY (idAutor),
	CONSTRAINT idAutor_fk FOREIGN KEY (idAutor)
		REFERENCES Autor(idPessoa)
			ON DELETE CASCADE ON UPDATE CASCADE
);


-- Criação da tabela Avaliador
CREATE TABLE IF NOT EXISTS Avaliador(
	idAvaliador BIGSERIAL NOT NULL,
	dataEnvioConv DATE NOT NULL,
	dataRespConv DATE,
	CONSTRAINT avaliador_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
			ON DELETE CASCADE ON UPDATE CASCADE
);

-- Criação da tabela PrazoRespostaAvaliador
CREATE TABLE IF NOT EXISTS PrazoResportaAvaliador(
	dataEnvioConv DATE NOT NULL,
	prazoRespConv DATE,
	CONSTRAINT prazoResp PRIMARY KEY (dataEnvioConv)
);

-- Criação da tabela AreasAptas
CREATE TABLE IF NOT EXISTS AreasAptas(
	idAvaliador BIGSERIAL NOT NULL,
	areaApta VARCHAR(20),
	CONSTRAINT areasAptas_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
			ON DELETE CASCADE ON UPDATE CASCADE
);

-- Criação da tabela AreasInaptas
CREATE TABLE IF NOT EXISTS AreasInaptas(
	idAvaliador BIGSERIAL NOT NULL,
	areaInapta VARCHAR(20),
	CONSTRAINT areasInaptas_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
			ON DELETE CASCADE ON UPDATE CASCADE
);

-- Criação da tabela CertificadoAvaliador
CREATE TABLE IF NOT EXISTS CertificadoAvaliador(
	idAvaliador BIGSERIAL NOT NULL,
	codCertificado BIGSERIAL NOT NULL,
	CONSTRAINT certificadoAvaliador_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
			ON DELETE CASCADE ON UPDATE CASCADE
);

-- Criação da tabela ArquivosCertificado
CREATE TABLE IF NOT EXISTS ArquivosCertificado (

	idAvaliador BIGSERIAL NOT NULL,
	documento varchar(150),           	

	CONSTRAINT arquivosCertificado_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador) REFERENCES Avaliador(idAvaliador)


);

-- Criação da tabela Avalia
CREATE TABLE IF NOT EXISTS Avalia(

    idAvalia BIGSERIAL PRIMARY KEY,
    idTrabalho BIGSERIAL NOT NULL,
    idAvaliador BIGSERIAL NOT NULL,
    
    FOREIGN KEY (idTrabalho)
        REFERENCES Trabalho (idTrabalho)
        ON UPDATE CASCADE ON DELETE CASCADE,

    FOREIGN KEY (idAvaliador)
        REFERENCES Avaliador (idAvaliador)
        ON UPDATE CASCADE ON DELETE CASCADE,
    
    UNIQUE(idTrabalho,idAvaliador)
);

-- Criação da tabela PrazoAvaliacao
CREATE TABLE IF NOT EXISTS PrazoAvaliacao(

    dataAtribuicao DATE NOT NULL DEFAULT CURRENT_DATE,
    prazo TIMESTAMP NOT NULL,

    CONSTRAINT prazo_pk PRIMARY KEY (dataAtribuicao)
);

-- Criação da tabela Avaliacao
CREATE TABLE IF NOT EXISTS Avaliacao(

    idAvalia BIGSERIAL NOT NULL,
    dataAtribuicao  DATE NOT NULL,
    conflito boolean NOT NULL,
    dataResposta DATE NOT NULL DEFAULT CURRENT_DATE,
    justificativa VARCHAR(100),

    CONSTRAINT Avaliacao_pk PRIMARY KEY (idAvalia, dataAtribuicao),

    CONSTRAINT idAvalia_fk FOREIGN KEY (idAvalia)
        REFERENCES Avalia (idAvalia)
        ON UPDATE CASCADE ON DELETE CASCADE,
    
    CONSTRAINT dataAtribuicao_fk FOREIGN KEY (dataAtribuicao)
        REFERENCES PrazoAvaliacao (dataAtribuicao)
        ON UPDATE CASCADE ON DELETE CASCADE

);
