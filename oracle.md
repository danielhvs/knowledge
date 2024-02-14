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

limit: FETCH FIRST n ROWS ONLY
example
```
select * from log
order by created_at desc 
FETCH FIRST 5 ROWS ONLY
```


Execute procedure:
```
begin 
    schema.procedure_name(); 
end;
```

