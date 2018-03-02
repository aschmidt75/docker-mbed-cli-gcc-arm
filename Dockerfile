FROM debian:9

RUN dpkg --add-architecture i386 \
  && DEBIAN_FRONTEND=noninteractive apt-get update -y -q \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
    python python-pip \
    libc6:i386 libncurses5:i386 libstdc++6:i386 \
    binutils-arm-none-eabi gcc-arm-none-eabi crossbuild-essential-armhf build-essential git mercurial \
  && pip install mbed-cli

ENV MBED_GCC_ARM_PATH /usr/bin

WORKDIR /mbed
VOLUME /mbed

# force mbed cli into installing missing python libs and toolchain
RUN cd /tmp && mbed new tmp0 && cd tmp0 && mbed compile >/dev/null 2>&1; cd .. && rm -r /tmp/tmp0 ; \
    mbed config --global toolchain gcc_arm

ENTRYPOINT [ "/usr/local/bin/mbed" ]
