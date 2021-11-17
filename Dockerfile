FROM debian:latest

LABEL maintainer.name="Firejox"
LABEL maintainer.email="firejox@gmail.com"

RUN apt-get update
RUN apt-get install -y gcc g++ clang python3 python3-dev \
        pkg-config python3-setuptools git \
        gir1.2-goocanvas-2.0 \
        python3-gi python3-gi-cairo python3-pygraphviz \
        gir1.2-gtk-3.0 ipython3 \
        openmpi-bin openmpi-common openmpi-doc libopenmpi-dev \
        autoconf cvs bzr unrar-free \
        gdb lldb valgrind \
        uncrustify \
        gsl-bin libgsl-dev libgslcblas0 \
        tcpdump \
        sqlite3 libsqlite3-dev \
        libxml2 libxml2-dev \
        cmake libc6-dev libclang-dev llvm-dev automake python3-pip \
        libgtk-3-dev \
        vtun lxc uml-utilities \
        libboost-all-dev git curl \
        qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
RUN apt clean

WORKDIR /usr/local/src/
RUN git clone https://github.com/CastXML/CastXML.git
RUN cd CastXML && cmake . && make && make install
RUN python3 -m pip install cxxfilt pygccxml

WORKDIR /
RUN curl https://www.nsnam.org/releases/ns-allinone-3.35.tar.bz2 | tar -jxv
RUN mv ns-allinone-3.35 ns-3
RUN chown -hR 1000 /ns-3

USER 1000

WORKDIR /ns-3/ns-3.35
RUN ./waf -d debug --enable-example --enable-tests configure
RUN ./waf

WORKDIR /ns-3/netanim-3.108
RUN qmake qt=qt5 NetAnim.pro && make

WORKDIR /ns-3

CMD ["/bin/bash"]
