FROM golang:1.7.1-alpine
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-golang)
LABEL description="Golang 1.7.1 Development Image"
RUN apk --no-cache add git \
                       bash \
                       make \
                       curl \
                       libintl \
                       gettext \
    && cp /usr/bin/envsubst /tmp/envsubst \
    && curl https://glide.sh/get | sh \
    && apk del gettext \
    && mv /tmp/envsubst /usr/bin/envsubst
