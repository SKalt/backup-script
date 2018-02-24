#! /usr/bin/env bash

# run the setup if no cfg file found
if [ ! -e "$DIR/backup.cfg" ]; then {
  source $DIR/src/setup.sh;
} fi

# import globals from the config.
source $DIR/backup.cfg
exit_status=# 0 until proven guilty

if [ ! "$bdrive" ]; then {
  log "bdrive missing: \"$bdrive\"";
  exit_status=1;
} fi;

if [ ! "$host" ]; then {
  log "hostname missing: \"$host\"";
  exit_status=1;
} fi

if [ ! "$user" ]; then {
  log "user missing: \"$user\"";
  exit_status=1;
} fi

if [ ! "$backup_source" ]; then {
  log "hostname missing: \"$host\"";
  exit_status=1;
} fi

if [ "$exit_status" ]; then { exit 1; } fi

latest=$bdrive/$host/latest
target=$bdrive/$host/`date +%Y%b%d-%R`
exclude=$DIR/backup-exclude

if [ ! "$backup_source" -a "$latest" -a "$target" -a "$exclude" ]; then {
  log "Invalid config";
  log "backup_source:$backup_source \
  latest:$latest \
  target:$target \
  exclude:$exclude";
  exit 1;
} fi;

