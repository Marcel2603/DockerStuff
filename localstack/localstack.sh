#!/bin/bash

TAG=${1:-latest}

image=$(docker run -d -p 4566:4566 \
    -e SERVICES="kms" \
    -e KMS_SEED_PATH="/init/seed.yaml" \
    -e DEBUG=1 \
    -e LS_LOG="debug" \
    -e KMS_PROVIDER=local-kms \
    --mount type=bind,source="$(pwd)"/init,target=/init \
    localstack/localstack:$TAG)

echo "Sleep 10 Seconds to wait for startup"
sleep 10 

docker logs $image

docker exec -it $image awslocal kms list-keys

docker stop -t 0 $(docker ps -aq)


