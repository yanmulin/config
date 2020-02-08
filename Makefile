dotfiles:
	ln -sf vim ~/.vim

sync:
	git pull
	git push
