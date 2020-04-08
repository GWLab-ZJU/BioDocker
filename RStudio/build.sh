#!/bin/bash
{ curl https://s3.amazonaws.com/rstudio-server/current.ver |cut -f 1 -d  -|xargs -i axel https://download2.rstudio.org/server/bionic/amd64/rstudio-server-{}-amd64.deb } && { docker build . -t rstudio-server&>>build.log & } || {echo "Download failed. Please restart this script and make sure that both curl and axel are installed."}
