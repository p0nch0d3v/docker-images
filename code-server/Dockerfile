ARG TARGETPLATFORM=linux/amd64
ARG BUILDPLATFORM=linux/amd64
ARG BASE_IMAGE='codercom/code-server:latest'

FROM ${BASE_IMAGE}

ARG USER_NAME=$USER
ENV USER_NAME=${USER_NAME}

ENV HOME_DIR=/home/coder

COPY ./*.sh $HOME_DIR/installers/

RUN sudo apt-get update --quiet --yes > /dev/null && sudo apt-get upgrade --quiet --yes > /dev/null
RUN sudo apt-get install wget \
                         curl \
                         zsh \
                         chromium \
                         git \
                         neofetch \
                         --quiet --yes > /dev/null

RUN sudo chmod +x $HOME_DIR/installers/*.sh

RUN /bin/bash $HOME_DIR/installers/install_docker.sh
RUN /bin/bash $HOME_DIR/installers/install_dotnet_6.sh
RUN /bin/bash $HOME_DIR/installers/install_ohmyzsh.sh
RUN /bin/bash $HOME_DIR/installers/install_node_js.sh
RUN /bin/bash $HOME_DIR/installers/install_golang.sh

ENV SHELL=/usr/bin/zsh
ENV NVM_DIR=$HOME_DIR/.nvm
ENV GOPATH=$HOME_DIR/go

RUN echo "[ -s '$NVM_DIR/nvm.sh' ] && \. '$NVM_DIR/nvm.sh'" >> $HOME_DIR/.zshrc
RUN echo "nvm install --lts && nvm use --lts" >> $HOME_DIR/.zshrc
RUN echo "source $HOME_DIR/.profile" >> $HOME_DIR/.zshrc

RUN echo "docker --version" >> $HOME_DIR/.zshrc
RUN echo "dotnet --version" >> $HOME_DIR/.zshrc
RUN echo "node --version" >> $HOME_DIR/.zshrc
RUN echo "go version" >> $HOME_DIR/.zshrc
