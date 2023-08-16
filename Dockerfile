# https://developer.nvidia.com/compute/cudnn/secure/8.6.0/local_installers/11.8/cudnn-local-repo-ubuntu2004-8.6.0.163_1.0-1_amd64.deb
# ↑をマウントフォルダにダウンロード
# $bash /code/adjust_cudnn_version.sh を実行


# FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04
# FROM nvidia/cuda:12.2.0-devel-ubuntu22.04
FROM nvidia/cuda:11.2.2-base-ubuntu20.04
# FROM ubuntu:22.04

RUN apt update && apt -y upgrade && \
    apt install -y python3 python3-pip python3-dev && \
    apt install -y git && \
    apt install -y wget 
    # apt install -y net-tools vim
    # apt install -y ubuntu-drivers-common

# RUN apt remove nvidia-* && \
#     add-apt-repository ppa:graphics-drivers/ppa

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    rm /etc/apt/sources.list.d/cuda.list && \
    apt update && \
    apt install -y cuda-11-2 && \
    # apt install -y nvidia-gds && \
    echo -e export PATH=\"/usr/local/cuda/bin:\$PATH\"\\nexport LD_LIBRARY_PATH=\"/usr/local/cuda/lib64:\$LD_LIBRARY_PATH\" >> ~/.bashrc

COPY ./requirements.txt /requirements.txt
RUN pip3 install --upgrade pip && \
    pip3 install -r /requirements.txt


# $apt upgrade
# The following packages have been kept back

# $apt install < The following packages have been kept back の奴ら >