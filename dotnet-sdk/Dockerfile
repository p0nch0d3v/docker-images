ARG TARGETPLATFORM=linux/amd64
ARG BUILDPLATFORM=linux/amd64
ARG BASE_IMAGE='mcr.microsoft.com/dotnet/sdk:6.0'

FROM ${BASE_IMAGE}

RUN apt-get update --quiet --yes > /dev/null && \
    apt-get upgrade --quiet --yes > /dev/null

RUN dotnet tool install --global dotnet-ef
RUN dotnet tool install --global dotnet-aspnet-codegenerator

RUN dotnet dev-certs https --clean
RUN dotnet dev-certs https --trust

ENV PATH="${PATH}:/root/.dotnet/tools"

WORKDIR /app
 
