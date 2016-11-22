#!/usr/bin/env bash
set -e

DOTFILES_DIR="$1"
BOOTSTRAP_DIR="$1/bootstrap"

source "${DOTFILES_DIR}/bootstrap/utils.sh"

RC_SRC="${DOTFILES_DIR}/bash/.bashrc"
RC_DEST="${HOME}/.bashrc"
PROFILE_SRC="${DOTFILES_DIR}/bash/.bash_profile"
PROFILE_DEST="${HOME}/.bash_profile"

linkit "${RC_SRC}" "${RC_DEST}"
linkit "${PROFILE_SRC}" "${PROFILE_DEST}"
