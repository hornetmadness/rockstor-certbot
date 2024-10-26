#!/usr/bin/env sh
tag=${1:-"latest"}
platforms=${2:-"linux/amd64"}

docker buildx build --platform "${platforms}" --push -t hornetmadness/rockstor-certbot:${tag} .
