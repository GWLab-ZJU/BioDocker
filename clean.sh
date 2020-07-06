#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")" 
for dir in yl-*;do
    cd "${dir}"
    rm *.log -rf
    cd ..
done
