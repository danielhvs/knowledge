---
title:      "postgres dump backup copy"
date:       2026-10-26T16:37:29-03:00
tags:       ["backup", "copy", "dump", "postgres"]
identifier: "20261026T163729"
---

## pg_dump

command to to store a pg db into a dump file to it backup

Example:

`pg_dump -h <host> -p <port> -U <user> -d $db -Fc -f /opt/backups/db.dump`

**`-Fc`** - output format "custom" (`-F` = format, `c` = custom). It's compressed by default. It's restored with `pg_restore`, not `psql`. It also lets `pg_restore` restore single tables or reorder objects. The other formats:
   - `p`: plain SQL, the default.
   - `d`: directory.
   - `t`: tar.
   - `c`: custom.

"Custom" is not something you define. It's a fixed binary archive format that ships with PostgreSQL. `pg_dump` writes it and `pg_restore` reads it. The name only means "Postgres's own format", as opposed to plain SQL, tar or directory.
