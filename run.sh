#!/usr/bin/env bash

trap "rm -rf public resources/_gen" EXIT

cd site || exit 1
rm -rf public resources/_gen

## Remove EXIF Information From Images
find static/images -type "f" -exec mogrify -strip {} \;

## Spellchecker
cwd=$(pwd)
find content/posts/ -type "f" -name "*.md" -exec aspell --mode=markdown --lang=en --extra-dicts="$cwd"/aspell.dict check {} \;

hugo server --disableFastRender
