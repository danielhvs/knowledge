# Links
1. https://hobo.house/2016/02/18/how-to-manually-clean-indexes-from-elasticsearch/

# Elasticsearch

Indices are similar to databases in SQL dbs.
Sometimes you want to remove specific indices, you can use curl against the API to do this.  First, query the indices that are available:

```bash
curl -GET http://localhost:9200/_cat/indices
```

Search:

```
curl -GET http://localhost:9200/<index-name>/_search?pretty=true
```

You can delete them by name:

```bash
curl -XDELETE http://localhost:9200/logstash-2016.12.10
```

If you wanted to delete all indices:

```bash
curl -XDELETE http://localhost:9200/_all
```

# `must` vs `should`

`must` means: The clause (query) must appear in matching documents. These clauses must match, like logical `AND`

`should` means: At least one of these clauses must match, like logical `OR`
