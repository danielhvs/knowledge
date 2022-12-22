#!/bin/bash

rm README.md
for f in $(ls *.md)
do
  echo "1. [$f]($f)" >> README.md
done
sort README.md > s && mv s README.md
