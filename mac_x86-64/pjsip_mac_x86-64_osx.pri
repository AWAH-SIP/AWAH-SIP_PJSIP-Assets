# PJSIP include for MacOS x86-64

INCLUDEPATH += $$PWD/include \
                /usr/local/opt/openssl/include

    LIBS += \
            -L$$PWD/lib \
            -L/usr/local/Cellar/opus/1.3.1/lib \
            -L/usr/local/Cellar/opencore-amr/0.1.5/lib \
            -L/usr/local/opt/openssl/lib \
            -lpjsua2-x86_64-apple-darwin19.6.0 \
            -lstdc++ \
            -lpjsua-x86_64-apple-darwin19.6.0 \
            -lpjsip-ua-x86_64-apple-darwin19.6.0 \
            -lpjsip-simple-x86_64-apple-darwin19.6.0 \
            -lpjsip-x86_64-apple-darwin19.6.0 \
            -lpjmedia-codec-x86_64-apple-darwin19.6.0 \
            -lpjmedia-x86_64-apple-darwin19.6.0 \
            -lpjmedia-videodev-x86_64-apple-darwin19.6.0 \
            -lpjmedia-audiodev-x86_64-apple-darwin19.6.0 \
            -lpjmedia-x86_64-apple-darwin19.6.0 \
            -lpjnath-x86_64-apple-darwin19.6.0 \
            -lpjlib-util-x86_64-apple-darwin19.6.0 \
            -lsrtp-x86_64-apple-darwin19.6.0 \
            -lresample-x86_64-apple-darwin19.6.0 \
            -lgsmcodec-x86_64-apple-darwin19.6.0 \
            -lspeex-x86_64-apple-darwin19.6.0 \
            -lilbccodec-x86_64-apple-darwin19.6.0 \
            -lg7221codec-x86_64-apple-darwin19.6.0 \
            -lyuv-x86_64-apple-darwin19.6.0 \
            -lwebrtc-x86_64-apple-darwin19.6.0 \
            -lpj-x86_64-apple-darwin19.6.0 \
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

