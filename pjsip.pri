# QT Include File for PJSIP Library for AWAHSipLib
macx {
    equals(M1_WITH_ROSETTA2, "1") {
        message("include PJSIP Library for MacOS on M1 with Rosetta 2")
        include(mac_x86-64/pjsip_mac_arm_osx.pri)
    } else {
        message("include PJSIP Library for MacOS intel")
        include(mac_x86-64/pjsip_mac_x86-64_osx.pri)
    }
}

linux-g++ {
    message("includes PJSIP Library for linux x86-64")
    include(linux_x86-64/pjsip_linux_x86-64.pri)
}

linux-rasp-pi4-v3d-g++ {
        message("includes PJSIP Library for linux arm")
        include(linux_arm_rpi4/pjsip_linux_arm_rpi4.pri)
}

win32 {
    message("includes PJSIP Library for Windows x86-64")
    include(win_x86-64/pjsip_win_x86-64.pri)
}

OTHER_FILES += \
    $$PWD/pjproject/pjsip/src/pjsip/* \
    $$PWD/pjproject/pjsip/src/pjsip-simple/* \
    $$PWD/pjproject/pjsip/src/pjsip-ua/* \
    $$PWD/pjproject/pjsip/src/pjsua-lib/* \
    $$PWD/pjproject/pjsip/src/pjsua2/* \
    $$PWD/pjproject/pjmedia/src/pjmedia-codec/* \
    $$PWD/pjproject/pjmedia/src/pjmedia/*
