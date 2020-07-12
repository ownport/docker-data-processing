DOCKER_IMAGE_NAME ?= dp-base
DOCKER_IMAGE_VERSION ?= 0.1.0

.PHONY: build-alpine-base
build-alpine-base:
	docker build -t ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}-alpine -f alpine.Dockerfile .


.PHONY: build-ubuntu-base
build-ubuntu-base:
	docker build -t ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}-ubuntu -f ubuntu.Dockerfile .


.PHONY: build-all
build-all: build-alpine-base build-ubuntu-base
	echo "[INFO] Building all base images was completed"

.PHONY: console
console:
	docker run -ti --rm --name ${DOCKER_IMAGE_NAME}-console \
		ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} \
		/bin/bash
