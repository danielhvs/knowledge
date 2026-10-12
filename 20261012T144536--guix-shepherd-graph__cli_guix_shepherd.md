---
title:      "guix shepherd graph"
date:       2026-10-12T14:45:36-03:00
tags:       ["cli", "guix", "shepherd"]
identifier: "20261012T144536"
---

# guix system shepherd-graph

Prints the Shepherd service graph of an OS `.scm` as Dot, without building it.

```sh
guix system shepherd-graph config.scm > g.dot
```

## g.dot sample

`A -> B` = A requires B: B starts first, stopping B stops A.

```dot
digraph "Guix shepherd-service" {
  "postgres postgresql" [label = "postgres postgresql", shape = box];
  "tomcat" [label = "tomcat", shape = box];
  "tomcat" -> "postgres postgresql";
  "postgres postgresql" -> "loopback";
}
```

`"postgres postgresql"` is one service with two provision names.

## Render

```sh
guix shell graphviz -- dot -Tsvg g.dot > g.svg
```
