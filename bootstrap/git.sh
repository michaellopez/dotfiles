#!/usr/bin/env bash
set -e

## Git ##

DOTGITIGNOREGLOBAL_FILE="${HOME}/.gitignore_global"
DOTGITCONFIG_FILE="${HOME}/.gitconfig"

if [ -a "${DOTGITCONFIG_FILE}" ]; then
  echo ""
  confirm "${DOTGITCONFIG_FILE} exists, overwrite? [y/N] " || echo "Aborting!"; exit 1;
fi

echo ""
echo -n "Symlinking ${DOTGITCONFIG_FILE}"
ln -sfn ${DOTFILES_DIR}/git/.gitconfig ${DOTGITCONFIG_FILE}
echo "done."

if [ -a "${DOTGITIGNOREGLOBAL_FILE}" ]; then
  echo ""
  confirm "${DOTGITIGNOREGLOBAL_FILE} exists, overwrite? [y/N] " || echo "Aborting!"; exit 1;
fi

echo ""
echo -n "Symlinking ${DOTGITIGNOREGLOBAL_FILE}"
ln -sfn ${DOTFILES_DIR}/git/.gitignore_global ${DOTGITIGNOREGLOBAL_FILE}
echo "done."


