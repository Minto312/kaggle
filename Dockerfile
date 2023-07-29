FROM ubuntu:22.04
RUN apt update && apt -y upgrade && \
    apt install -y python3 python3-pip python3-dev && \
    apt install -y git && \
    apt install -y wget curl && \
    apt install -y net-tools && \
    apt install -y ubuntu-drivers-common

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    apt update && \
    apt install -y cuda && \
    apt install -y nvidia-gds && \
    export PATH="/usr/local/cuda/bin:$PATH" && \
    export PATH=/usr/local/cuda-12.2/bin${PATH:+:${PATH}} && \
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"


COPY ./requirements.txt /requirements.txt
RUN pip3 install --upgrade pip && \
    pip3 install -r /requirements.txt