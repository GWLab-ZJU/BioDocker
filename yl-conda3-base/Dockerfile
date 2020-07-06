# Copyright (C) 2019-2020 YU Zhejian
# Version 1
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM yl-ubuntu-base

USER guest

WORKDIR /home/guest/

RUN axel https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh && chmod +x Miniconda3-latest-Linux-x86_64.sh && ./Miniconda3-latest-Linux-x86_64.sh -b -p conda && rm Miniconda3-latest-Linux-x86_64.sh

COPY .bashrc /home/guest/.bashrc

COPY .condarc /home/guest/.condarc

COPY install.sh /home/guest/install.sh

RUN bash install.sh

RUN rm -rf /tmp/* 
