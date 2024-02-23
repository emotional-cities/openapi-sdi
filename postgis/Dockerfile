FROM postgis/postgis:12-3.4-alpine

RUN mkdir -p /docker-entrypoint-initdb.d

ADD ./initDB.sql /docker-entrypoint-initdb.d/initDB.sql

