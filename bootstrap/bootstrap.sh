#!/usr/bin/env bash
set -e
shopt -s nullglob

DOTFILES_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

echo "Starting bootstrap."

for file in "${DOTFILES_DIR}/bootstrap/bootstrap.d/*"
do
  ${file} ${DOTFILES_DIR}
done

echo "Complete."
