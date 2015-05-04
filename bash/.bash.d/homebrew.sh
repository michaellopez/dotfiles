# Homebrew

export PATH=/usr/local/bin:$PATH

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Gruntjs Bash completion
# http://stackoverflow.com/a/677212
if hash grunt 2>/dev/null; then
	eval "$(grunt --completion=bash)"
fi

# NVM
if [ -f $(brew --prefix nvm)/nvm.sh ]; then
	export NVM_DIR=~/.nvm
	source $(brew --prefix nvm)/nvm.sh
fi
