proxy `manager`: squid: /etc/squid/squid.conf

`apt` file: /etc/apt/apt.conf.d/proxy.conf

```
Acquire::http::Proxy "http://user:password@10.70.124.16:3128/";
Acquire::https::Proxy "http://user:password@10.70.124.16:3128/";
```

`npm` proxy config: npm config set proxy http://localhost:3128

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


snap
```
sudo snap set system proxy.http="http://localhost:3128"
sudo snap set system proxy.https="http://localhost:3128"
```

env vars: $HOME/.bash_profile
```
export http_proxy="http://localhost:3128"
export https_proxys="https://localhost:3128"
export ftp_proxy="ftp://localhost:3128"
```

