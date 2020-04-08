# Copyright (C) 2019-2020 YU Zhejian
# V10
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM ubuntu:18.04

LABEL maintainer="Zhejian.19@intl.zju.edu.cn"

RUN apt-get update && apt-get install -yq apt-transport-https ca-certificates apt-utils axel

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb [trusted=yes] https://mirrors.tuna.tsinghua.edu.cn/ubuntu bionic main restricted universe multiverse\ndeb [trusted=yes] https://mirrors.tuna.tsinghua.edu.cn/ubuntu bionic-updates main restricted universe multiverse\ndeb [trusted=yes] https://mirrors.tuna.tsinghua.edu.cn/ubuntu bionic-backports main restricted universe multiverse\n#deb [trusted=yes] https://mirrors.tuna.tsinghua.edu.cn/ubuntu bionic-security main restricted universe multiverse"> /etc/apt/sources.list

RUN apt-get update &&apt-get install -y --no-install-recommends --no-install-suggests r-base sudo git-core psmisc lsb-release libclang-dev locales unixodbc unixodbc-dev libcurl4-gnutls-dev libssl1.0.0 libssl-dev libuser libuser1-dev rrdtool libapparmor1 g++ gfortran libcurl4 libjpeg8 libopenblas-dev libpaper-utils libtcl8.6 libtiff5 libtk8.6 unixodbc unixodbc-dev libxt6 make unzip zip libaio1 libsasl2-dev openssh-server vim

COPY rstudio-server-*-amd64.deb /

RUN dpkg -i  rstudio-server-*-amd64.deb || apt-get -fy install 

RUN echo 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))'>>/root/.Rprofile

RUN ln -fs /usr/share/zoneinfo/PRC /etc/localtime&&dpkg-reconfigure --frontend noninteractive tzdata

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

ENV LANGUAGE en_US:en

ENV LC_ALL en_US.UTF-8

RUN (adduser --disabled-password --gecos "" guest && echo "guest:guest"|chpasswd) && mkdir -p /home/guest/data

VOLUME ["/home/guest/data"]

RUN apt-get clean;rm -rf tmp/* rstudio-server-*-amd64.deb

EXPOSE 8787/tcp 22/tcp

CMD service rstudio-server restart;service ssh start;chmod a+w /home/guest/data -R;chmod a+r /home/guest/data -R;chmod a+x /home/guest/data; while true;do date;sleep 60;done
