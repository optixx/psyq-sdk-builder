FROM ubuntu:22.04
ENV VERSION=46
ENV APP_HOME=/opt/psyq/psyq-sdk-builder/output/${VERSION}

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y 7zip lhasa iat rename build-essential gcc-multilib g++-multilib git curl wget vim cmake strace \
  && rm -rf /var/lib/apt/lists/* \
  && ln -sf /usr/bin/7zz /usr/bin/7z

RUN mkdir /opt/psyq \
  && cd /opt/psyq \
  && git clone --recurse-submodules https://github.com/dezgeg/psyq-sdk-builder.git \
  && cd /opt/psyq/psyq-sdk-builder \
  && make tarballs VERSIONS=${VERSION}

COPY ./hello.c ${APP_HOME}
WORKDIR ${APP_HOME}
