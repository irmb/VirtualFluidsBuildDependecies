# VirtualFluids BuildDependencies:
# Ubuntu 20.04
# general tools: wget, unzip, git
# CMake 3.19.4 (openssl required)
# ccache
# gcc 9.3 (default)
# openmpi 4.0.3
# openmp
# cuda 11.1.1 as base image
# clang 10.0 (default)
# boost serialization 1.71

FROM nvidia/cuda:11.1.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get install -y\
    wget unzip\
    libssl-dev \
    git \
    build-essential \
    ccache \
    ninja-build \
    openmpi-bin=4.0.3-0ubuntu1 \
    libomp-dev \
    clang clang-format clang-tidy clang-tools llvm-dev libclang-dev \
    libboost-serialization1.71-dev &&\
    mkdir -p /tmp && cd \tmp &&\
    version=3.19 && build=4 &&\
    wget https://cmake.org/files/v$version/cmake-$version.$build-Linux-x86_64.tar.gz &&\
    tar -xzvf cmake-$version.$build-Linux-x86_64.tar.gz


ENV PATH="/tmp/cmake-3.19.4-Linux-x86_64/bin:$PATH"