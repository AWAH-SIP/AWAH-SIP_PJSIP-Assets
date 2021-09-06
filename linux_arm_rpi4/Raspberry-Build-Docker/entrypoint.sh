#!/bin/bash

ADDITIONAL_ARGS="${@:2}"

if [ "$1" = "build" ]; then
	echo "Starting to build PJSIP for RPi..."
	# unfortunately we have to specify the actual environment var here, because passing it in via CMD does not work with environment variables: https://docs.docker.com/engine/reference/builder/#environment-replacement
	if [ -z "$(ls -A $APP_SRCDIR)" ]; then
		echo "Mount point ${APP_SRCDIR} is empty, did you invoke the container with \"docker run --rm -v /path/to/pjsip/project:/var/build build\"?"
		exit 0
	else
		mkdir -p $APP_BUILDDIR
		cd $APP_SRCDIR
        sed -e '/ifneq ($(findstring sse2,@ac_webrtc_instset@),)/,+8d' third_party/build/os-auto.mak.in
        sed -e '/ifneq ($(findstring sse2,@ac_webrtc_instset@),)/,+17d' third_party/build/os-auto.mak.in
        cat third_party/build/os-auto.mak.in
        export PATH=$PATH:/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin
        export CPPFLAGS="-I/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/lib/gcc/arm-linux-gnueabihf/7.4.1/include -I/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/include -I/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include -I/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include -I/sysroot/opt/vc/include -I/sysroot/usr/lib/gcc/arm-linux-gnueabihf/8/include -I/sysroot/usr/include"
        printenv
        ./configure --host=arm-linux-gnueabihf CROSS_COMPILE="/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-" CC="/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc" LD="/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc"  CFLAGS="--sysroot=/sysroot" LDFLAGS="-L/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/lib -L/sysroot/lib/arm-linux-gnueabihf/ -ldl -lc  --sysroot=/sysroot" CPPFLAGS="" --prefix=$APP_BUILDDIR 
		make dep
        make -j4
        make install
	fi
else
	cd ~
	echo "If you wanted to use the container to build a PJSIP project, you have to invoke the container with command \"build\" and mount the project to /var/build"
	echo "Invoking container with command(s) ${@}..."
	"${@}"
fi
