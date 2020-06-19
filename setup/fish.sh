#!/bin/bash

function install_fish() {
	me=`whoami`
	brew install fish
	perm=stat -c'%a' /etc/shells
	sudo chmod 777 /etc/shells
	sudo echo `which fish` >>/etc/shells
	sudo chsh -s `which fish` $$me
	sudo chmod $perm /etc/shells
	test -d ~/.config/fish/functions || mkdir -p ~/.config/fish/functions
}

which fish && exit
install_fish
