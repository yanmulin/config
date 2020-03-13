dotfiles: FORCE
	ln -sf `pwd`/dotfiles/vim ~/.vim

ssh: FORCE
	ssh-keygen -t rsa -b 4096 -C "your_email@example.com"	
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	
ubuntu: FORCE
	sudo ./setup/ubuntu.sh

sync:
	git pull
	git push

FORCE:
