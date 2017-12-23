FROM ubuntu:17.10

RUN apt-get update -y \
  && apt-get install -y calibre \
  && apt-get clean \
  && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

EXPOSE 8080

RUN mkdir /opt/calibre && mkdir /opt/calibre/library

VOLUME        ["/opt/calibre/library"]
ENTRYPOINT ["/usr/bin/calibre-server", "/opt/calibre/library"]

docker-server /opt/calibre/library --daemonize --enable-auth