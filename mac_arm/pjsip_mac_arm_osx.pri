# PJSIP include for MacOS arm64

QMAKE_APPLE_DEVICE_ARCHS = arm64

INCLUDEPATH += $$PWD/include \
                /opt/homebrew/opt/openssl@1.1/include \
                /opt/homebrew/Cellar/opus/1.5.2/include \
                /opt/homebrew/Cellar/opencore-amr/0.1.6/include

    LIBS += \
            -L$$PWD/lib \
            -L/opt/homebrew/Cellar/opus/1.5.2/lib \
            -L/opt/homebrew/Cellar/opencore-amr/0.1.6/lib \
            -L/opt/homebrew/opt/openssl@1.1/lib \
            -lpjsua2-x86_64-arm-apple-darwin23.5.0 \
            -lstdc++ \
            -lpjsua-x86_64-arm-apple-darwin23.5.0 \
            -lpjsip-ua-x86_64-arm-apple-darwin23.5.0 \
            -lpjsip-simple-x86_64-arm-apple-darwin23.5.0 \
            -lpjsip-x86_64-arm-apple-darwin23.5.0 \
            -lpjmedia-codec-x86_64-arm-apple-darwin23.5.0 \
            -lpjmedia-x86_64-arm-apple-darwin23.5.0 \
            -lpjmedia-videodev-x86_64-arm-apple-darwin23.5.0 \
            -lpjmedia-audiodev-x86_64-arm-apple-darwin23.5.0 \
            -lpjmedia-x86_64-arm-apple-darwin23.5.0 \
            -lpjnath-x86_64-arm-apple-darwin23.5.0 \
            -lpjlib-util-x86_64-arm-apple-darwin23.5.0 \
            -lsrtp-x86_64-arm-apple-darwin23.5.0 \
            -lresample-x86_64-arm-apple-darwin23.5.0 \
            -lgsmcodec-x86_64-arm-apple-darwin23.5.0 \
            -lspeex-x86_64-arm-apple-darwin23.5.0 \
            -lilbccodec-x86_64-arm-apple-darwin23.5.0 \
            -lg7221codec-x86_64-arm-apple-darwin23.5.0 \
            -lyuv-x86_64-arm-apple-darwin23.5.0 \
            -lwebrtc-x86_64-arm-apple-darwin23.5.0 \
            -lpj-x86_64-arm-apple-darwin23.5.0 \
            -lm \
            -lpthread \
            -lopus \
            -lssl \
            -lcrypto \
            -lopencore-amrnb \
            -lopencore-amrwb \
            -framework CoreAudio \
            -framework CoreServices \
            -framework AudioUnit \
            -framework AudioToolbox \
            -framework Foundation \
            -framework AppKit \
            -framework AVFoundation \
            -framework CoreGraphics \
            -framework QuartzCore \
            -framework CoreVideo \
            -framework CoreMedia \
            -framework VideoToolbox \
            -framework Security

