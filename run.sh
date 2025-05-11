#!/usr/bin/env bash

trap "rm -rf public resources/_gen" EXIT

cd site || exit 1
rm -rf public resources/_gen

hugo server --disableFastRender
