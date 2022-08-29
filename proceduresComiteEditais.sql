-- Inserção na tabela Trabalho
create or replace procedure InsertTrabalho (
    titulo VARCHAR(64),
    palavraChave1 VARCHAR(16),
    palavraChave2 VARCHAR(16),
    palavraChave3 VARCHAR(16),
    idiomaPrincipal CHAR,
    status VARCHAR(16),
    idioma2 CHAR,
    idioma3 CHAR,
    descricao VARCHAR(200),
    palavraChave4 VARCHAR(16),
    palavraChave5 VARCHAR(16),
    tipoTrabalho VARCHAR(32)
)
language plpgsql
as $$
begin
	INSERT INTO Trabalho(titulo, palavraChave1, palavraChave2, palavraChave3, idiomaPrincipal, status, idioma2, idioma3, descricao, palavraChave4, palavraChave5, tipoTrabalho)
	VALUES (titulo, palavraChave1, palavraChave2, palavraChave3, idiomaPrincipal, status, idioma2, idioma3, descricao, palavraChave4, palavraChave5, tipoTrabalho);
	commit;
end;$$

-- Atualização da tabela Trabalho
create or replace procedure UpdateTrabalho (
    -- idEdital SERIAL, -- deixei sem esse por enquanto pq fiquei em dúvida se precisaria atualizar o edital, mas talvez sim? caso tenham colocado errado?

    -- idTrabalho SERIAL, -- usando o serial aqui deu erro na hora de rodar (em todos os procedures de update)
    idTrabalho INTEGER,
    titulo VARCHAR(64),
    palavraChave1 VARCHAR(16),
    palavraChave2 VARCHAR(16),
    palavraChave3 VARCHAR(16),
    idiomaPrincipal CHAR,
    status VARCHAR(16),
    idioma2 CHAR,
    idioma3 CHAR,
    descricao VARCHAR(200),
    palavraChave4 VARCHAR(16),
    palavraChave5 VARCHAR(16),
    tipoTrabalho VARCHAR(32)
)
language plpgsql
as $$
begin
	UPDATE Trabalho
	SET titulo = titulo AND 
        palavraChave1 = palavraChave1 AND 
        palavraChave2 = palavraChave2 AND
        palavraChave3 = palavraChave3 AND
        idiomaPrincipal = idiomaPrincipal AND
        status = status AND
        idioma2 = idioma2 AND
        idioma3 = idioma3 AND
        descricao = descricao AND
        palavraChave4 = palavraChave4 AND
        palavraChave5 = palavraChave5 AND
        tipoTrabalho = tipoTrabalho
    	WHERE idTrabalho = idTrabalho;
	commit;
end;$$


-- Inserção na tabela Artigo
create or replace procedure InsertArtigo (
    tipoArtigo VARCHAR(32)
)
language plpgsql
as $$
begin
	INSERT INTO Artigo(tipoArtigo)
	VALUES (tipoArtigo);
	commit;
end;$$

-- Atualização da tabela Artigo
create or replace procedure UpdateArtigo (
    -- idTrabalho SERIAL,
    idTrabalho INTEGER,
    tipoArtigo VARCHAR(32)
)
language plpgsql
as $$
begin
	UPDATE Artigo
	SET tipoArtigo = tipoArtigo
    	WHERE idTrabalho = idTrabalho;
	commit;
end;$$


-- Inserção na tabela VersaoSintese
create or replace procedure InsertVersaoSintese (
    idioma CHAR,
    texto TEXT,
    ehPrimario BOOLEAN
)
language plpgsql
as $$
begin
	INSERT INTO Artigo(idioma, texto, ehPrimario)
	VALUES (idioma, texto, ehPrimario);
	commit;
end;$$

-- Atualização da tabela VersaoSintese
create or replace procedure UpdateVersaoSintese (
    -- idTrabalho SERIAL,
    idTrabalho INTEGER,
    idioma CHAR,
    texto TEXT,
    ehPrimario BOOLEAN
)
language plpgsql
as $$
begin
	UPDATE VersaoSintese
	SET idioma = idioma AND
        texto = texto AND
        ehPrimario = ehPrimario
    	WHERE idTrabalho = idTrabalho;
	commit;
end;$$
-- Inserção na tabela IdiomasAceitos
CREATE or REPLACE PROCEDURE InsertIdiomasAceitos (
    idioma CHAR,
    idEdital INTEGER 
   
)
language plpgsql
as $$
begin
    INSERT INTO IdiomasAceitos(idioma, idEdital)
    VALUES (idioma, idEdital);
    commit;
end;$$



-- Atualização da tabela IdiomasAceitos
/*
Comentei pois não sei se faz sentido atualizar um idioma
CREATE or REPLACE PROCEDURE UpdateIdiomasAceitos (
    idioma CHAR,
    idEdital INTEGER 
   
)
language plpgsql
as $$
begin
    UPDATE IdiomasAceitos
    SET idioma = idioma AND 
    idEdital = idEdital;
    commit;
end;$$
*/


-- Inserção na tabela EixosApresentacao 
CREATE or REPLACE PROCEDURE InsertEixosApresentacao (
    idEixo INTEGER,
    idEdital INTEGER,
    nomeEixo VARCHAR(20)
    
)
language plpgsql
as $$
begin
    INSERT INTO EixosApresentacao(idEixo, idEdital, nomeEixo)
    VALUES (idEixo, idEdital, nomeEixo);
    commit;
end;$$

-- Atualização da tabela EixosApresentacao 
CREATE or REPLACE PROCEDURE UpdateEixosApresentacao (
    idEixo INTEGER,
    idEdital INTEGER,
    nomeEixo VARCHAR(20)
    
)
language plpgsql
as $$
begin
    UPDATE EixosApresentacao
    SET idEdital = idEdital AND
        nomeEixo = nomeEixo
        WHERE idEixo = idEixo;
    commit;
end;$$


-- Inserção na tabela SubEixosApresentacao
CREATE or REPLACE PROCEDURE InserSubEixosApresentacao (
    idEixo INTEGER,
    nomeSubEixo VARCHAR(20)
    
)
language plpgsql
as $$
begin
    INSERT INTO EixosApresentacao(idEixo, nomeSubEixo)
    VALUES (idEixo, nomeSubEixo);
    commit;
end;$$

-- Atualização da tabela SubEixosApresentacao 
CREATE or REPLACE PROCEDURE UpdateSubEixosApresentacao (
    idEixo INTEGER,
    nomeSubEixo VARCHAR(20)    
)
language plpgsql
as $$
begin
    UPDATE EixosApresentacao
    SET nomeSubEixo = nomeSubEixo
        WHERE idEixo = idEixo;
    commit;
end;$$
