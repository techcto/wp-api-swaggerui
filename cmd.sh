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

    FILES="assets bin template tests swaggerauth.php swaggerbag.php swaggersetting.php swaggertemplate.php wp-api-swaggerui.php"

    mkdir -p output
    rm -f output/swagger.zip
    zip -r output/swagger.zip $FILES

    rm -f ../../devops/ami/wordpress/bin/swagger.zip
    cp output/swagger.zip ../../devops/ami/wordpress/bin/swagger.zip
}

$*