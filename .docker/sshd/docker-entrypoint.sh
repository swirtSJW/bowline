#!/bin/bash

USER=${USER-'data'}
echo "Creating user ${USER}"
id -u ${USER} &>/dev/null || useradd -ms /bin/bash ${USER}

if [ "$PASSWORD" ]; then
  echo "${USER}:${PASSWORD}" | chpasswd
fi

if [ "$HOST_USER" ]; then
  echo Setting the ${USER} user to ${HOST_USER}
  OWNER=$(echo $HOST_USER | cut -d: -f1)
  GROUP=$(echo $HOST_USER | cut -d: -f2)
  if [ "$OWNER" != "0" ]; then
    usermod -o -u $OWNER ${USER}
    groupmod -o -g $GROUP ${USER}
  fi
fi

exec "$@"
