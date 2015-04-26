# dotfiles

My dotfiles for me.


## Setup

[...] means the path to the clone.

### Bash
.bashrc:
```bash
BASHRC_FILE="[...]/bash/.bashrc"
if [ -f "${BASHRC_FILE}" ]; then
	source ${BASHRC_FILE}
fi
```

### Nano

```bash
mkdir -p /var/tmp/nano-backup/
git pull --recurse-submodules
git submodule update --recursive
[...]/nano/build.sh
ln -s [...]/nano/.nanorc ~/.nanorc
```


Inspired by:

- https://github.com/mathiasbynens/dotfiles
- https://github.com/holman/dotfiles
- https://github.com/ryanb/dotfiles
- https://github.com/rtomayko/dotfiles
- https://github.com/robbyrussell/oh-my-zsh

