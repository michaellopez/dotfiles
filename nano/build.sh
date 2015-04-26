#!/bin/bash

cat nanorc/nanorc | sed -e s/~\\/.nano/~\\/git\\/michaellopez\\/dotfiles\\/nano\\/nanorc/g > .nanorc
cat settings >> .nanorc
