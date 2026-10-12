---
title:      "git tag fetching"
date:       2026-09-29T16:51:01-03:00
tags:       ["fetch", "git", "pull", "tag"]
identifier: "20260929T165101"
---

Git tags, if they are not below the current branch(es), will just not appear from a regular `git pull`.

To fetch the tags one must run:

`git fetch --tags origin`

Only then the tags will become available.
