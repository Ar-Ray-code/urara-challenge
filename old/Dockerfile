FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/*
ENV LANG=en_US.UTF-8

RUN apt update && \
    apt -y install git && \
    apt -y install python3-pip && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
RUN git clone https://github.com/Megvii-BaseDetection/YOLOX.git
RUN wget https://github.com/Megvii-BaseDetection/YOLOX/releases/download/0.1.1rc0/yolox_x.pth

RUN cd YOLOX && \
    pip3 install -U pip && pip3 install -r requirements.txt && \
    pip3 install -v -e . && \
    python3 setup.py install && \
    pip3 install cython; pip3 install 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'

COPY ./yolox-x.bash /workspace/yolox-x.bash

CMD ["bash"]

# ================================
# VIDEO_MP4_PATH=~/Videos/test.mp4
# VIDEO_CSV_PATH=~/Videos/test.csv
#
# YOLOX_X=~/Downloads/yolox-.pth
#
# docker build . -t urarachallenge
# docker run --rm -it \
#   --runtime nvidia \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -v $VIDEO_MP4_PATH:/workspace/target.mp4 \
#   -v $VIDEO_CSV_PATH:/workspace/target.csv \
#   urarachallenge /bin/bash ./challenge.bash