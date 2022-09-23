-------------------Para inserir comitês --------------------------

-- Procedure InsertComissaoOrganizadora
create or replace procedure InsertComissaoOrganizadora(
    edicaoN varchar(10),
    siglaN varchar(8),
    anoN integer,
    paisN varchar(20)
)
language plpgsql
as $$
declare
    cursorComissao refcursor;
    comissaoEncont refcursor;
begin
    --PK: edicao e sigla
    INSERT INTO ComissaoOrganizadora(edicao, sigla, ano, pais)
    VALUES (edicaoN, siglaN, anoN, paisN);
end $$;

-- Procedure InsertComite
create or replace procedure InsertComite(
    tipo varchar(20),
    sigla varchar(8),
    descricao varchar(50)
)
language plpgsql
as $$
begin
    INSERT INTO Comite(tipo, sigla, descricao)
    VALUES (tipoN, siglaN, descricaoN);
end $$;
