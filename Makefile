vimrc: FORCE
	test -d ~/.vim || mkdir -p ~/.vim
	ln -f ./dotfiles/vim/vimrc ~/.vim/vimrc

neovim: FORCE
	test -d ~/.config/nvim || mkdir -p ~/.config/nvim
	ln -f ./dotfiles/vim/vimrc ~/.config/nvim/init.vim

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
