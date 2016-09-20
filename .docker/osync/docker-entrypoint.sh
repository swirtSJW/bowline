#!/bin/bash

if [ -d "/tmp/keys" ]; then
  mkdir -p /root/.ssh
  cp -v /tmp/keys/* /root/.ssh
  chmod 0700 /root/.ssh
fi

exec "$@"
