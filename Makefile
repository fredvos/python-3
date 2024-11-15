DOCKER_USERNAME ?= mokolo-org
APPLICATION_NAME ?= python
TIMESTAMP ?= $(shell date +"%Y%m%d-%H%M%S")

build:
	docker build --no-cache --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest .
	docker tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest ${DOCKER_USERNAME}/${APPLICATION_NAME}:$(TIMESTAMP)
	for tag in $(shell docker run --rm -i -t ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest '/usr/local/bin/get-tags') ; do \
		docker tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest ${DOCKER_USERNAME}/${APPLICATION_NAME}:$$tag ; \
	done
