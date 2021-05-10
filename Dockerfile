FROM x11docker/xfce

MAINTAINER Firejox <firejox@gmail.com>

RUN apt update
RUN apt install -y gcc g++ python3 python3-dev \
        mercurial bzr libqt4-dev qt4-dev-tools \
        cmake libc6-dev libc6-dev-i386 \
        gdb valgrind \
        gsl-bin libgsl-dev \
        flex bison libfl-dev \
        tcpdump \
        sqlite sqlite3 libsqlite3-dev \
        libxml2 libxml2-dev \
        libgtk2.0 libgtk2.0-dev \
        python3-pygccxml python3-gi python3-cairo \
        vtun lxc \
        uncrustify \
        doxygen graphviz imagemagick \
        texlive texlive-extra-utils texlive-latex-extra \
        python3-sphinx dia \
        python3-pygraphviz python-kiwi libgoocanvas-2.0-dev \
        libboost-signals-dev libboost-filesystem-dev \
        openmpi-bin openmpi-common openmpi-doc libopenmpi-dev 
RUN useradd -ms /bin/bash developer
USER developer

WORKDIR /home/developer/

RUN curl -O https://www.nsnam.org/releases/ns-allinone-3.32.tar.bz2
RUN tar -jxvf ns-allinone-3.32.tar.bz2
WORKDIR ns-allinone-3.32
RUN ./build.py --enable-examples --enable-tests
WORKDIR ns-3.32
RUN ./waf clean
RUN ./waf -d optimized --enable-example --enable-tests configure
RUN ./waf 

