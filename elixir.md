Language
==========

iex example:
```
lol = fn map ->
  with {:ok, width} <- Map.fetch(map, :width),
       {:ok, height} <- Map.fetch(map, :height) do
    {:ok, width * height}
  end
end
lol.(%{width: 123, height: 999})
lol.(%{width2: 123, height: 999})
```

string interpolation
name = "Sean"
> "Sean"
"Hello #{name}"
> "Hello Sean"

string concatenation
name = "Sean"
> "Sean"
"Hello " <> name
> "Hello Sean"

coll:
tuples == vectors syntax = {1, 2, 3}
lists == linked lists syntax = [1,2,3]

list concat: ++
list subtract: --

pattern matching
{:ok, value} = {:ok, "Successful!"}
> {:ok, "Successful!"}
value
> "Successful!"

pin operator for pattern mathing:
everything is an equation so 1 = x will fail if x not-eq 1
use ^x to "test" the pattern
use ^ in "vars"
x = 1
> 1
^x = 2
> ** (MatchError) no match of right hand side value: 2
{x, ^x} = {2, 1}
> {2, 1}
x
> 2

`pin` with `case`
pie = 3.14
> 3.14
case "cherry pie" do
  ^pie -> "Not so tasty"
  pie -> "I bet #{pie} is tasty"
end
> "I bet cherry pie is tasty"

`cond`
When we need to match conditions rather than values 

`create` props to maps: use `put`
map = %{foo: "bar", hello: "world"}
map2 = Map.put(map, :lol, "baz")

`update` props to maps: use `|`
map = %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}
%{map | foo: "baz"}
%{foo: "baz", hello: "world"}

map,filter,reduce

map:
list = [1, 2, 3, 4]
Enum.map(list, fn x -> x * 2 end)
list |> Enum.map(fn x -> x * 2 end)

filter:
Enum.filter(list, fn x -> x > 2 end)
list |> Enum.filter(fn x -> x > 2 end)

reduce
Enum.reduce(list, fn x, acc -> x + acc end)
list |> Enum.reduce(fn x, acc -> x + acc end)

head/tail
hd [3.14, :pie, "Apple"]
3.14
tl [3.14, :pie, "Apple"]
[:pie, "Apple"]

destructuring
[head | tail] = [3.14, :pie, "Apple"]
[3.14, :pie, "Apple"]
head
3.14
tail
[:pie, "Apple"]

[head | tail] = [3.14, :pie, "Apple"]

Tools and deps:
==========


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
==========

```
router:
get "/", PageController, :xfn
    This will call PageController.xfn function
        def xfn ...
            render(conn, :yyy, layout: false)
                Then the :yyy atom will point  to controllers/page_html/yyy.html.heex
```

Create a CRUD:
==========

mix phx.gen.json <context> <schema> <db-table> [...pairs]
mix phx.gen.json Accounts User users name:string age:integer

In your command:

`Accounts` is the context/module in which to generate the files. It's typically used to group associated functionality. For example, if your application manages users, all functions and database interactions related to users would typically be in the Accounts context.
`User` is the name of the schema, which maps to the users table in your database.
`users` is the name of the database table where data will be stored.
`name:string` `age:integer` are the fields (with their types) to be added to the users table in your database and User schema.

This command will generate seven files:
A migration file to create the users table.
A User schema in lib/{app_name}/accounts/user.ex.
The Accounts context in lib/{app_name}/accounts.ex (if it doesn't already exist).
The user_view in lib/{app_name}_web/views/user_view.ex.
The user_controller in lib/{app_name}_web/controllers/user_controller.ex.
A scope to the router in lib/{app_name}_web/router.ex.
Test cases in test/{app_name}_web/controllers/user_controller_test.exs.

After running the generator command, run the database migration with mix ecto.migrate. This will apply the generated migration and create the users table in your database. Now, you have a ready-to-use JSON interface for managing users in your Phoenix application.

