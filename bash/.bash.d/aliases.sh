# General
#alias serve='python -m SimpleHTTPServer'
alias ports='lsof -Pan -i tcp -i udp'
alias g='grep --color=auto -i'
alias f='find . -iname'
alias c='curl -OL'
alias gitsdiff='find . -type d -mindepth 1 -maxdepth 1 | xargs -I{} sh -c "echo; echo {}; git -C {} st;"'

# Spacer in Dock
# http://macs.about.com/od/usingyourmac/qt/dockspacer.htm
function addspacertodock {
	defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock
}

# Restart audio - fixes muted speakers in Yosemite
alias unmute='sudo killall coreaudiod'

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

# Docker
#alias dm='docker-machine '
#alias dc='eval "$(docker-machine env dev)"; docker-compose '
#alias d='eval "$(docker-machine env dev)"; docker '
dcleanup(){
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
alias docker-clean='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock zzrot/docker-clean'

# Rancher
#alias rancher='docker run --rm -it --env-file /tmp/env -e HOME=/root -v $HOME/.rancher:/root/.rancher -v $PWD:/$(basename $PWD) -w /$(basename $PWD) weahead/rancher-cli:0.6.3'


# Dinghy
alias dm='dinghy start; dinghy '
alias dc='dinghy start; eval "$(dinghy shellinit)"; docker-compose '
alias d='dinghy start; eval "$(dinghy shellinit)"; docker '
alias ds='dinghy ssh sudo ntpclient -s -h pool.ntp.org'
