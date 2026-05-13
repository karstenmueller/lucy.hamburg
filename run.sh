#!/usr/bin/env bash

set -ex
trap "rm -rf public resources/_gen" EXIT

update_hugo() {
    version=$(hugo version | sed 's/^.*v\([0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*\).*$/\1/')
    if [ $version != $HUGO_VERSION ]; then
        echo "Hugo version '$version' gets updated to '$HUGO_VERSION'"
        curl -L -o /tmp/hugo.pkg  https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_darwin-universal.pkg
        sudo installer -pkg /tmp/hugo.pkg -target /
        hugo version
    fi
}

update_hugo

pushd site || exit 1

rm -rf public resources/_gen
/usr/local/bin/hugo mod get -u
/usr/local/bin/hugo server --watch --disableFastRender --cleanDestinationDir --forceSyncStatic

popd
