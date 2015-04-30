# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac


# Find out where the real files are.
# http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


# Bash
shopt -s histappend
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTSIZE=100000
export HISTFILESIZE=100000
export CLICOLOR=1
export LSCOLORS='Exfxcxdxbxegedabagacad'
export EDITOR=/usr/local/bin/nano
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'
export LC_ALL="en_US.UTF-8"
export LANG="en_US:en"
PS2="> "

# Mercurial Bash prompt
# Below function from: http://stackoverflow.com/a/14698389
# Also see alternative: http://mercurial.selenic.com/wiki/PromptExtension
#function parse_hg_branch {
#
#    if [ -d ".hg" ]; then
#        BRANCH="$(hg id -b 2> /dev/null)"
#
#        STATUSES="$(hg status 2> /dev/null)"
#        STATUS=""
#        if echo "$STATUSES" | grep '^M ' > /dev/null ; then STATUS="$STATUS*" ; fi
#        if echo "$STATUSES" | grep '^A ' > /dev/null ; then STATUS="$STATUS+" ; fi
#        if echo "$STATUSES" | grep '^D ' > /dev/null ; then STATUS="$STATUS-" ; fi
#        if echo "$STATUSES" | grep '^! ' > /dev/null ; then STATUS="$STATUS!" ; fi
#        if echo "$STATUSES" | grep '^? ' > /dev/null ; then STATUS="$STATUS%" ; fi
#        if [ -n "$STATUS" ]; then
#            STATUS=" $STATUS"
#        fi
#        if [ -n "$BRANCH" ]; then
#            echo "[$BRANCH$STATUS]"
#        fi
#    fi
#}

export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

function __prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local NORMAL='\[\e[0m\]'
    local RED='\[\e[0;31m\]'

    local stamp=$(date +%H:%M:%S)

    if [ $EXIT != 0 ]; then
        PS1+="${RED}${stamp}"
    else
        PS1+="${NORMAL}${stamp}"
    fi

    echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"

    PS1+="${NORMAL} $(__git_ps1 "[%s] ")\$ "
}

# Git prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1

# Custom scripts
if [ -d ${HOME}/Scripts ]; then
    export PATH=${HOME}/Scripts:$PATH
fi

# Utility for easy cd up multiple levels
..() {
    local levels=$1
    while ((levels > 0)); do
        cd .. || break
    let "levels--"
    done
}

# Extra Bash files to source automatically
BASH_FILES_DIR="${DIR}/.bash.d"
if [ -d "${BASH_FILES_DIR}" ]; then
  for i in "${BASH_FILES_DIR}"/*.sh; do
    if [ -r "${i}" ]; then
      . ${i}
    fi
  done
  unset i
fi
