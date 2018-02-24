log () {
  if [ $BACKUP_LOGGING  ]; then
    if [ -w $BACKUP_LOGGING ]; then
      echo $@ >> $BACKUP_LOGGING;
    else
      echo $@
    fi;
  fi;
}