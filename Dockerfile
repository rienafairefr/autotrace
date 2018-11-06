FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -yqq pstoedit
RUN apt-get install -yqq libmagickwand-dev libmagickcore-dev
RUN apt-get install -yqq libtool autopoint intltool
RUN apt-get install -yqq libpstoedit-dev
WORKDIR /app
COPY . /app
RUN autoreconf -ivf
RUN intltoolize --force
RUN aclocal
RUN ./autogen.sh
RUN ./configure --prefix=/usr
RUN make
RUN make install
