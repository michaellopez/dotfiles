#!/bin/bash

### UTILS ###

# http://stackoverflow.com/a/3232082
confirm () {
  read -r -p "${1:-Are you sure? [y/N]} " response
  case $response in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

### BASH ###

DOTBASHRC_FILE="${HOME}/.bashrc"

if [ -a "${DOTBASHRC_FILE}" ]; then
  echo ""
  confirm "${DOTBASHRC_FILE} exists, overwrite? [y/N] " || { echo "Aborting!"; exit 1; }
fi

DOTFILES_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

TOKEN="\[\.\.\.\]"

echo ""
echo -n "Writing ${DOTBASHRC_FILE}..."
cat ${DOTFILES_DIR}/bootstrap/.bashrc | sed -e s@"${TOKEN}"@"${DOTFILES_DIR}"@ > ${DOTBASHRC_FILE}
echo "done."


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
ln -s ${DOTFILES_DIR}/nano/.nanorc ${DOTNANORC_FILE}
echo "done."

echo "Complete."
