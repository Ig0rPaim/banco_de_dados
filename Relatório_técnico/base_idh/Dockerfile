FROM postgres

EXPOSE 5432

WORKDIR /var/lib/postgresql/scripts

COPY 01_SQL_CreateDatabase.sql /var/lib/postgresql/scripts

COPY 02_SQL_Tables.sql /var/lib/postgresql/scripts

COPY 03_SQL_Populate.sql /var/lib/postgresql/scripts

COPY initdb.sh /docker-entrypoint-initdb.d/
