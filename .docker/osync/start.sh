#!/bin/bash

# Verify we have enough max_user_watches
if [ $(cat /proc/sys/fs/inotify/max_user_watches) -lt 100000 ]; then
  echo -e "\n\nYou must increase your max user watches allowed for osync to monitor all the files.\n"
  echo -e "On linux systems, you can do this:\n  sudo sysctl fs.inotify.max_user_watches=100100\n"
  exit 1
fi

# First wait for other containers to start, then do initial sync to filestore
sleep 3
rm -rfv /var/www/.osync_workdir/state
osync.sh /etc/osync/sync.conf

# Start daemon mode to monitor changes
osync.sh /etc/osync/sync.conf --on-changes
