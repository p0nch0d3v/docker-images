#!/bin/bash

function build_image () {
    base=$1
    image=$2
    plattaform=$3
    path=$4
    echo "Building: [$base], [$plattaform], With: [$base]";

    cd $path

    # docker pull $1

    # docker image rm --force $2
    
    docker buildx build \
        --build-arg BASE_IMAGE=$base \
        --build-arg TARGETPLATFORM=$plattaform \
        --build-arg BUILDPLATFORM=$plattaform \
        --progress=plain \
        --no-cache \
        --file Dockerfile \
        --tag $image .

    docker image ls $image

    cd ..
}

build_image 'mcr.microsoft.com/dotnet/sdk:6.0' \
            'p0nch0d3v/dotnet-sdk:6.0' \
            'linux/amd64' \
            'dotnet-sdk'

build_image 'p0nch0d3v/dotnet-sdk:6.0' \
            'p0nch0d3v/dotnet-sdk-node:6.0' \
            'linux/amd64' \
            'dotnet-sdk-node'

build_image 'node:lts' \
            'p0nch0d3v/node-lts:latest' \
            'linux/amd64' \
            'node-lts'

build_image 'codercom/code-server:latest' \
            'p0nch0d3v/code-server:latest' \
            'linux/amd64' \
            'code-server'
