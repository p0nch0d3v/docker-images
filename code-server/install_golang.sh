#!/bin/bash

sudo rm -rf /usr/local/go

VERSION="1.19.1"
ARCH="amd64"

wget -L "https://golang.org/dl/go${VERSION}.linux-${ARCH}.tar.gz"

sudo tar -C /usr/local -xzf go${VERSION}.linux-${ARCH}.tar.gz

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

echo "export PATH=/usr/local/go/bin:${PATH}" | sudo tee -a $HOME/.profile
