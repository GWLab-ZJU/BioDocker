#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
docker build . -t yl-ubuntu-base 2>&1 | tee build_$(date +%Y-%m-%d_%H-%M).log
