vimrc: FORCE
	test -d ~/.vim || mkdir -p ~/.vim
	ln -sf ./dotfiles/vim/vimrc ~/.vim

neovim: FORCE
	test -d ~/.config/nvim || mkdir -p ~/.config/nvim
	ln -sf ./dotfiles/vim/vimrc ~/.config/nvim/init.vim

fish: FORCE
	setup/fish.sh
	which fish || exit
	find ./dotfiles/fish -name '*' -type f | \
		sed -E 's/^\.\/dotfiles\/fish\///' | \
 		awk '{print ENVIRON["PWD"]"/dotfiles/fish/"$$1} {print ENVIRON["HOME"]"/.config/fish/"$$1}' | \
	 	xargs -n2 ln -sf
	fish

sync:
	git pull
	git push

FORCE:
