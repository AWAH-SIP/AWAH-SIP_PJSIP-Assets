# PJSIP include for Windows x86-64

    DEFINES     +=  PJMEDIA_HAS_OPUS_CODEC=1

    Release:QMAKE_LFLAGS  += " /NODEFAULTLIB:LIBCMT "
    Debug:QMAKE_LFLAGS  += " /NODEFAULTLIB:LIBCMTD "

    INCLUDEPATH += $$PWD/include \
                $$PWD/opus-1.3.1/include \
                $$PWD/openssl-1.1/x86/include

    Release:LIBS        += \
                -L$$PWD/lib \
                -L$$PWD/opus-1.3.1/win32/VS2015/Win32/Release \
                -L$$PWD/openssl-1.1/x86/lib \
                -llibpjproject-i386-Win32-vc14-Release \
                -lpjsua2-lib-i386-Win32-vc14-Release \
                -lpjsua-lib-i386-Win32-vc14-Release \
                -lpjsip-ua-i386-Win32-vc14-Release \
                -lpjsip-simple-i386-Win32-vc14-Release \
                -lpjsip-core-i386-Win32-vc14-Release \
                -lpjmedia-codec-i386-Win32-vc14-Release \
                -lpjmedia-i386-Win32-vc14-Release \
                -lpjmedia-videodev-i386-Win32-vc14-Release \
                -lpjmedia-audiodev-i386-Win32-vc14-Release \
                -lpjmedia-i386-Win32-vc14-Release \
                -lpjnath-i386-Win32-vc14-Release \
                -lpjlib-util-i386-Win32-vc14-Release \
                -llibsrtp-i386-Win32-vc14-Release \
                -llibresample-i386-Win32-vc14-Release \
                -llibgsmcodec-i386-Win32-vc14-Release \
                -llibspeex-i386-Win32-vc14-Release \
                -llibilbccodec-i386-Win32-vc14-Release \
                -llibg7221codec-i386-Win32-vc14-Release \
                -llibyuv-i386-Win32-vc14-Release \
                -llibwebrtc-i386-Win32-vc14-Release \
                -lpjlib-i386-Win32-vc14-Release \
                -llibopus \
                -llibssl \
                -llibcrypto \
                -lwinmm \
                -lole32 \
                -lws2_32 \
                -lwsock32 \
                -lgdi32

    Debug:LIBS        += \
            -L$$PWD/lib \
            -L$$PWD/opus-1.3.1/win32/VS2015/Win32/Debug \
            -L$$PWD/openssl-1.1/x86/lib \
            -llibpjproject-i386-Win32-vc14-Debug-Dynamic \
            -lpjsua2-lib-i386-Win32-vc14-Debug-Dynamic \
            -lpjsua-lib-i386-Win32-vc14-Debug-Dynamic \
            -lpjsip-ua-i386-Win32-vc14-Debug-Dynamic \
            -lpjsip-simple-i386-Win32-vc14-Debug-Dynamic \
            -lpjsip-core-i386-Win32-vc14-Debug-Dynamic \
            -lpjmedia-codec-i386-Win32-vc14-Debug-Dynamic \
            -lpjmedia-i386-Win32-vc14-Debug-Dynamic \
            -lpjmedia-videodev-i386-Win32-vc14-Debug-Dynamic \
            -lpjmedia-audiodev-i386-Win32-vc14-Debug-Dynamic \
            -lpjmedia-i386-Win32-vc14-Debug-Dynamic \
            -lpjnath-i386-Win32-vc14-Debug-Dynamic \
            -lpjlib-util-i386-Win32-vc14-Debug-Dynamic \
            -llibsrtp-i386-Win32-vc14-Debug-Dynamic \
            -llibresample-i386-Win32-vc14-Debug-Dynamic \
            -llibgsmcodec-i386-Win32-vc14-Debug-Dynamic \
            -llibspeex-i386-Win32-vc14-Debug-Dynamic \
            -llibilbccodec-i386-Win32-vc14-Debug-Dynamic \
            -llibg7221codec-i386-Win32-vc14-Debug-Dynamic \
            -llibyuv-i386-Win32-vc14-Debug-Dynamic \
            -llibwebrtc-i386-Win32-vc14-Debug-Dynamic \
            -lpjlib-i386-Win32-vc14-Debug-Dynamic \
            -llibopus \
            -llibssl \
            -llibcrypto \
            -lwinmm \
            -lole32 \
            -lws2_32 \
            -lwsock32 \
            -lgdi32
