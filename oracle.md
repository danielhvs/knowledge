metadata:
```sql
select
  column_name,
  table_name,
  nullable,
  data_type,
  data_length,
  data_precision,
  data_scale
from
  all_tab_columns
where
  table_name = 'the-column-name';
```

```sql
select
  *
from
  all_tab_columns
where
  table_name = 'the-column-name';
```


select procedure contents:
```sql
SELECT text
FROM user_source
WHERE name = 'caseSENSITIVEprocName'
ORDER BY line
```

