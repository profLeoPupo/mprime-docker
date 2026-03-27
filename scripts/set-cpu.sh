#!/bin/bash

CORES=$1

if [ -z "$CORES" ]; then
  echo "Usage: ./set-cpu.sh <number_of_cores>"
  exit 1
fi

echo ">>> Limiting mprime to $CORES CPU core(s)"

docker update --cpus="$CORES" mprime
