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
