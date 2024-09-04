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

    # On WSL uname typically returns Linux
    if [[ "$(uname -s)" == "Linux" ]]; then
        7z a -r output/swagger.zip $FILES
    else
        zip a -r output/swagger.zip $FILES
    fi

    rm -f ../../devops/ami/wordpress/bin/swagger.zip
    cp output/swagger.zip ../../devops/ami/wordpress/bin/swagger.zip
}

$*