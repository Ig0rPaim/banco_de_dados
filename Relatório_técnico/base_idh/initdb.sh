set -e

DB_NAME=$(psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -q -t -f /var/lib/postgresql/scripts/01_SQL_CreateDatabase.sql -c "SELECT current_database();")

DB_NAME=$(echo "$DB_NAME" | sed 's/ //g')

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$DB_NAME" -f /var/lib/postgresql/scripts/02_SQL_Tables.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$DB_NAME" -f /var/lib/postgresql/scripts/03_SQL_Populate.sql
