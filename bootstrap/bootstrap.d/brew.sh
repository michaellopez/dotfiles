brew tap homebrew/dupes
brew tap codekitchen/dinghy
brew tap weahead/tools

brew install \
	awscli \
	aws-keychain \
	bash \
	bash-completion \
	dinghy \
	diff-so-fancy \
	git \
	git-flow-avh \
	xhyve \
	docker \
	docker-compose \
	docker-machine \
	docker-machine-driver-xhyve \
	nano \
	nvm \
	screen \
	wa \
	watch


# docker-machine-driver-xhyve needs this
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

# nvm
mkdir ~/.nvm
