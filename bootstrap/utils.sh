#!/usr/bin/env bash
set -e

linkit () {
  overwrite $2
  echo -n "Symlinking $2 to $1"
  ln -sfn $1 $2
  echo "done."
}

# http://stackoverflow.com/a/3232082
confirm () {
  echo ""
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

overwrite () {
  if [ -a "$1" ]; then
    confirm "$1 exists, overwrite? [y/N] " || { echo "Aborting!"; exit 1; }
  fi
}
