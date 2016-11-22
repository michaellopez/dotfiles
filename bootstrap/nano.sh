#!/usr/bin/env bash
set -e

### NANO ###

DOTNANORC_FILE="${HOME}/.nanorc"
NANO_TEMP_DIR="/var/tmp/nano-backup/"

if [ -a "${DOTNANORC_FILE}" ]; then
  echo ""
  confirm "${DOTNANORC_FILE} exists, overwrite? [y/N] " || echo "Aborting!"; exit 1;
fi

echo ""
echo -n "Creating nano backup directory..."
mkdir -p ${NANO_TEMP_DIR}
echo "done."

echo ""
echo "Getting latest code from nanorc repo..."
git -C ${DOTFILES_DIR} pull --recurse-submodules
git -C ${DOTFILES_DIR} submodule update --recursive
echo "...done."

echo ""
echo -n "Building ${NANORC_FILE}..."
cd ${DOTFILES_DIR}/nano
./build.sh
cd - > /dev/null
echo "done."

echo ""
echo -n "Symlinking ${NANORC_FILE}..."
ln -sfn ${DOTFILES_DIR}/nano/.nanorc ${DOTNANORC_FILE}
echo "done."
