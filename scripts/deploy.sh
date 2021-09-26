#!/bin/sh

ROOT="."

CONFIG="$ROOT/config"

if [ -f "$CONFIG/user-server" ]; then
    SERVER=$(cat "$CONFIG/user-server")
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

if [ -f "$CONFIG/dest" ]; then
    DEST=$(cat "$CONFIG/dest")
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
