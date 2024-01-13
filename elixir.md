Tools and deps:

`asdf` 

```
sudo apt-get install inotify-tools xsltproc fop libncurses5-dev -y
```

compatibility-and-deprecations
https://hexdocs.pm/elixir/1.16.0/compatibility-and-deprecations.html

Create phoenix template generator
```
mix arquivo.install phx_new
```

Create a new phoenix project using a specific db. if not set it will use postgres.
```
mix phx.new forum --database sqlite3
```

Phoenix

router:
get "/", PageController, :xfn


controller:
This will call PageController.xfn function

html:
def xfn ...
    render(conn, :yyy, layout: false)
Then the :yyy atom will point  to controllers/page_html/yyy.html.heex

