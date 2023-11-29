#!/usr/bin/env bash

if [[ "$1" == apache2* ]] || [ "$1" = 'php-fpm' ]; then
    if [ ! -e /usr/src/app/public/index.php ]; then
        if [ -n "$SYMFONY_PARAMS" ]; then
            echo "CREATING PROJECT with params: /usr/bin/symfony new /usr/src/app $SYMFONY_PARAMS"
            /usr/bin/symfony new /usr/src/app $SYMFONY_PARAMS
        else
            echo "CREATING PROJECT with std-params: /usr/bin/symfony new /usr/src/app $SYMFONY_PARAMS_STD"
            /usr/bin/symfony new /usr/src/app $SYMFONY_PARAMS_STD
        fi    
    else
        if [ ! -e /usr/src/app/vendor ]; then
            echo "INSTALLING DEPENDENCIES with composer install"
            cd /usr/src/app && composer install
        fi    
    fi
fi

echo "STARTING APACHE"

exec "$@"
