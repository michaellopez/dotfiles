#!/usr/bin/env bash
set -e
shopt -s nullglob

DOTFILES_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

echo "Starting bootstrap."

if [ -n "$1" -a -f "${DOTFILES_DIR}/bootstrap/bootstrap.d/$1.sh" ]; then
  FILES="${DOTFILES_DIR}/bootstrap/bootstrap.d/$1.sh"
else
  FILES="${DOTFILES_DIR}/bootstrap/bootstrap.d/*"
fi

for file in ${FILES}
do
  ${file} ${DOTFILES_DIR}
done

echo "Complete."
