#!/bin/sh

function build_image () {
    base=$1
    image=$2
    plattaform=$3
    path=$4
    echo "Building: [$base], [$plattaform], With: [$base]";

    docker pull $1

    docker image rm --force $2
    
    docker buildx build \
        --build-arg BASE_IMAGE=$base \
        --build-arg TARGETPLATFORM=$plattaform \
        --build-arg BUILDPLATFORM=$plattaform \
        --no-cache \
        --file $path/Dockerfile \
        --tag $image .

    docker image ls $image
}

build_image 'mcr.microsoft.com/dotnet/sdk:6.0' \
            'local/dotnet-sdk:6.0' \
            'linux/amd64' \
            'dotnet-sdk-6.0'