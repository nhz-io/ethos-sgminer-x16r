FROM ubuntu

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update -y && \
  apt-get install -y \
     autoconf libcurl4-openssl-dev pkg-config libtool automake libncurses5-dev \
     build-essential curl wget git g++ binutils file zlib1g-dev libedit-dev \
     ocl-icd-dev ocl-icd-opencl-dev ocl-icd-libopencl1 libpci-dev libvdpau1 \
     opencl-headers libjansson*

WORKDIR /sgminer-gm-x16r
ADD ./build.sh /sgminer-gm-x16r/build.sh

CMD ./build.sh
