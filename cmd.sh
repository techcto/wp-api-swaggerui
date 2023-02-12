#!/bin/bash
args=("$@")

tag(){
    VERSION="${args[1]}"
    git tag -a v${VERSION} -m ".1"
    git push --tags
}

bundle(){
    npm install
    npm run build
}

$*