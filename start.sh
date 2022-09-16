#!/bin/bash
# Esse é o primeiro script a ser executado quando o container/replit executa.
# Atualmente, ele:
# - Cria a pasta do banco de dados (reaproveita se já existir)
# - Configura o postgresql
# - Levanta o postgresql
# - Cria o banco de dados $DBNAME
# - Aplica o arquivo main.sql em $DBNAME
# - Abre um psql interativo
#
# É esperado que o repositório esteja em /home/runner/ProjetoPIBD. O replit
# monta por padrão enquanto o Docker monta no script start-docker.sh
#
# As pastas de dados estão em:
# - dados /home/runner/postgres
# - socket /home/runner/postgres/...
# - logs /home/runner/postgres/postgresql.log

export DBNAME="teste"
export PGDATA="/home/runner/postgres"

if [ -d $PGDATA ]; then
  if [ -f $PGDATA/postmaster.pid ]; then pg_ctl stop; fi
else
  initdb --auth-host=trust
  sed -i "s/#unix_socket_directories = '\/run\/postgresql'/unix_socket_directories='\/home\/runner\/postgres'/" \
    $PGDATA/postgresql.conf
fi

pg_ctl -l $PGDATA/postgresql.log start
psql -c "CREATE DATABASE $DBNAME;" postgresql://127.0.0.1/postgres
psql -f main.sql postgresql://127.0.0.1/$DBNAME
psql postgresql://127.0.0.1/$DBNAME
bash
