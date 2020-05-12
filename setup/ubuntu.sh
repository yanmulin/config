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

### install the software
apt-get -y install build-essential g++ gcc cmake automake pkg-config \
		   libtool libtool-bin git iptables net-tools coreutils \
		   netcat-openbsd curl openssh-server

apt-get -y fish


