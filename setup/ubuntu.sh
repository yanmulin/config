#!/bin/sh

if [ -z "$SUDO_USER" ]; then
    # if the user didn't call us with sudo, re-execute
    exec sudo $0 "$@"
fi

### update sources and get add-apt-repository
apt-get update
apt-get -y install software-properties-common

### add the extended source repos
add-apt-repository multiverse
add-apt-repository universe
add-apt-repository restricted

### make sure we're totally up-to-date now
apt-get update
apt-get -y dist-upgrade

### install libs
apt-get -y install build-essential libtool libtool-bin \
                   zlib1g-dev libssl-dev libreadline-dev \
                   libbz2-dev

### install network tools
apt-get -y install iptables net-tools coreutils netcat-openbsd \
                   openssh-server

### install dev tools
apt-get -y git g++ gcc cmake automake \
           mysql-server mysql-client libmysqlclient-dev