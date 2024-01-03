proxy `manager`: squid: /etc/squid/squid.conf

`apt` arquivo: /etc/apt/apt.conf.d/proxy.conf

`npm` proxy config: npm config  set proxy http://localhost:3128

`curl`
- via config: $HOME/.curlrc
- via cli: curl --proxy http://localhost:3128

`github` `ssh`: $HOME/.ssh/config: 
```
Host github.com
  Hostname ssh.github.com
  Port 443
  User git
  ProxyCommand nc -x localhost:3128 -Xconnect %h %p
```

`wget` $HOME/.wgetrc
```
use_proxy = on
http_proxy = http://localhost:3128
https_proxy = http://localhost:3128
ftp_proxy = http://localhost:3128
```

