FROM debian:latest

RUN apt-get update && apt-get install -y curl rsync inotify-tools openssh-client && apt-get autoclean && apt-get autoremove

RUN cd /usr/src && \
  curl -L https://github.com/deajan/osync/archive/v1.01.tar.gz > osync.tgz && \
  tar -xvzf osync.tgz && \
  cd osync* && \
  sh install.sh

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

