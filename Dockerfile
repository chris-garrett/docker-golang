FROM golang:1.6.3-alpine
ARG VERSION
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-golang)
LABEL description="Golang $VERSION Development Image"
RUN apk --no-cache add git bash make
