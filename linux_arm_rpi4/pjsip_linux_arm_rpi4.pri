# PJSIP include for Linux arm

DEFINES += PJ_IS_LITTLE_ENDIAN=1 \
           PJ_IS_BIG_ENDIAN=0

INCLUDEPATH += $$PWD/include

    LIBS += \
            -L$$PWD/lib \
            -lpjsua2-arm-unknown-linux-gnueabihf \
            -lstdc++ \
            -lpjsua-arm-unknown-linux-gnueabihf \
            -lpjsip-ua-arm-unknown-linux-gnueabihf \
            -lpjsip-simple-arm-unknown-linux-gnueabihf \
            -lpjsip-arm-unknown-linux-gnueabihf \
            -lpjmedia-codec-arm-unknown-linux-gnueabihf \
            -lpjmedia-arm-unknown-linux-gnueabihf \
            -lpjmedia-videodev-arm-unknown-linux-gnueabihf \
            -lpjmedia-audiodev-arm-unknown-linux-gnueabihf \
            -lpjmedia-arm-unknown-linux-gnueabihf \
            -lpjnath-arm-unknown-linux-gnueabihf \
            -lpjlib-util-arm-unknown-linux-gnueabihf  \
            -lsrtp-arm-unknown-linux-gnueabihf \
            -lresample-arm-unknown-linux-gnueabihf \
            -lgsmcodec-arm-unknown-linux-gnueabihf \
            -lspeex-arm-unknown-linux-gnueabihf \
            -lilbccodec-arm-unknown-linux-gnueabihf \
            -lg7221codec-arm-unknown-linux-gnueabihf \
            -lyuv-arm-unknown-linux-gnueabihf \
            -lwebrtc-arm-unknown-linux-gnueabihf  \
            -lpj-arm-unknown-linux-gnueabihf \
            -lopus \
            -lssl \
            -lcrypto \
            -luuid \
            -lm \
            -lrt \
            -lpthread  \
            -lasound
