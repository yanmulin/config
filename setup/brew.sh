#!/bin/bash

function install_brew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    which brew &>/dev/null || exit 1
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/yanmulin/.bashrc
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
}
    
function install() {
    brew list $1 &>/dev/null
    if [ $? != 0 ]; then
        brew install $1
    fi
}

which brew &>/dev/null || install_brew

install nvim
install cmake
install automake
install mysql
