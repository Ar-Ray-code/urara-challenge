FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
      && apt-get install --no-install-recommends --no-install-suggests -y \
      gnupg2 \
      ca-certificates \
      git \
      wget \
      build-essential \
      cmake \
      libgtk-3-dev \
      libboost-all-dev \
      libopencv-dev \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
# COPY ./yolov4-tiny-docker.bash /workspace

RUN mkdir -p /usr/local/cuda/lib64/stubs/ && mkdir -p /workspace/target-dir
RUN ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1
RUN LD_LIBRARY_PATH=/usr/local/cuda/lib64/stubs/:$LD_LIBRARY_PATH

RUN git clone https://github.com/Ar-Ray-code/darknet.git -b export-video 
RUN cd /workspace/darknet && make -j$(nproc)
# COPY ./darknet-ros-docker.bash /workspace/darknet-ros-docker.bash

CMD ["bash"]

# docker run -it --rm --runtime nvidia -v /tmp/.X11-unix:/tmp/.X11-unix --mount type=bind,source=$(pwd)/target-dir,target=/workspace/target-dir yolov4csp /bin/bash

# docker build -t yolov4csp -f Dockerfile-yolov4csp ./
# docker run --rm -it \
#   --runtime nvidia \
#   --mount type=bind,source=$(pwd)/target-dir,target=/workspace/target-dir \
#   urarachallenge /bin/bash ./challenge.bash

#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -v $VIDEO_MP4_PATH:/workspace/target.mp4 \
#   -v $VIDEO_CSV_PATH:/workspace/target.csv \