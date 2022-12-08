#!/bin/bash

# find the dir we exist within...
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# and cd into root project dir
cd ${DIR}/..

LINTCMD=$(go env GOPATH)/bin/golangci-lint

if ! which LINTCMD &>/dev/null; then
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
fi

exec $LINTCMD run --new-from-rev=490e2450418f2d55f0e912d548cbae3b1fbc8e83
