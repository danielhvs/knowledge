# Docker

Login to [dockerhub](https://hub.docker.com/)

```
docker login
```

Copy stuff in

```
docker cp dev-resources/bla.js company_mongodb_1:/
```

Exec stuff

```
docker exec -it company_mongodb_1 bash
```

Show processes

```
docker ps --no-trunc
```


config file

```
/etc/default/docker
```

remove all
```
docker rm $(docker ps -aq)
```

show processes
```
docker ps -a
```

remove a process
```
docker rm 27fb0e7cacca
```

stop a process
```
docker stop 27fb0e7cacca
```

up a process (after rm)
```
docker compose -f file.yml -f file2.yml -p project up container-name
```

start a process
```
docker compose -f file.yml -f file2.yml -p project start container-name
```
