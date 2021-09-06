FROM --platform=linux/arm/v7 balenalib/rpi-raspbian:buster as raspi

LABEL maintainer="AWAH-SIP@users.noreply.github.com"
LABEL stage=qt-raspberry-base

# UID/GID injection on build if wanted
ARG USER_UID=
ARG USER_GID=

# In case you have to build behind a proxy
ARG PROXY=
ENV http_proxy=$PROXY
ENV https_proxy=$PROXY

# Name of the regular user. Does not look useful but can save a bit time when changing
ENV QT_USERNAME=qt

# Needed in both builder and qt stages, so has to be defined here
ENV QT_PREFIX=/usr/local

# Install all build dependencies
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y --no-install-recommends install \
	ca-certificates \
	# sudo to be able to modify the container as the user, if needed.
	sudo \
	curl \
	python \
	gperf \
	bison \
	flex \
	build-essential \
	pkg-config \
	cmake \
	# bc suggested for openssl tests
	bc \
	libssl-dev \
	# git is needed to build openssl in older versions
	git \
	# bash needed for argument substitution in entrypoint
	bash \
	uuid uuid-dev \
	libasound2-dev \
	libopus-dev \
	libopencore-amrwb-dev \
	libopencore-amrnb-dev \
	&& apt-get -qq clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& printf "#!/bin/sh\nls -lah" > /usr/local/bin/ll && chmod +x /usr/local/bin/ll

# Adding regular user
RUN if [ ${USER_GID} ]; then \
	addgroup -g ${USER_GID} ${QT_USERNAME}; \
	else \
	addgroup ${QT_USERNAME}; \
	fi \
	&& if [ ${USER_UID} ]; then \
	useradd -u ${USER_UID} -g ${QT_USERNAME} ${QT_USERNAME}; \
	else \
	useradd -g ${QT_USERNAME} ${QT_USERNAME}; \
	fi && mkdir /home/${QT_USERNAME}

# make sure the user is able to sudo if needed
RUN adduser ${QT_USERNAME} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


# AMD64 Docker as base for Cross-Compiling
FROM ubuntu:bionic as base

LABEL maintainer="adi.hilber@bluewin.ch"
LABEL stage=qt-build-base

# UID/GID injection on build if wanted
ARG USER_UID=
ARG USER_GID=

# In case you have to build behind a proxy
ARG PROXY=
ENV http_proxy=$PROXY
ENV https_proxy=$PROXY

# Name of the regular user. Does not look useful but can save a bit time when changing
ENV QT_USERNAME=qt

# Needed in both builder and qt stages, so has to be defined here
ENV QT_PREFIX=/usr/local

# Install all build dependencies
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y --no-install-recommends install \
	ca-certificates \
	# sudo to be able to modify the container as the user, if needed.
	sudo \
	curl \
	python \
	gperf \
	bison \
	flex \
	build-essential \
	pkg-config \
	cmake \
	# bc suggested for openssl tests
	bc \
	libssl-dev \
	# git is needed to build openssl in older versions
	git \
	# bash needed for argument substitution in entrypoint
	bash \
	libasound2-dev \
	libopus-dev \
	libopencore-amrwb-dev \
	libopencore-amrnb-dev \
	wget \
	rsync \
	subversion \
	&& apt-get -qq clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& printf "#!/bin/sh\nls -lah" > /usr/local/bin/ll && chmod +x /usr/local/bin/ll

# Adding regular user
RUN if [ ${USER_GID} ]; then \
	addgroup -g ${USER_GID} ${QT_USERNAME}; \
	else \
	addgroup ${QT_USERNAME}; \
	fi \
	&& if [ ${USER_UID} ]; then \
	useradd -u ${USER_UID} -g ${QT_USERNAME} ${QT_USERNAME}; \
	else \
	useradd -g ${QT_USERNAME} ${QT_USERNAME}; \
	fi && mkdir /home/${QT_USERNAME}

# make sure the user is able to sudo if needed
RUN adduser ${QT_USERNAME} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# build stage
FROM base as builder

LABEL stage=qt-build-builder

# Raspi Type
ARG RASPI_TYPE="pi4"
ENV RASPI_TYPE=${RASPI_TYPE}

ENV QT_BUILD_ROOT=/tmp/qt_build

# Copy Raspi Sysroot
RUN wget -q https://raw.githubusercontent.com/riscv/riscv-poky/master/scripts/sysroot-relativelinks.py \
	-O /usr/local/bin/sysroot-relativelinks.py && \
	chmod +x /usr/local/bin/sysroot-relativelinks.py

RUN mkdir -p /sysroot/usr /sysroot/opt /sysroot/lib
COPY --from=raspi /lib/ /sysroot/lib/
COPY --from=raspi /usr/include/ /sysroot/usr/include/
COPY --from=raspi /usr/lib/ /sysroot/usr/lib/
COPY --from=raspi /opt/vc/ /sysroot/opt/vc/
RUN /usr/local/bin/sysroot-relativelinks.py /sysroot

# Download Cross-Compile Tool
WORKDIR /src
RUN wget -q https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz && tar xf gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz && rm gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz

# Download opt Part of RPi Firmware
RUN svn checkout -q https://github.com/raspberrypi/firmware/trunk/opt && rsync \
	-aP \
	--exclude '*android*' \
	--exclude 'hello_pi' \
	--exclude '.svn' \
	/src/opt/ /sysroot/opt/ && rm -r /src/opt



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# resulting image with environment
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FROM base as crosscompiler

ENV ENTRYPOINT_DIR=/usr/local/bin
ENV APP_BUILDDIR=/var/build
ENV APP_SRCDIR=/var/src

COPY --from=builder /sysroot /sysroot
RUN true
COPY --from=builder /src /src

# the next copy statement failed often. My only guess is, that the extra dependencies are not existent and somehow that
# triggers a failure here.... A workaround for similar issues is to put an empty run statement in between: https://github.com/moby/moby/issues/37965
RUN true
COPY entrypoint.sh ${ENTRYPOINT_DIR}

RUN chmod +x ${ENTRYPOINT_DIR}/entrypoint.sh

VOLUME ["${APP_BUILDDIR}"]
VOLUME ["${APP_SRCDIR}"]

#USER ${QT_USERNAME}

ENTRYPOINT ["entrypoint.sh"]