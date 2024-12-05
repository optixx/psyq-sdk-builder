#!/bin/sh

set -x

ROOT=$(dirname $0)
CWD=$(pwd)
cd $ROOT
ROOT=$(pwd)
cd $CWD

docker run --rm -it -w/opt/project${CWD#$ROOT} -v "${ROOT}:/opt/project" -u $(id -u):$(id -g) psyq $@
