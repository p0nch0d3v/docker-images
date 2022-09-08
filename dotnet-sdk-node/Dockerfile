ARG TARGETPLATFORM=linux/amd64
ARG BUILDPLATFORM=linux/amd64
ARG BASE_IMAGE

FROM ${BASE_IMAGE}

RUN apt-get install curl gnupg -yq > /dev/null \
    && curl -sL https://deb.nodesource.com/setup_lts.x | bash \
    && apt-get install nodejs -yq > /dev/null

WORKDIR /app
