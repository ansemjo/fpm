FROM centos:7

RUN yum install -y \
  gcc gcc-c++ libtool libtool-ltdl \
  make cmake git pkgconfig sudo \
  automake autoconf yum-utils rpm-build \
  ruby-devel libffi-devel \
  && yum clean all

RUN gem install --no-ri --no-rdoc fpm

RUN useradd builder -u 1000 -m -g users -G wheel && \
  echo "builder ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers && \
  mkdir /build && chown -R builder /build

USER builder

WORKDIR /build

