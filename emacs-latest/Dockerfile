# IMAGE: docker build . -t ody55eus/emacs-latest:latest
FROM debian:bookworm
MAINTAINER Jonathan Pieper <jpieper@mailbox.org>

RUN echo "deb-src http://deb.debian.org/debian bookworm main" >> /etc/apt/sources.list
RUN apt update --fix-missing && apt upgrade -y && apt install -y \
    curl git make nodejs default-jre python3-pip \
    texlive-science texlive-latex-extra texlive-publishers latexmk \
    dvipng man-db cm-super graphviz && \
    apt-get build-dep emacs -y && \
    apt-get --purge remove -y .\*-doc$ && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and install latest emacs
RUN git clone https://git.savannah.gnu.org/git/emacs.git
RUN cd emacs && ./autogen.sh && ./configure && \
    make && make install

WORKDIR /root
