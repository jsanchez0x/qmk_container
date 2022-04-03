FROM debian:11-slim

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
    ca-certificates \
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
    wget \
    zip && \
    rm -rf /var/lib/apt/lists/*
    
# Install optionals emulation utils
RUN apt-get update && apt-get install --no-install-recommends -y \  
    binfmt-support \
    qemu \
    qemu-user-static 

# upgrade avr-gcc... for reasons?
# RUN /bin/bash -c "set -o pipefail && \
#    wget -q https://github.com/ZakKemble/avr-gcc-build/releases/download/v11.1.0-1/avr-gcc-11.1.0-x64-linux.tar.bz2 -O - | tee /tmp/avr-gcc-11.1.0-x64-linux.tar.bz2 | md5sum -c <(echo '53BBFC8CA900F2583A1DC45F13F589BF  -') && \
#    tar xfj /tmp/avr-gcc-11.1.0-x64-linux.tar.bz2 --strip-components=1 -C / && \
#    rm -rf /share/ /tmp/*"

# Install python packages
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN python3 -m pip install nose2 yapf qmk

# Install avr-gcc
# RUN cd /tmp && \
#    wget -q https://raw.githubusercontent.com/ZakKemble/avr-gcc-build/master/avr-gcc-build.sh -O avr-gcc-build.sh && \
#    chmod +x avr-gcc-build.sh && \
#    ./avr-gcc-build.sh

# Set the default location for qmk_firmware
ENV QMK_HOME /qmk_firmware

# Run initial QMK setup
RUN qmk setup --yes

# Set udev rules
RUN mkdir -p /etc/udev/rules.d/ &&\
    cp $QMK_HOME/util/udev/50-qmk.rules /etc/udev/rules.d/
