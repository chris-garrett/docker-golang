#!/bin/sh

. ./config.sh

GO_VERSION=$VERSION envsubst < ./templates/Dockerfile.template > Dockerfile
GO_VERSION=$VERSION envsubst < ./templates/README.md.template > README.md

docker build --rm=true -t $IMAGE_NAME:$VERSION .
