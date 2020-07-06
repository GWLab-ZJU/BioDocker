# Copyright (C) 2019-2020 YU Zhejian
# Version 1
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM yl-ubuntu-base

RUN apt-get install -y --no-install-recommends --no-install-suggests r-base g++ gfortran cpp clang

RUN echo 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))' >> /home/guest/.Rprofile

RUN apt-get clean;rm -rf /tmp/* 
