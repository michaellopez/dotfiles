#!/bin/bash

TOKEN="~/.nano"
REPLACE="~/git/michaellopez/dotfiles/nano/nanorc"

cat ./nanorc/nanorc | sed -e s@${TOKEN}@${REPLACE}@g > ./.nanorc
cat ./settings >> ./.nanorc
