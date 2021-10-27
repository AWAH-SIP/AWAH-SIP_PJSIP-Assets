# PJSIP include for Windows x86-64

    DEFINES     +=  PJMEDIA_HAS_OPUS_CODEC=1

    QMAKE_LFLAGS  += " /NODEFAULTLIB:LIBCMT "

    INCLUDEPATH += $$PWD/include \
                $$PWD/opus-1.3.1/include

    LIBS        += \
                -L$$PWD/lib \
                -L$$PWD/opus-1.3.1/win32/VS2015/x64/Release \
                -llibpjproject-x86_64-x64-vc14-Release \
                -lpjsua2-lib-x86_64-x64-vc14-Release \
                -lpjsua-lib-x86_64-x64-vc14-Release \
                -lpjsip-ua-x86_64-x64-vc14-Release \
                -lpjsip-simple-x86_64-x64-vc14-Release \
                -lpjsip-core-x86_64-x64-vc14-Release \
                -lpjmedia-codec-x86_64-x64-vc14-Release \
                -lpjmedia-x86_64-x64-vc14-Release \
                -lpjmedia-videodev-x86_64-x64-vc14-Release \
                -lpjmedia-audiodev-x86_64-x64-vc14-Release \
                -lpjmedia-x86_64-x64-vc14-Release \
                -lpjnath-x86_64-x64-vc14-Release \
                -lpjlib-util-x86_64-x64-vc14-Release \
                -llibsrtp-x86_64-x64-vc14-Release \
                -llibresample-x86_64-x64-vc14-Release \
                -llibgsmcodec-x86_64-x64-vc14-Release \
                -llibspeex-x86_64-x64-vc14-Release \
                -llibilbccodec-x86_64-x64-vc14-Release \
                -llibg7221codec-x86_64-x64-vc14-Release \
                -llibyuv-x86_64-x64-vc14-Release \
                -llibwebrtc-x86_64-x64-vc14-Release \
                -lpjlib-x86_64-x64-vc14-Release \
                -lopus \
                -lwinmm \
                -lole32 \
                -lws2_32 \
                -lwsock32 \
                -lgdi32

