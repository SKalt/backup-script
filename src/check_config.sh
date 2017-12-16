#! /usr/bin/env bash

# checks the config file imports successfully.
if [ -e $DIR/backup.cfg ] then {
  . $DIR/src/setup
} fi

# import globals from the config.
. $DIR/backup.cfg
exit_status=""

if [ ! "$bdrive" ]; then {
  echo "bdrive missing: \"$bdrive\"";
  exit_status=1;
} fi;

if [ ! "$host" ]; then {
  echo "hostname missing: \"$host\"";
  exit_status=1;
} fi

if [ ! "$user" ]; then {
  echo "user missing: \"$user\"";
  exit_status=1;
} fi

if [ ! "$backup_source" ]; then {
  echo "hostname missing: \"$host\"";
  exit_status=1;
} fi

if [ "$exit_status" ]; then { exit 1; } fi

latest=$bdrive/$host/latest
target=$bdrive/$host/`date +%Y%b%d-%R`
exclude=$DIR/backup-exclude

if [ ! "$backup_source" -a "$latest" -a "$target" -a "$exclude" ]; then {
  echo "Invalid config";
  echo "backup_source:$backup_source \
  latest:$latest \
  target:$target \
  exclude:$exclude";
  exit 1;
} fi;

