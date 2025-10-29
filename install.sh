#!/usr/bin/env bash

set -eo pipefail

# to clean
# git clean -xdf

# To auth with huggingface - use your username and an access-token you've
# created

if [ ! -e .venv ]; then
  /opt/uve/bin/python3 -m venv .venv
  .venv/bin/pip install -r requirements.txt
fi

if [ ! -e data/Mixamo ]; then
  # You must share your info to use this dataset, simply visit
  # https://huggingface.co/datasets/jasongzy/Mixamo and click "allow"
  GIT_LFS_SKIP_SMUDGE=1 git -C data clone https://huggingface.co/datasets/jasongzy/Mixamo
  git -C data/Mixamo submodule update --init
  git -C data/Mixamo lfs pull -I 'bones*.fbx,animation'
fi

if [ ! -e output/best ]; then
  rm -fR /tmp/hf-data
  GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/jasongzy/Make-It-Animatable /tmp/hf-data
  git -C /tmp/hf-data lfs pull -I output/best/new
  mkdir -p output/best
  cp -r /tmp/hf-data/output/best/new output/best/
  cp -r /tmp/hf-data/data/* data/
fi

if [ ! -e util/FBX2glTF ]; then
  wget https://github.com/facebookincubator/FBX2glTF/releases/download/v0.9.7/FBX2glTF-linux-x64 -O util/FBX2glTF
  chmod 755 util/FBX2glTF
fi

# source .venv/bin/activate
# python3 app.py
