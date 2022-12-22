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

