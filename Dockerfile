FROM nvidia/cuda:11.7.1-base-ubuntu22.04

# Environments
ARG DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
CMD nvidia-smi

# # Install linux CUDA 11.0
# RUN apt-get update -y && apt-get install -y cuda-nvcc-11-0

# Install Python 3
RUN apt-get -y update && apt-get -y install \
    python3 \
    python3-pip \
    ffmpeg libsm6 libxext6

# Install Python libraries with pip
RUN python3 -m pip install -U --no-cache-dir pip && python3 -m \
    pip install --no-cache-dir \
    rich \
    typer \
    pymediainfo \
    opencv_python \
    numpy

# # Install Torch with CUDA. Tensorflow apparently was not needed
# RUN pip3 install tensorflow==2.0.0
RUN python3 -m pip install -U --no-cache-dir pip && python3 -m \
    pip install --no-cache-dir \
    torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu117


# Install library
VOLUME /repo
WORKDIR /repo