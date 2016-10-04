FROM golang:1.7.1-alpine
ARG VERSION
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-golang)
LABEL description="Golang 1.7.1 Development Image"
RUN apk --no-cache add git bash make curl
RUN curl https://glide.sh/get | sh
