#!/usr/bin/env bash
set -e

DOTFILES_DIR="$1"
BOOTSTRAP_DIR="$1/bootstrap"

source "${DOTFILES_DIR}/bootstrap/utils.sh"

IGNOREGLOBAL_SRC="${DOTFILES_DIR}/git/.gitignore_global"
IGNOREGLOBAL_DEST="${HOME}/.gitignore_global"
CONFIG_SRC="${DOTFILES_DIR}/git/.gitconfig"
CONFIG_DEST="${HOME}/.gitconfig"

linkit "${CONFIG_SRC}" "${CONFIG_DEST}"
linkit "${IGNOREGLOBAL_SRC}" "${IGNOREGLOBAL_DEST}"
