#!/bin/bash
test -d out || mkdir out -p -v

BUILD_CROSS_COMPILE=$HOME/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CLANG_PATH=$HOME/clang/bin
CROSS_COMPILE_ARM32=$HOME/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

CLANG_TRIPLE=aarch64-linux-gnu-

export ARCH=arm64
export PATH=${CLANG_PATH}:${PATH}
make -s -j$(nproc --all) O=out ARCH=arm64 r6p_defconfig
        make -j$(nproc --all) CC="ccache clang" O=out ARCH=arm64 CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-android- CROSS_COMPILE_ARM32=arm-linux-androideabi- LD=ld.lld