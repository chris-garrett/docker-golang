
IMAGE_VERSION=1.14.6
IMAGE_NAME=chrisgarrett/golang

all: build

prep:
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/Dockerfile.template > Dockerfile
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/README.md.template > README.md

build: prep
	docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

run:
	docker run --rm -it ${IMAGE_NAME}:${IMAGE_VERSION} go version

sh:
	docker run --rm -it ${IMAGE_NAME}:${IMAGE_VERSION} ash
