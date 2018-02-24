# makes an incremental snapshot

log "start backup at" `date +"%x %X"`
#echo -n "start backup at" `date +"%x %X"` >> ~/backup/backup.log
log rsync                           \
  -av                               \
  --delete                          \
  --exclude-from=$exclude           \
  --link-dest=$latest               \
  $source $target

nice                                \
  rsync                             \
  -av                               \
  --delete                          \
  --exclude-from=$exclude           \
  --link-dest=$latest               \
  $source $target

rm $latest
ln -s $target $latest
#echo ",  finish at" `date +"%x %X"` >> ~/backup/backup.log
log "finish backup at" `date +"%x %X"`

exit
