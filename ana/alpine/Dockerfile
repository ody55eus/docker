# Python Analysis Docker Image
FROM alpine:latest
MAINTAINER Jonathan Pieper <ody55eus@mailbox.org>

ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Install system packages
RUN apk add --no-cache \
    curl git nodejs openssh-client make \
    libgfortran build-base hdf5-dev \
    texmf-dist-most texlive-xetex texlive-luatex \
    texlive-dvi texmf-dist-langextra \
    openjdk11-jre graphviz emacs \
    python3 py3-pip py3-scipy py3-pandas py3-matplotlib

# Make sure pdftex.map is available
# see https://gitlab.alpinelinux.org/alpine/aports/-/issues/12834
RUN mktexlsr && \
    updmap-sys --syncwithtrees && \
    fmtutil-sys --all

# add credentials to download extra software
ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/ && \
    echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa && \
    chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/id_rsa

# Trust my private GitLab server
RUN touch /root/.ssh/known_hosts && \
    ssh-keyscan -p 223 gitlab.ody5.de >> /root/.ssh/known_hosts

# Download and install analysis software and data
RUN mkdir /opt/lab-book && \
    git clone ssh://git@gitlab.ody5.de:223/agm/spectrumanalyzer.git /opt/lab-book/spectrumanalyzer && \
    git clone --recursive ssh://git@gitlab.ody5.de:223/agm/ana.git /opt/lab-book/ana && \
    git clone ssh://git@gitlab.ody5.de:223/agm/method-paper.git /root/Projects/Code/method-paper

# Remove private SSH Key so nobody can use it.
RUN rm /root/.ssh/id_rsa

# Install Python packages
RUN ln -s /usr/bin/python3 /usr/bin/python && \
    python -m pip install --upgrade pip && \
    python -m pip install --upgrade seaborn h5py plantuml && \
    python -m pip install git+https://github.com/garrettj403/SciencePlots.git

# Install Analysis modules
RUN cd /opt/lab-book/spectrumanalyzer && python -m pip install -e . && \
    cd /opt/lab-book/ana && python -m pip install -e .

# Remove unnecessary packages
RUN apk --no-cache del build-base

# Link Projects
RUN mkdir -p /root/Projects/Code && \
    ln -s /root/Projects/Code/method-paper /root/Projects/Method-Paper && \
    ln -s /opt/lab-book /root/Projects/Code/lab-book

WORKDIR /root
