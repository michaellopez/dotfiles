# Homebrew

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Gruntjs Bash completion
# http://stackoverflow.com/a/677212
#if hash grunt 2>/dev/null; then
#	eval "$(grunt --completion=bash)"
#fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Virtualenvwrapper
if [ -f "/usr/local/bin/virtualenvwrapper_lazy.sh" ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	source "/usr/local/bin/virtualenvwrapper_lazy.sh"
fi

# Android Studio
export PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export ANDROID_HOME=~/Library/Android/sdk

# Caskroom
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# https://github.com/caskroom/homebrew-cask/issues/13256#issuecomment-130908893
caskup() {
	rm -rf "$(brew --cache)"
	brew update
	brew cask uninstall --force "$@"
	brew cask install "$@"
}


# AWS
alias aws='aws-keychain exec michael aws'
