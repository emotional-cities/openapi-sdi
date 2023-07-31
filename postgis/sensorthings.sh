#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER "$STA_USER" LOGIN PASSWORD '$STA_PASSWORD';
	CREATE DATABASE sensorthings;
	GRANT ALL PRIVILEGES ON DATABASE sensorthings TO "$STA_USER";
	GRANT SELECT ON public.spatial_ref_sys to "$STA_USER";
	GRANT SELECT,INSERT,DELETE ON public.geometry_columns to "$STA_USER";
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname sensorthings <<-EOSQL
	CREATE EXTENSION postgis;
	CREATE EXTENSION hstore;
	CREATE EXTENSION "uuid-ossp";
EOSQL