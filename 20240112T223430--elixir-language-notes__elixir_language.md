---
title:      "elixir language notes"
date:       2024-01-12T22:34:30-03:00
tags:       ["elixir", "language"]
identifier: "20240112T223430"
---

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

pin operator for pattern matching:
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
