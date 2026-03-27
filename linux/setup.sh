#!/bin/bash

set -e

echo ">>> Installing dependencies"

sudo apt update
sudo apt install -y wget tar docker.io docker-compose-plugin

echo ">>> Preparing environment"

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DATA_DIR="$BASE_DIR/data"

mkdir -p "$DATA_DIR"

cd "$DATA_DIR"

echo ">>> Downloading mprime (official binary)"

wget https://www.mersenne.org/download/software/v30/30.19/p95v3019b20.linux64.tar.gz -O mprime.tar.gz

echo ">>> Extracting"

tar -xzf mprime.tar.gz

chmod +x mprime

echo ">>> Running initial configuration"

./mprime -m

echo ">>> Starting container"

cd "$BASE_DIR"
docker compose up -d

echo ">>> Done!"
echo ">>> mprime is now running inside Docker"
