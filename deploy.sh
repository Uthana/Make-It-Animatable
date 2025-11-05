#!/bin/bash

set -eo pipefail

if [ "$1" == "--clean" ]; then
  rm -fR .venv
elif [ "$1" == "--realclean" ]; then
  git clean -xdf
fi

./install.sh

BRANCH="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
rsync -av ../Make-It-Animatable/ netops.uthana.dev:autorig/$BRANCH/Make-It-Animatable

echo 'Success!'
