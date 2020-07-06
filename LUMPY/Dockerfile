# Copyright (C) 2019-2020 YU Zhejian
# Version 1
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
ARG UID

FROM ubuntu:18.04

LABEL maintainer="Zhejian.19@intl.zju.edu.cn"

RUN apt-get update && apt-get install -yq apt-transport-https ca-certificates apt-utils axel

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

RUN (adduser --disabled-password --uid $UID --gecos "" guest && echo "guest:guest"|chpasswd) && mkdir -p /home/guest/data

RUN apt-get update

RUN ln -fs /usr/share/zoneinfo/PRC /etc/localtime&&dpkg-reconfigure --frontend noninteractive tzdata

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

ENV LANGUAGE en_US:en

ENV LC_ALL en_US.UTF-8

VOLUME ["/home/guest/data"]

RUN apt-get clean;rm -rf tmp/*

RUN axel https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda2-latest-Linux-x86_64.sh && chmod +x Miniconda2-latest-Linux-x86_64.sh && ./Miniconda2-latest-Linux-x86_64.sh -b && rm Miniconda2-latest-Linux-x86_64.sh

COPY .bashrc /home/guest/.bashrc
