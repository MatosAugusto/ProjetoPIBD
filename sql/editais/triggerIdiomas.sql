-- Verificar diferença dos idiomas 
create or replace function BeforeInsertTrabalho()
returns trigger as $$
begin
    if new.idiomaPrincipal = new.idioma2 then
        raise 'Idioma secundário igual ao idioma principal';
        return NEW;
    end if;
    if new.idiomaPrincipal = new.idioma3 then
        raise 'Idioma terciário igual ao idioma principal';
        return NEW;
    end if;
    if new.idioma2 = new.idioma3 then
        raise 'Idioma terciário igual ao idioma secundário';
        return NEW;
    end if;
    return NEW;
end; 
$$
language plpgsql;

create or replace trigger t_after_ins_row_trabalho
after insert or update
on Trabalho
for each row execute function BeforeInsertTrabalho();

--Envia Mensagem de erro adequada caso seja inserido um idioma não aceito pelo Edital
create or replace function BeforeInsertIdiomaOnTrabalho()
returns trigger as $$
begin
    if new.idiomaPrincipal != 'P' then
        raise 'Idioma não aceito pelo Edital, por favor selecione um dos idiomas aceitos: P(Português), I(Inglês) ou E(Espanhol).';
        return NEW;
    end if;
    if new.idiomaPrincipal = 'I' then
        raise 'Idioma não aceito pelo Edital, por favor selecione um dos idiomas aceitos: P(Português), I(Inglês) ou E(Espanhol).';
        return NEW;
    end if;
    if new.idioma2 = 'E' then
        raise 'Idioma não aceito pelo Edital, por favor selecione um dos idiomas aceitos: P(Português), I(Inglês) ou E(Espanhol).';
        return NEW;
    end if;
    return NEW;
end; 
$$
language plpgsql;

create or replace trigger t_before_ins_row_trabalho
before insert or update
on Trabalho
for each row execute function BeforeInsertIdiomaOnTrabalho();

/*drop table Trabalho;
CREATE TABLE IF NOT EXISTS Trabalho (
    idTrabalho SERIAL NOT NULL,
    idiomaPrincipal CHAR NOT NULL,
    idioma2 CHAR,
    idioma3 CHAR,

    CONSTRAINT idiomaPTrabalho_check CHECK(idiomaPrincipal IN('P', 'I', 'E')),
    CONSTRAINT idioma2Trabalho_check CHECK(idioma2 IN('P', 'I', 'E')),
    CONSTRAINT idioma3Trabalho_check CHECK(idioma3 IN('P', 'I', 'E')),

    -- checagem: se o idioma principal eh x, os secundarios nao podem ser x

    CONSTRAINT trabalho_pk PRIMARY KEY(idTrabalho)
);

insert into Trabalho
(idiomaPrincipal, idioma2, idioma3)
values ('P', 'P', 'E');*/

/*insert into Trabalho
(idiomaPrincipal, idioma2, idioma3)
values ('P', 'I', 'P');

insert into Trabalho
(idiomaPrincipal, idioma2, idioma3)
values ('I', 'E', 'E');*/

/*insert into Trabalho
(idiomaPrincipal, idioma2, idioma3)
values ('P', 'I', 'E');*/
