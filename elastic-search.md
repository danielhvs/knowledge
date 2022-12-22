# Links
https://hobo.house/2016/02/18/how-to-manually-clean-indexes-from-elasticsearch/

# Elasticsearch

Sometimes you want to remove specific indices, you can use curl against the API to do this.  First, query the indices that are available:

```bash
curl -GET http://localhost:9200/_cat/indices
```

You can delete them by name:

```bash
curl -XDELETE http://localhost:9200/logstash-2016.12.10
```

If you wanted to delete all indices:

```bash
curl -XDELETE http://localhost:9200/_all
```

