# Web socket

https://github.com/vi/websocat/releases

```
websocat ws://ws.vi-server.org/mirror/
```

# systemctl
only for the current user

```
systemctl --user status
```

systemctl:
enable enables for restart
start starts it
stop starts it

# switch user

sudo su <user>
sudo su - <user> (opens a new session?)

# user / group passwd

The /etc/passwd file is a plain-text database of local user accounts, with one line per user and seven colon-separated fields.

Each line has this general format:
username:password:UID:GID:comment:home_directory:login_shell
Field meanings:
    username – Login name the user types (must be unique, up to 32 chars on most systems).
    password – Usually just x or * today; real encrypted password lives in /etc/shadow.
    UID – Numeric user ID that the kernel actually uses to identify the user (e.g. 0 for root, 1000+ for normal users).
    GID – Primary group ID, matching a group in /etc/group.
    comment (GECOS) – Free-form info about the user (full name, phone, etc.).
    home_directory – Absolute path to the user’s home, e.g. /home/alice.
    login_shell – Path to the user’s default shell, e.g. /bin/bash, /bin/zsh, or /usr/sbin/nologin.
# tar
a directory:
tar -cvzf archive_name.tar.gz /path/to/directory

WARNING! be inside the dir and use relative path!
like so:
/home/danielhabib/lol $ tar -cvzf archive_name.tar.gz the-dir
