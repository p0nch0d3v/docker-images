ARG TARGETPLATFORM=linux/amd64
ARG BUILDPLATFORM=linux/amd64
ARG BASE_IMAGE='codercom/code-server:latest'

FROM ${BASE_IMAGE}

ARG USER_NAME=$USER
ENV USER_NAME=${USER_NAME}

ENV HOME_DIR=/home/coder

COPY ./install_docker.sh $HOME_DIR/installers/install_docker.sh
COPY ./install_dotnet_6.sh $HOME_DIR/installers/install_dotnet_6.sh
COPY ./install_ohmyzsh.sh $HOME_DIR/installers/install_ohmyzsh.sh
COPY ./install_node_js.sh $HOME_DIR/installers/install_node_js.sh

RUN sudo apt-get update --quiet --yes > /dev/null && sudo apt-get upgrade --quiet --yes > /dev/null
RUN sudo apt-get install wget \
                         curl \
                         zsh \
                         chromium \
                         git \
                         --quiet --yes > /dev/null

RUN sudo chmod +x $HOME_DIR/installers/*.sh

RUN /bin/bash $HOME_DIR/installers/install_docker.sh
RUN /bin/bash $HOME_DIR/installers/install_dotnet_6.sh
RUN /bin/bash $HOME_DIR/installers/install_ohmyzsh.sh
RUN /bin/bash $HOME_DIR/installers/install_node_js.sh

ENV SHELL=/usr/bin/zsh
ENV NVM_DIR=$HOME_DIR/.nvm

RUN echo "[ -s '$NVM_DIR/nvm.sh' ] && \. '$NVM_DIR/nvm.sh'" >> $HOME_DIR/.zshrc
