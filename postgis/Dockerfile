FROM postgis/postgis:9.6-3.1-alpine

RUN mkdir -p /docker-entrypoint-initdb.d

ADD ./initDB.sql /docker-entrypoint-initdb.d/initDB.sql

