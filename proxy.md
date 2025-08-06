proxy `manager`: squid: /etc/squid/squid.conf

/etc/squid/conf.d/debian.conf


`apt` file: /etc/apt/apt.conf.d/proxy.conf

```
Acquire::http::Proxy "http://user:password@10.70.124.16:3128/";
Acquire::https::Proxy "http://user:password@10.70.124.16:3128/";


sudo apt update -oAcquire::http::Proxy= -oAcquire::https::Proxy=
```

`npm` proxy config: npm config set proxy http://localhost:3128

`curl`
- via config: /home/danielhabib/.curlrc
- via cli: curl --proxy http://localhost:3128

`github` `ssh`: /home/danielhabib/.ssh/config : 
```
Host github.com
  Hostname ssh.github.com
  Port 443
  User git
  ProxyCommand nc -x localhost:3128 -Xconnect %h %p
```

`wget` /home/danielhabib/.wgetrc
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

env vars: 

touch 

/home/danielhabib/.custom_bash_profile

```
export http_proxy="http://localhost:3128"
export https_proxys="https://localhost:3128"
export ftp_proxy="ftp://localhost:3128"
```


docker: ~/.docker/config.json
add:
```
	"proxies": {
		"default": {
			"httpProxy": "http://localhost:3128",
			"httpsProxy": "https://localhost:3128",
			"noProxy": "*.test.example.com,.example.org,127.0.0.0/8"
		}
	}
```

to use docker and apt together we need to configure the proxy like so, namely using a different IP rather than `localhost`:
example: IP=172.21.134.LALA

RUN sudo curl --proxy http://172.21.134.LALA:3128 -LsSf https://astral.sh/uv/0.7.7/install.sh -o install-uv.sh
RUN apt -y update -oAcquire::http::Proxy=http://172.21.134.LALA:3128 -oAcquire::https::Proxy=http://172.21.134.LALA:3128 && apt -y upgrade && apt install -y curl rlwrap unzip
