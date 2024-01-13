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

