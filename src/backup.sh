# makes an incremental snapshot

log "start backup at" `date +"%x %X"`
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
log "finish backup at" `date +"%x %X"`

exit
