FROM postgres:11.1

RUN mkdir -p /raw-data
COPY ./nycflights13 /raw-data/nycflights13
COPY ./nycflights13/import.sh /docker-entrypoint-initdb.d/nycflights13.sh
