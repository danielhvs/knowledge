---
title:      "find command linux"
date:       2026-09-14T22:25:49-03:00
tags:       ["cli", "exec", "find", "gnu"]
identifier: "20260914T222549"
---

# Usage with `-exec`

It is very useful to run cmds with find and -exec. `{}` represents each output (file/dir) from find.
The syntax ends with the awkward `\;`
Samples:

dry run before rm:
`find . -name "*.mp3" -exec echo {} \;`

remove:
`find . -name "*.mp3" -exec rm -v {} \;`
