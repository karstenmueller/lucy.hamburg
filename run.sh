#!/usr/bin/env bash

trap "rm -rf public" EXIT

cd site || exit 1
rm -rf public

hugo server --disableFastRender
