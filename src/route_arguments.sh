#! /usr/bin/env bash
# Interprets command-line arguments.

while [ "$1" != "" ]; do
    case $1 in
        -s | --setup )         . $DIR/src/setup.sh
                               ;;
        -h | --help )          . $DIR/src/usage.sh
                               exit # unnecessary
                               ;;
        * )                    echo "beginning backup script"
                               ;;
    esac
    shift
done
