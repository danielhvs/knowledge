# Mongo DB

Basic 

```
show dbs
use <some-db>
show collections
```

Queries

```
use <db_name>
db.<collection_name>.find({}) <- {} is the filter
db.<collection_name>.find({}, {"x": 1}) <- second {} is a projection to show only selected fields
```

Updates
```
db.collection_name.updateOne({}, {"$set": {"field_name": "a_value"}})
db.collection_name.update({}, {"$unset": {"field_name": 1}})
```

Prune 
```
db.collection_name.deleteMany({})
```

Run [variety](https://github.com/variety/variety) in mongo

```
mongo schemaname --eval "var collection = 'collection_name'" variety.js
```

