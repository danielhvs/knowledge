# Clojure

## test

```bash
lein test :only namespace.bla.lol
```

```bash
lein test :only namespace.bla.lol/test-function-name
```

## flow-storm

```
user> (require '[flow-storm.api :as fs-api]) ;; the only namespace you need to require
user> (fs-api/local-connect) ;; will run the debbuger GUI and get everything ready
user> # rtrace are for calls
user> # ctrace are conditional
user> # trace are for fn
user> # try ^{:trace/when (<= 2 i 4)}
```

edn file java config

set up JAVA_HOME env var

deps.end

local files

https://clojure.org/reference/deps_edn#deps_local_root
