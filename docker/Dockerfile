FROM ubuntu:22.04
ENV VERSION=46
ENV PYSQ_HOME=/opt/psyq/psyq-sdk-builder/output/${VERSION}
ENV DL_HOME=/opt/psyq/psyq-sdk-builder/dl
ENV APP_HOME=/opt/project

RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y 7zip lhasa iat rename gcc-multilib g++-multilib git curl wget vim cmake strace \
  && rm -rf /var/lib/apt/lists/* \
  && ln -sf /usr/bin/7zz /usr/bin/7z

RUN \
  mkdir /opt/psyq \
  && cd /opt/psyq \
  && git clone --recurse-submodules https://github.com/dezgeg/psyq-sdk-builder.git

RUN mkdir -p ${DL_HOME}
COPY ./psyq-${VERSION}.zip  ${DL_HOME}/46

RUN \
  cd /opt/psyq/psyq-sdk-builder\
  && make tarballs VERSIONS=${VERSION}

ENV PATH="${PYSQ_HOME}:$PATH"

WORKDIR ${APP_HOME}
