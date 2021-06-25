#!/bin/bash

set -e

if [ -z $1 ]; then
    echo "error: tag required as argument"
    exit 1
fi

if [ -z $2 ]; then
    echo "error: version required as argument"
    exit 1
fi

TAG=$1
VERSION=$2
MAJOR=""
MINOR=""

if [[ "${TAG}" =~ ^v([0-9]+)\.([0-9]+)(\.[0-9]+)?([-+].*)?$ ]]; then
    MAJOR=${BASH_REMATCH[1]}
    MINOR=${BASH_REMATCH[2]}
fi


if [ "${VERSION}" = "minor" ]; then
    echo "${MINOR}"
elif [ "${VERSION}" = "major" ]; then
    echo "${MAJOR}"
else
    echo "error: unrecognized version"
    exit 2
fi
