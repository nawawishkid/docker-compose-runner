#!/usr/bin/env bash

APP_NAME="dm"
ROOTDIR=${PWD}
LOG_DIR="${ROOTDIR}/log/dm"

[ -z "$APP_SOURCE_DIR" ] && APP_SOURCE_DIR="."

source ${APP_SOURCE_DIR}/helper.sh
import "output"
import "help/main"

test empty $1 --txec "help_all" --txit

run()
{
    case "$1" in
        help | --help )
            help_run
            exit
        ;;
        apache )
            TARGET="
                -d \
                -v ${ROOTDIR}/www:/var/www \
                -v ${ROOTDIR}/docker/apache2/sites-available:/etc/apache2/sites-available \
                -p 80:80 \
                nawawishkid/wpth:apache-latest
            "
            echo 'Running apache...'
        ;;
        # php-fpm )
        #     TARGET="
        #         -d \
        #         -v ${ROOTDIR}/www:/var/www \
        #         --link
        #     "
        # ;;
        *)
            
        ;;
    esac
    
    docker run $TARGET
}

while [ $# -ne 0 ] 
do
    case "$1" in
        run )
            shift
            run "$1"
        ;;
        compose )
            source ${APP_SOURCE_DIR}/compose/compose.sh
            shift
            compose "$@"
            exit
        ;;
        help | --help )
            help_all
            exit
        ;;
        *)
            help_all
            exit
        ;;
    esac
    
    shift

done
