-- Inserção na tabela CandidatoAPalestrante
create or replace procedure InsertCandidatoAPalestrante (
    emailPrincipal VARCHAR(50),
    pessoaQueIndicou VARCHAR(50),
    miniCurriculo VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO CandidatoAPalestrante(emailPrincipal, pessoaQueIndicou, miniCurriculo)
	VALUES (emailPrincipal, pessoaQueIndicou, miniCurriculo);
	commit;
end;$$

-- Atualização da tabela CandidatoAPalestrante
create or replace procedure UpdateCandidatoAPalestrante (
    emailPrincipal VARCHAR(50),
    pessoaQueIndicou VARCHAR(50),
    miniCurriculo VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE CandidatoAPalestrante
	SET pessoaQueIndicou = pessoaQueIndicou AND 
        miniCurriculo = miniCurriculo
    WHERE emailPrincipal = emailPrincipal;
	commit;
end;$$

-- Inserção na tabela DescricaoCandidato
create or replace procedure InsertDescricaoCandidato (
    miniCurriculo VARCHAR(500),
    areaDeAtuacao VARCHAR(50),
    nome VARCHAR(50),
    foto VARCHAR(500)
)
language plpgsql
as $$
begin
	INSERT INTO DescricaoCandidato(miniCurriculo, areaDeAtuacao, nome, foto)
	VALUES (miniCurriculo, areaDeAtuacao, nome, foto);
	commit;
end;$$

-- Atualização da tabela DescricaoCandidato
create or replace procedure UpdateDescricaoCandidato (
    miniCurriculo VARCHAR(500),
    areaDeAtuacao VARCHAR(50),
    nome VARCHAR(50),
    foto VARCHAR(500)
)
language plpgsql
as $$
begin
	UPDATE DescricaoCandidato
	SET areaDeAtuacao = areaDeAtuacao AND 
        nome = nome AND 
        foto = foto
    WHERE miniCurriculo = miniCurriculo;
	commit;
end;$$

-- Inserção na tabela LinksTrabalhosCandPalest
create or replace procedure InsertLinksTrabalhosCandPalest (
    emailPrincipal VARCHAR(50),
    links VARCHAR(100)
)
language plpgsql
as $$
begin
	INSERT INTO LinksTrabalhosCandPalest(emailPrincipal, links)
	VALUES (emailPrincipal, links);
	commit;
end;$$

-- Atualização da tabela LinksTrabalhosCandPalest
create or replace procedure UpdateLinksTrabalhosCandPalest (
    emailPrincipal VARCHAR(50),
    links VARCHAR(100)
)
language plpgsql
as $$
begin
	UPDATE LinksTrabalhosCandPalest
	SET links = links AND 
    WHERE emailPrincipal = emailPrincipal;
	commit;
end;$$

-- Inserção na tabela EmailsSecundariosCandPalest
create or replace procedure InsertEmailsSecundariosCandPalest (
    emailPrincipal VARCHAR(50),
    emails VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO EmailsSecundariosCandPalest(emailPrincipal, emails)
	VALUES (emailPrincipal, emails);
	commit;
end;$$

-- Atualização da tabela EmailsSecundariosCandPalest
create or replace procedure UpdateCandidatoAPalestrante (
    emailPrincipal VARCHAR(50),
    emails VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE EmailsSecundariosCandPalest
	SET emails = emails AND 
    WHERE emailPrincipal = emailPrincipal;
	commit;
end;$$

-- Inserção na tabela TelefonesCandidatoPalest
create or replace procedure InsertTelefonesCandidatoPalest (
    emailPrincipal VARCHAR(50),
    telefone VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO TelefonesCandidatoPalest(emailPrincipal, telefone)
	VALUES (emailPrincipal, telefone);
	commit;
end;$$

-- Atualização da tabela TelefonesCandidatoPalest
create or replace procedure UpdateTelefonesCandidatoPalest (
    emailPrincipal VARCHAR(50),
    telefone VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE TelefonesCandidatoPalest
	SET telefone = telefone AND 
    WHERE emailPrincipal = emailPrincipal;
	commit;
end;$$

-- Inserção na tabela Abordagem
create or replace procedure InsertAbordagem (
    idCompostoPor INTEGER,
    emailPrincipal VARCHAR(50),
    dataHoraAbordagem date,
    conteudo VARCHAR(500),
    meioComunicacao1 VARCHAR(50),
    meioComunicacao2 VARCHAR(50),
    meioComunicacao3 VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO Abordagem(idCompostoPor,emailPrincipal, dataHoraAbordagem, conteudo, meioComunicacao1, meioComunicacao2, meioComunicacao3)
	VALUES (idCompostoPor,emailPrincipal, dataHoraAbordagem, conteudo, meioComunicacao1, meioComunicacao2, meioComunicacao3);
	commit;
end;$$

-- Atualização da tabela Abordagem
create or replace procedure UpdateAbordagem (
   
    idAbordagem INTEGER,
    emailPrincipal VARCHAR(50),
    dataHoraAbordagem date,
    conteudo VARCHAR(500),
    meioComunicacao1 VARCHAR(50),
    meioComunicacao2 VARCHAR(50),
    meioComunicacao3 VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE Abordagem
	SET emailPrincipal = emailPrincipal AND 
        dataHoraAbordagem = dataHoraAbordagem AND 
        conteudo = conteudo AND
        meioComunicacao1 = meioComunicacao1 AND
        meioComunicacao2 = meioComunicacao2 AND
        meioComunicacao3 = meioComunicacao3 

    	WHERE idAbordagem = idAbordagem;
	commit;
end;$$



-- Inserção na tabela CronogramaPalestra
create or replace procedure InsertCronogramaPalestra (
    idAbordagem INTEGER,
    tipoEvento VARCHAR(50),
    dataDaPalestra date,
    horaDaPalestra time,
    duracaoPrevista interval,
    numeroDeSala INTEGER,
    predio VARCHAR(50),
    tituloDaPalestra VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO CronogramaPalestra(tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio, tituloDaPalestra, idAbordagem)
	VALUES (tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio, tituloDaPalestra, idAbordagem);
	commit;
end;$$

-- Atualização da tabela CronogramaPalestra
create or replace procedure UpdateCronogramaPalestra (
   
    idAbordagem INTEGER,
    tipoEvento VARCHAR(50),
    dataDaPalestra date,
    horaDaPalestra time,
    duracaoPrevista interval,
    numeroDeSala INTEGER,
    predio VARCHAR(50),
    tituloDaPalestra VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE CronogramaPalestra
	SET tipoEvento = tipoEvento AND 
        dataDaPalestra = dataDaPalestra AND 
        horaDaPalestra = horaDaPalestra AND
        duracaoPrevista = duracaoPrevista AND
        numeroDeSala = numeroDeSala AND
        predio = predio AND
        tituloDaPalestra = tituloDaPalestra

    	WHERE idAbordagem = idAbordagem;
	commit;
end;$$




-- Inserção na tabela Palestras
create or replace procedure InsertPalestras (
    tituloDaPalestra VARCHAR(50),
    resumoDaPalestra VARCHAR(500),
    materialDeApoio VARCHAR(500),
)
language plpgsql
as $$
begin
	INSERT INTO Palestras(resumoDaPalestra, materialDeApoio, tituloDaPalestra)
	VALUES (resumoDaPalestra, materialDeApoio, tituloDaPalestra);
	commit;
end;$$

-- Atualização da tabela Palestras
create or replace procedure UpdatePalestras (
   
    tituloDaPalestra VARCHAR(50),
    resumoDaPalestra VARCHAR(500),
    materialDeApoio VARCHAR(500),
)
language plpgsql
as $$
begin
	UPDATE Palestras
	SET resumoDaPalestra = resumoDaPalestra AND 
        materialDeApoio = materialDeApoio

    	WHERE tituloDaPalestra = tituloDaPalestra;
	commit;
end;$$


-- Inserção na tabela PredioPalestra
create or replace procedure InsertPredioPalestra (
    numeroDeSala INTEGER,
    andar INTEGER,
    predio VARCHAR(50),
)
language plpgsql
as $$
begin
	INSERT INTO PredioPalestra(andar, predio, numeroDeSala)
	VALUES (andar, predio, numeroDeSala);
	commit;
end;$$

-- Atualização da tabela PredioPalestra
create or replace procedure UpdatePredioPalestra (
   
    numeroDeSala INTEGER,
    andar INTEGER,
    predio VARCHAR(50),
)
language plpgsql
as $$
begin
	UPDATE PredioPalestra
	SET andar = andar AND 
        predio = predio

    	WHERE numeroDeSala = numeroDeSala;
	commit;
end;$$


-- Inserção na tabela DocumentosCronogramaPalestra
create or replace procedure InsertDocumentosCronogramaPalestra (
    idAbordagem INTEGER,
    dataEntrega timestamp,
    tipo VARCHAR(50),
)
language plpgsql
as $$
begin
	INSERT INTO DocumentosCronogramaPalestra(dataEntrega, tipo, idAbordagem )
	VALUES (dataEntrega, tipo, idAbordagem);
	commit;
end;$$

-- Atualização da tabela DocumentosCronogramaPalestra
create or replace procedure UpdateDocumentosCronogramaPalestra (
   
    idAbordagem INTEGER,
    dataEntrega timestamp,
    tipo VARCHAR(50),
)
language plpgsql
as $$
begin
	UPDATE DocumentosCronogramaPalestra
	SET dataEntrega = dataEntrega AND 
        tipo = tipo

    	WHERE numeroDeSala = numeroDeSala;
	commit;
end;$$