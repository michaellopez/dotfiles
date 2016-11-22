#!/usr/bin/env bash
set -e

DOTFILES_DIR="$1"
BOOTSTRAP_DIR="$1/bootstrap"

source "${DOTFILES_DIR}/bootstrap/utils.sh"

RC_SRC="${DOTFILES_DIR}/nano/.nanorc"
RC_DEST="${HOME}/.nanorc"
NANO_TEMP_DIR="/var/tmp/nano-backup/"

echo -n "Creating nano backup directory..."
mkdir -p ${NANO_TEMP_DIR}
echo "done."

echo "Getting latest code from nanorc repo..."
git -C ${DOTFILES_DIR}/nano submodule update --init --recursive --remote
git -C ${DOTFILES_DIR}/nano pull --recurse-submodules

echo -n "Building nanorc..."
${DOTFILES_DIR}/nano/build.sh ${DOTFILES_DIR}
cd - > /dev/null
echo "done."

overwrite "${RC_DEST}"
echo -n "Symlinking ${RC_SRC}..."
ln -sfn ${RC_SRC} ${RC_DEST}
echo "done."
