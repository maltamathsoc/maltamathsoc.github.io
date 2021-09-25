#!/bin/sh

if [ -f ./user-server ]; then
    SERVER=$(cat ./user-server)
else
    OPT="n"

    while [ ! $OPT = "Y" ]; do
        printf "ssh (e.g. user@example.com): "

        read SERVER

        printf "Are you sure? [Y/n]: "

        read OPT

        case "$OPT" in
            "Y") ;;
            "n") exit 1 ;;
            *) echo "Invalid option: $SERVER" ;;
        esac
    done

fi

if [ -f ./dest ]; then
    DEST=$(cat ./dest)
else
    OPT="n"

    while [ ! $OPT = "Y" ]; do
        printf "dest (e.g. /var/www/webpage): "

        read DEST

        printf "Are you sure? [Y/n]: "

        read OPT

        case "$OPT" in
            "Y") ;;
            "n") exit 1 ;;
            *) echo "Invalid option: $OPT" ;;
        esac
    done
fi

echo "Cleaning $DEST..."

ssh $SERVER rm -rf $DEST/*

echo "Copying website to $DEST..."

rsync -Lrvz ./* $SERVER:$DEST
