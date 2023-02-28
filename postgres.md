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
