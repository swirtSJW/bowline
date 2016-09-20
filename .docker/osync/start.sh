#!/bin/bash


# First do initial sync to filestore
osync.sh /etc/osync/sync.conf

# Start daemon mode to monitor changes
osync.sh /etc/osync/sync.conf --on-changes
