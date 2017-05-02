#!/usr/bin/env bash

set -e

TEMP="$(mktemp -d)"
trap 'rm -rf "$TEMP"' EXIT

echo "A temporary folder has been created in:"
echo "  $TEMP"

yarn()
{
    command ${YARN:-yarn} $@
}

make_pkg()
{
    local name=$1
    shift

    local version=$1
    shift

    mkdir -p "$TEMP"/"$name"/
    printf '{ "name": "'"$name"'", "version": "'"$version"'", "license": "MIT", "dependencies": {} }' > "$TEMP"/"$name"/package.json
}

add_pkg_dep()
{
    local name=$1
    shift

    (cd "$TEMP"/"$name"/ && yarn add "$@")
}

yarn cache clean

YARN_CREATE_TESTCASE=1
