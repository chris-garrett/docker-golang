VERSION=1.7.1
IMAGE_NAME=chrisgarrett/golang

build:
	VERSION=${VERSION} envsubst < ./templates/Dockerfile.template > Dockerfile
	VERSION=${VERSION} envsubst < ./templates/README.md.template > README.md

	docker build --rm=true -t ${IMAGE_NAME}:${VERSION} .

run:
	docker run --rm -it ${IMAGE_NAME}:${VERSION} go version
