FROM ubuntu:22.04
ARG PSYQ_VERSION
ENV PSYQ_VERSION=${PSYQ_VERSION}
ENV PSYQ_BUILD=/opt/psyq/psyq-sdk-builder/output/${PSYQ_VERSION}
ENV PSYQ_HOME=/opt/psyq/
ENV DL_HOME=/opt/psyq/psyq-sdk-builder/dl
ENV APP_HOME=/opt/project

RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y 7zip lhasa iat rename gcc-multilib g++-multilib git cmake strace ltrace \
  && rm -rf /var/lib/apt/lists/* \
  && ln -sf /usr/bin/7zz /usr/bin/7z

RUN \
  mkdir ${PSYQ_HOME} \
  && cd ${PSYQ_HOME} \
  && git clone --recurse-submodules https://github.com/dezgeg/psyq-sdk-builder.git

RUN mkdir -p ${DL_HOME}
COPY ./psyq-${PSYQ_VERSION}.zip ${DL_HOME}/46

RUN \
  cd /opt/psyq/psyq-sdk-builder\
  && make tarballs VERSIONS=${PSYQ_VERSION} \
  && cp -rv ${PSYQ_BUILD}/* ${PSYQ_HOME} \
  && rm -rf wibo/build \
  && rm -rf extracted \
  && rm -rf dl \
  && rm -rf tarballs

COPY ./psyq.ini ${PSYQ_HOME}/BIN/PSYQ.INI

RUN \
  DEBIAN_FRONTEND=noninteractive \
  && apt-get remove -y 7zip lhasa iat rename gcc-multilib g++-multilib  git cmake \
  && rm -rf /var/lib/apt/lists/* \
  && ln -sf /usr/bin/7zz /usr/bin/7z


ENV PATH="${PSYQ_HOME}:$PATH"
ENV PSX_PATH="${PSYQ_HOME}"
ENV LIBRARY_PATH="${PSYQ_HOME}/LIB"
ENV C_PLUS_INCLUDE_PATH="${PSYQ_HOME}/INCLUDE"
ENV C_INCLUDE_PATH="${PSYQ_HOME}/INCLUDE"
ENV PSYQ_PATH="${PSYQ_HOME}"

WORKDIR ${APP_HOME}
