#!/bin/bash
/etc/init.d/postgresql start 
psql --command "CREATE USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_PASSWORD';" 
createdb -O $POSTGRES_USER $POSTGRES_DB 
psql $POSTGRES_DB --command "\i posts.sql"
exec "$@"
