vimrc: FORCE
	test -d ~/.vim || mkdir -p ~/.vim
	cp -r ./dotfiles/vim/vimrc ~/.vim

neovim: FORCE
	test -d ~/.config/nvim || mkdir -p ~/.config/nvim
	cp ./dotfiles/vim/vimrc ~/.config/nvim/init.vim

fish: FORCE
	find ./dotfiles/fish -name '*' -type f | \
		sed -E 's/^\.\/dotfiles\/fish\///' | \
 		awk '{print ENVIRON["PWD"]"/dotfiles/fish/"$$1} {print ENVIRON["HOME"]"/.config/fish/"$$1}' | \
	 	xargs -n2 ln -sf

sync:
	git pull
	git push

FORCE:
