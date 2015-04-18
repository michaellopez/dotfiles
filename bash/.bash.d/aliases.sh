# General
alias serve='python -m SimpleHTTPServer'
alias ports='lsof -Pan -i tcp -i udp'
alias g='grep --color=auto -i'
alias f='find . -iname'
alias c='curl -OL'

# Spacer in Dock
# http://macs.about.com/od/usingyourmac/qt/dockspacer.htm
function addspacertodock {
	defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock
}

# Vagrant
alias v='vagrant'
alias va='vagrant'

# ls color output
# http://stackoverflow.com/a/1688464
if ls --color -d . >/dev/null 2>&1; then
    alias ls='ls --color=auto' # GNU
else
    alias ls='ls -G' # BSD
fi
