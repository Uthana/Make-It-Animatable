#!/bin/bash

set -eo pipefail

pushd "$(dirname "$0")" > /dev/null
SCRIPTPATH="$(pwd)"
popd > /dev/null

cd $SCRIPTPATH

source .venv/bin/activate
PATH="/opt/uve/opt/blender-4.2:$PATH" exec .venv/bin/python3 app.py
