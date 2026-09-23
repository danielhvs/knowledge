---
title:      "git compare branch commits"
date:       2026-09-23T08:45:06-03:00
tags:       ["branch", "commit", "compare", "git", "log"]
identifier: "20260923T084506"
---

This lists the commits that are on main but not on stg. Swap the two branch names to get the other direction.

`git log --oneline --left-right --cherry-pick origin/stg...origin/main`

1. < marks a commit that is only on stg, and > marks one that is only on main.
2. --cherry-pick hides commits whose changes already exist on both branches, such as earlier cherry-picks.
