.PHONY: help build dev

VERSION   := $(shell git describe)
NAME      := fpm-builder

help :
	@echo "run 'make build' for tags :latest & :$(VERSION)"
	@echo "run 'make dev' for tag :development"

build :
	docker build \
		-t "$(NAME)" \
		-t "$(NAME):$(VERSION)" \
		.

dev :
	docker build \
		-t "$(NAME):development" \
		.
