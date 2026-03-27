#!/bin/bash

cd "$(dirname "$0")/../data"

echo ">>> Opening mprime configuration menu"
echo ">>> Use this to set your GIMPS username and preferences"

./mprime -m
