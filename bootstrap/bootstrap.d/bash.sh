#!/usr/bin/env bash
set -e

DOTFILES_DIR="$1"
BOOTSTRAP_DIR="$1/bootstrap"

source "${DOTFILES_DIR}/bootstrap/utils.sh"

RC_SRC="${DOTFILES_DIR}/bash/.bashrc"
RC_DEST="${HOME}/.bashrc"
PROFILE_SRC="${DOTFILES_DIR}/bash/.bash_profile"
PROFILE_DEST="${HOME}/.bash_profile"

overwrite "${RC_DEST}"
echo -n "Symlinking ${RC_DEST}..."
ln -sfn ${RC_SRC} ${RC_DEST}
echo "done."

overwrite "${PROFILE_DEST}"
echo -n "Symlinking ${PROFILE_DEST}..."
ln -sfn ${PROFILE_SRC} ${PROFILE_DEST}
echo "done."
