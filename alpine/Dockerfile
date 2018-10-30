FROM ruby:2.5-alpine

RUN apk add --no-cache \
    alpine-sdk make cpio curl libarchive-tools make php-pear \
    python3 py3-virtualenv py3-setuptools py3-pip \
    rpm unzip xz-dev git \
  && ln -sf python3 /usr/bin/python \
  && gem install --no-ri --no-rdoc fpm

ENTRYPOINT ["fpm"]
