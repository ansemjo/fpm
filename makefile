.PHONY: build

VERSION   := $(shell git describe)
NAME      := fpm-builder

build :
	docker build \
		-t "$(NAME)" \
		-t "$(NAME):$(VERSION)" \
		.
