
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
	$(DOCKER) tag $(NODEUTILS_IMAGE) $(NODEUTILS_IMAGE):$(shell cat .version)
	$(DOCKER) push $(NODEUTILS_IMAGE):$(shell cat .version)

.PHONY: all status build test pull push publish

.env:
	cp defaults.env $@
