dotfiles: FORCE
	ln -sf `pwd`/dotfiles/vim ~/.vim

ubuntu: FORCE
	sudo ./setup/ubuntu.sh

sync:
	git pull
	git push

FORCE:
