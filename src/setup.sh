#! /usr/bin/env bash
# a script to create a config file

echo -n "path to backup drive: "
read bdrive # backup drive

# set the computer/host name
host=$(hostname -f)
echo -n "Override hostname? [default: $host]: "
read _host
if [ "$_host" ]; then { host=_host; } fi

# set the user name/directory
user=$(id -un)
echo -n "Override username? [default: $user]: "
read _user
if [ "$_user" ]; then { host=_host; } fi


exclude=/home/tkalt/bin/backup-exclude

# write the config to disk.
config_contents=<<-config
  #! /usr/bin/env bash
  backup_source="/./"
  bdrive=$bdrive
  latest=$bdrive/$host/latest
  target=$bdrive/$host/`date +%Y%b%d-%R`
  exclude=$DIR/backup-exclude
config
config_contents > $DIR/backup.cfg

exclude_contents=<<-exclude_file_contents
  /bin
  /boot
  /dev
  /etc
  /home/$user/.gvfs
  /home/$user/.cache
  /lib
  /lib64
  /media
  /net
  /opt
  /proc
  /raw
  /root
  /run
  /sbin
  /selinux
  /srv
  /sys
  /tmp
  /usr
  /var
  /vmlinuz
exclude_file_contents
exclude_contents > $DIR/backup.exclude

exit
