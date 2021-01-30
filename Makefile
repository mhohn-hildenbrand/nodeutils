
include .env

all: status build test

status:
	git status

build:
	$(DOCKER) build -t $(NODEUTILS_IMAGE) .

test:
	$(NODE) --version
	$(NPM) --version
	$(NPX) --version
	$(NG) --version
	$(NEST) --version
	$(SERVE) --version

pull:
	$(DOCKER) pull $(NODEUTILS_IMAGE)

push:
	$(DOCKER) push $(NODEUTILS_IMAGE)

publish:
	$(eval tag = $(shell git tag --points-at HEAD) )
	$(if $(tag),,$(error No tag for commit))
	$(DOCKER) tag $(NODEUTILS_IMAGE) $(NODEUTILS_IMAGE):$(tag)
	$(DOCKER) push $(NODEUTILS_IMAGE):$(tag)

.PHONY: all status build test pull push publish

.env:
	cp defaults.env $@
