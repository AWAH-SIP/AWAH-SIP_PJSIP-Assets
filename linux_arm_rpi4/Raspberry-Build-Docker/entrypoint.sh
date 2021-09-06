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
        	sudo ./configure --host=arm-linux-gnueabihf CROSS_COMPILE="/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-" CC="/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc" LD="/src/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc"  CFLAGS="--sysroot=/sysroot" LDFLAGS="--sysroot=/sysroot" --prefix=$APP_BUILDDIR 
		sudo make dep
        	sudo make -j4
        	sudo make install
	fi
else
	cd ~
	echo "If you wanted to use the container to build a PJSIP project, you have to invoke the container with command \"build\" and mount the project to /var/build"
	echo "Invoking container with command(s) ${@}..."
	"${@}"
fi
