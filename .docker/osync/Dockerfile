FROM debian:8

RUN apt-get update && apt-get install -y curl rsync inotify-tools openssh-client file wget && apt-get autoclean && apt-get autoremove

RUN cd /usr/src && \
  curl -L https://github.com/deajan/osync/archive/v1.1.3.tar.gz > osync.tgz && \
  tar -xvzf osync.tgz && \
  cd osync* && \
  ls -l

RUN cd /usr/src/osync* && \
  pwd ; ls -l && \
  bash install.sh

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY sync.conf /etc/osync
