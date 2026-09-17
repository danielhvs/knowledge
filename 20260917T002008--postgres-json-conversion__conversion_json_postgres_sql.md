---
title:      "postgres json conversion"
date:       2026-09-17T00:20:08-03:00
tags:       ["conversion", "json", "postgres", "sql"]
identifier: "20260917T002008"
---

##### To convert query results to a single json, we could use:

```sql
SELECT row_to_json(t)
FROM (SELECT id, name FROM users WHERE id = 1) t;
```

-- {"id": 1, "name": "Alice"}

##### To convert query results to a json array, we could use:

```sql
SELECT json_agg(t)
FROM (SELECT id, name FROM users) t;
```

-- [{"id": 1, "name": "Alice"}, {"id": 2, "name": "Bob"}]
