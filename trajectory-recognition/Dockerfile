# IMAGE: docker build . -t ody55eus/trajecog:base
FROM debian:latest

WORKDIR /root

# Install dependencies
RUN apt update && apt upgrade && apt install -y \
    build-essential \
    cmake \
    pkg-config \
    wget \
    git \
    unzip \
    nano \
    curl \
	python3-pip \
    libopencv-dev \
    && apt-get autoclean && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install numpy virtualenv opencv-python scikit-learn
RUN pip3 install pybgs

WORKDIR /root

