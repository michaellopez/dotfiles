#!/usr/bin/env bash
set -e

DOTFILES_DIR="$1"
BOOTSTRAP_DIR="$1/bootstrap"

source "${DOTFILES_DIR}/bootstrap/utils.sh"

CONFIG_SRC="${DOTFILES_DIR}/ssh/config"
CONFIG_DEST="${HOME}/.ssh/config"

linkit "${CONFIG_SRC}" "${CONFIG_DEST}"
