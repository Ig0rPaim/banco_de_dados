FROM postgres

EXPOSE 5432

WORKDIR /var/lib/postgresql/scripts

COPY 01_SQL_CreateDataBase.sql /var/lib/postgresql/scripts

COPY 02_DDL.sql /var/lib/postgresql/scripts

COPY 03_largeRelationsInsertFile.sql /var/lib/postgresql/scripts

COPY initdb.sh /docker-entrypoint-initdb.d/