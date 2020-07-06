#!/bin/bash
docker run -d -p 8787:8787 -p 2287:22 --name=rstudio-server-minimum --restart=always --volume /root/data:/home/guest/data --cpus 1 rstudio-server-minimum
