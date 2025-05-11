#!/usr/bin/env bash

## Remove EXIF Information From Images
# find static/images -type "f" -exec mogrify -strip {} \;

## Spellchecker
# echo sailing | aspell --lang=en create master "$(pwd)"/aspell.en.dict
# echo Segeln | aspell --lang=en create master "$(pwd)"/aspell.de.dict

# for lang in de en; do
#     find site/content/ -type "f" -name "*.$lang.md" -exec aspell --mode=markdown --lang=$lang --extra-dicts="$(pwd)"/aspell.$lang.dict check {} \;
# done

# hugo --source site --minify --cleanDestinationDir --enableGitInfo --gc --printPathWarnings --templateMetrics
rm -rf site/public
hugo --source site --baseURL '/' --cleanDestinationDir --enableGitInfo --gc
htmltest -c .htmltest.yml
