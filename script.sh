#!/bin/bash

set -ex

PARENT_DIR=$(basename "${PWD%/*}")
CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="$PARENT_DIR/$CURRENT_DIR"
TAG="${1}"

REGISTRY="hub.docker.com"
docker login --username=$DOCKER_USER --password=$DOCKER_PASS
docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} -t ${REGISTRY}/${IMAGE_NAME}:latest .
docker push ${REGISTRY}/${IMAGE_NAME}

ansible-playbook deploy.yml


