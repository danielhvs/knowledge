# Postgres

# Links
1. https://www.postgresql.org/docs/9.5/functions-json.html
1. https://www.cybertec-postgresql.com/en/recursive-queries-postgresql/

General info about the tables

```sql
select column_name, is_nullable, data_type
  FROM information_schema.columns
 WHERE table_schema = 'theschamaname'
   AND table_name   = 'thename';
```

List databases 
```
\l
```

Connect to a database
```
\c db_name
```

List schemas
```

\dt

```

Describe tables (in a schema):
```
\dt schema_name.*
```

Describe a table (in a schema):
```
\d schema_name.table_name

```

Connection
```

\conninfo

```

User

```

SELECT current_user;

```

Views
```

select viewname from pg_catalog.pg_views where viewname like '%bla%';

```

indexes


```

SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    schemaname = 'schemaname'
ORDER BY
    tablename,
    indexname;

```

see connections

```
SELECT * FROM pg_stat_activity;
```

kill connections

```
SELECT
	pg_terminate_backend(pg_stat_activity.pid)
FROM
	pg_stat_activity
WHERE
	pg_stat_activity.datname = 'databasename'
	AND pid <> pg_backend_pid();

```

select as json

```

SELECT jsonb_pretty(to_jsonb(json_agg(table_name))) FROM table_name;
select row_to_json(row) from <schema>.<tablename> row

```



types

```

SELECT pg_typeof(your_variable);

```


terminate idle connections

```
SELECT
  pg_terminate_backend (pg_stat_activity.pid)
FROM
  pg_stat_activity
WHERE
  pg_stat_activity.datname = 'target_database'
  AND pid <> pg_backend_pid ();
```

select connections

```
SELECT
  pg_stat_activity.datname AS database_name,
  pg_stat_activity.pid,
  pg_stat_activity.usename AS username,
  pg_stat_activity.state,
  now () - pg_stat_activity.query_start AS duration
FROM
  pg_stat_activity
WHERE
  pg_stat_activity.state = 'idle';

```

Procedure names and content:

```
SELECT routine_schema As schema_name,
routine_name As procedure_name,
routine_definition
FROM information_schema.routines
WHERE routine_type = 'PROCEDURE';
```

use psql as postgres user in os:
```
sudo -u postgres psql
postgres=# \password postgres
Enter new password: 
Enter it again: 
postgres=# \q
```

