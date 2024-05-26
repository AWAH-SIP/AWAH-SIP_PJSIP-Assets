#!/bin/bash

cd pjproject
./configure --prefix=/home/root/linux_x86-64
make -j$(nproc)
rm -r ../linux_x86-64/lib
rm -r ../linux_x86-64/include
make -j$(nproc) install
