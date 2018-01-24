#! /usr/bin/env bash
# a script to create a config file

echo -n "path to backup drive: "
read bdrive # backup drive

# set the computer/host name
host=$(hostname -f)
echo "default hostname: $host"
echo -n "Override hostname here, if desired: "
read _host
if [ "$_host" ]; then { host=$_host; } fi

# set the user name/directory
user=$(id -un)
echo "default username: $user"
echo -n "Override username here, if desired: "
read _user
if [ "$_user" ]; then { user=$_user; } fi

# ??
exclude=/home/$user/bin/backup-exclude

# write the config to disk.
# Caution!  If you use --link-dest, you need a slash on the end of your source.
# This is how to do it for the root directory
cat <<- config > $DIR/backup.cfg
#! /usr/bin/env bash
backup_source="/./"
bdrive=$bdrive
user=$user
host=$host
config

cat <<-exclude_file_contents > $DIR/backup.exclude
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

