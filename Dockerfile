FROM golang:1.14.6-alpine
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-golang)
LABEL description="Golang 1.14.6 Development Image"

ARG DOCKERIZE_VERSION=v0.6.1

COPY ./bash_aliases /home/sprout/.bashrc
COPY ./vimrc /home/sprout/.vimrc

RUN apk --no-cache add -U \
    ca-certificates \
    openssl \
  && update-ca-certificates --fresh \
  && apk --no-cache add -U \
    git \
    vim \
    bash \
    make \
    build-base \
    automake \
    autoconf \
    nasm \
    curl \
    unixodbc \
    unixodbc-dev \
    libintl \
    gettext \
  && ln -sf /usr/bin/vim /usr/bin/vi \
  && cp /usr/bin/envsubst /tmp/envsubst \
  && curl https://glide.sh/get | sh \
  && apk del gettext \
  && mv /tmp/envsubst /usr/bin/envsubst \
  && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && adduser -s /bin/bash -D sprout \
  && mkdir -p /home/sprout/bin \
  && curl -sL https://taskfile.dev/install.sh | sh \
  && mkdir /go/pkg && chown sprout:sprout /go/src /go/pkg /home/sprout/.bashrc /home/sprout/.vimrc \
  && rm -rf /var/cache/apk/*

USER sprout
