dotfiles: FORCE
	ln -sf `pwd`/dotfiles/vim ~/.vim

sync:
	git pull
	git push

FORCE:
