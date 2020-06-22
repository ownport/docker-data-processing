DOCKER_IMAGE_NAME ?= dp-miniconda
DOCKER_IMAGE_VERSION ?= latest

.PHONY: build
build:
	docker build -t ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} .

.PHONY: console
console:
	docker run -ti --rm --name ${DOCKER_IMAGE_NAME}-console \
		ownport/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} \
		/bin/bash
