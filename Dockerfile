FROM ruby:alpine

RUN apk add --no-cache \
    alpine-sdk make cpio curl libarchive-tools make php-pear \
    python3 py3-virtualenv py3-setuptools py3-pip \
    rpm unzip xz git tar \
  && ln -sf /usr/bin/python3 /usr/bin/python \
  && ln -sf /usr/bin/easy_install-3* /usr/bin/easy_install \
  && gem install --no-document fpm

ENTRYPOINT ["fpm"]
WORKDIR /src
