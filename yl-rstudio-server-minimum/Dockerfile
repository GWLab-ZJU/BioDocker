# Copyright (C) 2019-2020 YU Zhejian
# Version 11
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM yl-r-base

RUN apt-get install -y --no-install-recommends --no-install-suggests psmisc lsb-release libclang-dev locales unixodbc unixodbc-dev libcurl4-gnutls-dev libssl1.1 libssl-dev libuser libuser1-dev rrdtool libapparmor1 libcurl4 libjpeg8 libopenblas-dev libpaper-utils libtcl8.6 libtiff5 libtk8.6 unixodbc unixodbc-dev libxt6 libaio1 libsasl2-dev openssh-server

COPY rstudio-server-*-amd64.deb /

RUN dpkg -i  rstudio-server-*-amd64.deb || apt-get -fy install 

RUN echo 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))'>>/root/.Rprofile

RUN apt-get clean;rm -rf tmp/* rstudio-server-*-amd64.deb

EXPOSE 8787/tcp 22/tcp

CMD service rstudio-server restart;service ssh start;chmod a+w /home/guest/data -R;chmod a+r /home/guest/data -R;chmod a+x /home/guest/data; while true;do date;sleep 60;done
