#!/bin/bash

set -eo pipefail

if [ "$1" == "--clean" ]; then
  rm -fR .venv
elif [ "$1" == "--realclean" ]; then
  git clean -xdf
fi

./install.sh

rsync -av ../Make-It-Animatable/ netops.uthana.dev:ve/Make-It-Animatable

echo 'Success!'
