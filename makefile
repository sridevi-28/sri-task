cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))
.PHONY: build start push
build:  build-version
build-version:
	docker build -t $(DOCKER_USERNAME)/$(REPO_NAME):$(VERSION)  .
# tag-latest:
#   docker tag ${IMAGE}:${VERSION} ${IMAGE}:latest
# start:
#   docker run -it --rm ${IMAGE}:${VERSION}/bin/bash
login:
	echo $(DOCKER_PASSWORD) | docker login -u $(DOCKER_USERNAME) --password-stdin
push:	login
	docker push $(DOCKER_USERNAME)/$(REPO_NAME):$(VERSION)
# docker push 280507/task:tagname
