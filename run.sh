#!/bin/bash

set -eo pipefail

source .venv/bin/activate
PATH="/opt/uve/opt/blender-4.2:$PATH" python3 app.py
