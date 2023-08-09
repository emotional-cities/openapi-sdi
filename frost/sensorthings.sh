#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname sensorthings <<-EOSQL
	CREATE EXTENSION hstore;
	CREATE EXTENSION "uuid-ossp";
EOSQL