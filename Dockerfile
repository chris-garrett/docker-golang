FROM golang:1.7.1-alpine
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-golang)
LABEL description="Golang 1.7.1 Development Image"
RUN apk --no-cache add -U ca-certificates openssl && update-ca-certificates
RUN apk --no-cache add -U \
    git \
    vim \
    bash \
    make \
    curl \
    libintl \
    gettext
RUN ln -sf /usr/bin/vim /usr/bin/vi \
  && cp /usr/bin/envsubst /tmp/envsubst \
  && curl https://glide.sh/get | sh \
  && apk del gettext \
  && mv /tmp/envsubst /usr/bin/envsubst

ARG DOCKERIZE_VERSION=v0.3.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN adduser -s /bin/bash -D sprout

COPY ./bash_aliases /home/sprout/.bashrc
COPY ./vimrc /home/sprout/.vimrc
RUN chown sprout:sprout /home/sprout/.bashrc /home/sprout/.vimrc

USER sprout
