
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

.PHONY: all status build test

.env:
	cp defaults.env $@
