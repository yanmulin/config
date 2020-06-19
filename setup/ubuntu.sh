#!/bin/bash

srcpath=ubuntu-src

function lssrc() {
  for src in `ls ubuntu-src`; do
    echo -n ' * '
    echo $src | cut -d. -f2
  done 
}

function chsrc() {
  filepath=$srcpath/sources.$1.list 
  if [ -f $filepath ]; then
    echo $filepath '-> /etc/apt/sources.list'
    cp /etc/apt/sources.list /etc/apt/sources.list.backup
    cp $filepath /etc/apt/sources.list
  else 
    echo 'source file not found: ' $filepath
    lssrc
    exit
  fi
}

if [ -z "$SUDO_USER" ]; then
    # if the user didn't call us with sudo, re-execute
    exec sudo $0 "$@"
fi

while getopts 's:' OPT; do
    case $OPT in
        s) chsrc $OPTARG;;
        ?) echo 'invalid option: '$OPT; exit 2;;
    esac
done

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

### install global tools
apt-get -y install curl git gcc python3 

apt autoremove
