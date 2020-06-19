#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install g++ gcc cmake automake git \
           python3 python3-pip python3-venv \
           mysql-server mysql-client libmysqlclient-dev