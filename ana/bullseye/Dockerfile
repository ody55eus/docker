# Python Analysis Docker Image
FROM python:3.9-bullseye
MAINTAINER Jonathan Pieper <ody55eus@mailbox.org>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install system packages
RUN apt-get update --fix-missing && apt-get install -y \
    git nodejs default-jre \
    texlive texlive-science texlive-latex-extra texlive-xetex texlive-publishers \
    dvipng man-db cm-super graphviz emacs && \
    apt-get --purge remove -y .\*-doc$ && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
    git clone --recursive ssh://git@gitlab.ody5.de:223/agm/ana.git /opt/lab-book/ana

# Remove private SSH Key so nobody can use it.
RUN rm /root/.ssh/id_rsa

# Install Python packages
    RUN python -m pip install --upgrade pip && \
    python -m pip install --upgrade \
    numpy pandas scipy matplotlib seaborn h5py plantuml && \
    python -m pip install git+https://github.com/garrettj403/SciencePlots.git

# Install Analysis modules
RUN cd /opt/lab-book/spectrumanalyzer && python -m pip install -e . && \
    cd /opt/lab-book/ana && python -m pip install -e .

# Link Projects
RUN mkdir -p /root/Projects/Code && \
    ln -s /opt/lab-book /root/Projects/Code/lab-book

WORKDIR /root
