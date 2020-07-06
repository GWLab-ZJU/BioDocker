#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
if ! docker images|awk '{print $1;}'|grep yl-r-base &>> /dev/null;then
    echo "Will build dependency: yl-r-base"
    cd ../yl-r-base
    bash build.sh
    cd ../rstudio-server-minimum
fi
if [ ! -f rstudio-server-*-amd64.deb ];then
    echo "Will download RStudioServer"
    curl https://s3.amazonaws.com/rstudio-server/current.ver |\
    cut -f 1 -d  -|\
    xargs -i axel https://download2.rstudio.org/server/bionic/amd64/rstudio-server-{}-amd64.deb || { echo "Download failed.";exit 1;}
fi 
docker build . -t yl-rstudio-server-minimum 2>&1 | tee build_$(date +%Y-%m-%d_%H-%M).log
