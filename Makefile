vimrc: FORCE
	ln -sf `pwd`/dotfiles/vim ~/.vim

fish: FORCE
	find ./dotfiles/fish -name '*' -type f | \
		sed -E 's/^\.\/dotfiles\/fish\///' | \
 		awk '{print ENVIRON["PWD"]"/dotfiles/fish/"$$1} {print ENVIRON["HOME"]"/.config/fish/"$$1}' | \
	 	xargs -n2 ln -sf

sync:
	git pull
	git push

FORCE:
