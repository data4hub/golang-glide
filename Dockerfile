FROM golang

RUN \
  wget https://github.com/Masterminds/glide/releases/download/0.8.3/glide-0.8.3-linux-amd64.tar.gz && \
  tar xvf glide-0.8.3-linux-amd64.tar.gz && \
  mv linux-amd64/glide /usr/bin/

ENV GO15VENDOREXPERIMENT=1
