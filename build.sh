VERSION=1.6.3
IMAGE_NAME=chrisgarrett/golang

docker build --build-arg VERSION=$VERSION --rm=true -t $IMAGE_NAME:$VERSION .
