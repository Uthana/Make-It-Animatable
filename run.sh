#!/bin/bash

set -eo pipefail

source .venv/bin/activate
PATH="blender-4.2.15-linux-x64:$PATH" python3 app.py
