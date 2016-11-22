#!/usr/bin/env bash
set -e

DOTFILES_DIR=$1
TOKEN="~/.nano"
REPLACE="${DOTFILES_DIR}/nano/nanorc"

cat ${DOTFILES_DIR}/nano/nanorc/nanorc | sed -e s@${TOKEN}@${REPLACE}@g > ${DOTFILES_DIR}/nano/.nanorc
cat ${DOTFILES_DIR}/nano/settings >> ${DOTFILES_DIR}/nano/.nanorc
