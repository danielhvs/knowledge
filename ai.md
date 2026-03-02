#### Skill
1. is just a md file to prepend context to AI

#### claude code
1. claude code: model: opus 4.6 is good, but "slow". 17 bucks a month.
skills:

```bash
cp -r skills/prd ~/.claude/skills/
```

1. [ralph](https://github.com/snarktank/ralph) loop
Loop to reset the context: whenever context gets too big, the AI gets dumber.
So the loop, is to clean the context when a task is done
1. dev container
Start a docker container to run with --dangerosly-accept-all-permissions
