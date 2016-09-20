#!/bin/bash

USER=${USER-'data'}
echo "Creating user ${USER}"
id -u ${USER} &>/dev/null || useradd -ms /bin/bash ${USER}

if [ "$PASSWORD" ]; then
  echo "${USER}:${PASSWORD}" | chpasswd
fi

exec "$@"
