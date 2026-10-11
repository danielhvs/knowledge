---
title:      "magit slow refresh diagnosis"
date:       2026-10-11T09:01:46-03:00
tags:       ["emacs", "magit", "performance"]
identifier: "20261011T090146"
---

Next time magit feels slow, turn on verbose refresh in that repo and read `*Messages*`.

`(setq magit-refresh-verbose t)`

1. Every refresh then prints the time of each section, so the slow one names itself.
2. Turn it off again with `(setq magit-refresh-verbose nil)`.

Baseline measured on dotfiles (2026-10-11): about 100ms per status refresh, from 15 to 30 git calls of about 3.5ms each. The number of commits does not matter. diff-hl adds about 0.8ms per open file buffer in the repo.
