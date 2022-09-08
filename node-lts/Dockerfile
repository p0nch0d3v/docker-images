ARG TARGETPLATFORM=linux/amd64
ARG BUILDPLATFORM=linux/amd64
ARG BASE_IMAGE='node:lts'

FROM ${BASE_IMAGE}

RUN apt-get update --quiet --yes > /dev/null && \
    apt-get upgrade --quiet --yes > /dev/null

RUN chmod -R 777 /tmp
RUN chown -R :node /tmp

VOLUME [ "/app" ]

WORKDIR /app
