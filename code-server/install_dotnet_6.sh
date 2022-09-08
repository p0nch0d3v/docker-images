#!/bin/bash

sudo wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb

sudo dpkg -i /tmp/packages-microsoft-prod.deb

sudo rm /tmp/packages-microsoft-prod.deb

sudo apt-get update -yq

sudo apt-get install -yq dotnet-sdk-6.0 aspnetcore-runtime-6.0 dotnet-runtime-6.0
