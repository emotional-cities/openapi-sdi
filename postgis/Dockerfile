FROM postgis/postgis:12-3.0-alpine

RUN mkdir -p /docker-entrypoint-initdb.d

ADD ./sensorthings.sh /docker-entrypoint-initdb.d/sensorthings.sh
ADD ./initDB.sql /docker-entrypoint-initdb.d/initDB.sql