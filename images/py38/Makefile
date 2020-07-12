DOCKER_IMAGE_NAME ?= dp-python
DOCKER_IMAGE_VERSION ?= 3.8

.PHONY: build-alpine-base
build-alpine-base:
	docker build -t ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}-alpine -f alpine.Dockerfile .


.PHONY: build-ubuntu-base
build-ubuntu-base:
	docker build -t ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}-ubuntu -f ubuntu.Dockerfile .


.PHONY: build-all
build-all: build-alpine-base build-ubuntu-base
	echo "[INFO] Building all base python images was completed"

.PHONY: console-alpine
console-alpine:
	docker run -ti --rm --name ${DOCKER_IMAGE_NAME}-console \
		ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}-alpine \
		sh

.PHONY: console-ubuntu
console-ubuntu:
	docker run -ti --rm --name ${DOCKER_IMAGE_NAME}-console \
		ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}-ubuntu \
		bash
