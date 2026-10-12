---
title:      "java stack traces at runtime"
date:       2023-12-26T07:15:22-03:00
tags:       ["debug", "java", "stack"]
identifier: "20231226T071522"
---

jshell

build `build-classpath`

```
mvn dependency:build-classpath -DincludeTypes=jar -Dmdep.outputFile=.cp.txt
```

run it

```
jshell --class-path `cat .cp.txt`:target/classes
```

install without oracle:
https://adoptium.net/temurin/archive/?version=8

hibernate
https://cursojavanow.com.br/introducao_ao_hibernate/

# See all java stacks in runtime!

```bash
jstack <pid>
```
