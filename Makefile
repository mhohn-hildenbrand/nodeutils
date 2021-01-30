
include .env

all: status build test

status:
	git status

build:
	$(DOCKER) build -t $(NODEUTILS_IMAGE) .

test:
	$(NODE) --version

.PHONY: all status build test

.env:
	cp defaults.env $@
