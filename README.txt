This repository includes a simple makefile that should
build an image from the Dockerfile and tag it with the
current version (from `git describe`) and latest. Simply
run:

  $ make build

For testing purposes you can build images with the tag
development using:

  $ make dev

The image includes some build dependencies and the fpm
packager. It is designed to be used by mounting a volume
with source files under /build and then using makefiles
or scripts to place the packaged *.rpm within that same
directory. The workdir is within the mounted /build by
default. To remove conflicts between builds use it as
an ephemeral container:

  $ docker run --rm \
    --volume /path/to/source/dir:/build \
    fpm-builder /usr/bin/make
