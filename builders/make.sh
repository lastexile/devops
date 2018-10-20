#!/bin/bash
set -e
set -o pipefail


if [[ -z "$1" ]]; then
 echo "specify name"
 exit 1
fi

NAME=$1
FILE="${NAME}/Dockerfile"
REPOSITORY=xeonexile/${NAME}
TAG=${2:-"latest"}
IMAGE=${REPOSITORY}:${TAG}

echo "building -f ${FILE} -t ${IMAGE}"

docker build . -f ${FILE} -t ${IMAGE}