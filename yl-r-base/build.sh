#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
if ! docker images|awk '{print $1;}'|grep yl-ubuntu-base &>> /dev/null;then
    echo "Will build dependency: yl-ubuntu-base"
    cd ../yl-ubuntu-base
    bash build.sh
    cd "$(readlink -f "$(dirname "${0}")")"
fi
docker build . -t yl-r-base 2>&1 | tee build_$(date +%Y-%m-%d_%H-%M).log
