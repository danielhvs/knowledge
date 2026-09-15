---
title:      "linux command nohup"
date:       2026-09-14T22:30:38-03:00
tags:       ["cli", "gnu", "nohup", "ssh", "terminal"]
identifier: "20260914T223038"
---

# nohup to detach the shell

## writes both `stdout` and `stderr` to `nohup.out`:
`nohup ./your_script.sh &`

## to avoid writing to `nohup.out`, just redirect `stdout` and `stderr` to `/dev/null`:
`nohup ./your_script.sh > /dev/null 2>&1 &`
