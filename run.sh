#!/usr/bin/env bash

set -ex
trap "rm -rf public resources/_gen" EXIT

source .env

curl -L -o /tmp/hugo.pkg  https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_darwin-universal.pkg

sudo installer -pkg /tmp/hugo.pkg -target /
hugo version

cd site || exit 1
rm -rf public resources/_gen
hugo mod get -u

hugo server --watch --disableFastRender --cleanDestinationDir --forceSyncStatic
