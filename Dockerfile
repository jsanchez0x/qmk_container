FROM debian:stable-slim

LABEL maintainer="Jorge Sánchez <hola@jsanchez.me>"

# Set the default location for qmk_firmware
ENV QMK_HOME /qmk_firmware

# Install basic utils
RUN apt-get update && apt-get install --no-install-recommends -y \
    autoconf \
    avrdude \
    avr-libc \
    binutils-arm-none-eabi \
    binutils-avr \
    binutils-riscv64-unknown-elf \
    build-essential \
    bzip2 \
    ca-certificates \
    clang-format \
    clang-format-11 \
    dfu-programmer \
    dfu-util \
    dos2unix \
    gcc \
    gcc-arm-none-eabi \
    gcc-avr \
    gcc-riscv64-unknown-elf \
    git \
    g++ \
    libfl2 \
    libhidapi-hidraw0 \
    libnewlib-arm-none-eabi \
    libusb-dev \
    make \
    mingw-w64 \
    picolibc-riscv64-unknown-elf \
    python3 \
    python3-pip \
    software-properties-common \
    tar \
    teensy-loader-cli \
    texinfo \
    unzip \
    zip && \
    rm -rf /var/lib/apt/lists/*
    
ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# Install python packages
RUN python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    python3 -m pip install --no-cache-dir nose2 yapf qmk

# QMK Setup
RUN qmk setup --yes && \
    mkdir -p /etc/udev/rules.d/ && \
    cp $QMK_HOME/util/udev/50-qmk.rules /etc/udev/rules.d/ && \
    rm -rf $QMK_HOME/keyboards/*
