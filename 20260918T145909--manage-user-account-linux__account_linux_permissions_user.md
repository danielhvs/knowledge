---
title:      "manage user account linux"
date:       2026-09-18T14:59:09-03:00
tags:       ["account", "linux", "permissions", "user"]
identifier: "20260918T145909"
---

#### In Linux we have users that have their home dirs at $HOME aka ~ aka /home/<user>

1. We can get information with:

```bash
getent passwd <user>
```

2. And we can delete with `userdel`;

```bash
sudo userdel -r <user>
```

2.1 From the man page:

```bash
       -r, --remove
           Files in the user's home directory will be removed along with the
           home directory itself and the user's mail spool. Files located in
           other file systems will have to be searched for and deleted
           manually.
```
