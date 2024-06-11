- table names

sqlite> .tables

- To show the schema for a given tablename:

.schema tablename

- diff

1. approach:
sqldiff db1.sqlite db2.sqlite

2. other
sqlite3 first.sqlite .dump >first.dump
sqlite3 second.sqlite .dump >second.dump
diff first.dump second.dump

source: https://stackoverflow.com/questions/2093263/how-to-compare-two-sqlite-databases-on-linux
