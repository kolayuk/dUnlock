# Add more folders to ship with the application, here
folder_01.source = qml/JellyUnlock
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

qt_components.pkg_prerules += "(0x200346DE), 1, 0, 0, {\"Qt Components\"}"
symbian:DEPLOYMENT += qt_components
mob.pkg_prerules += "(0x2002AC89), 1, 1, 3, {\"QtMobility\"}"
symbian:DEPLOYMENT += mob
TARGET="JellyUnlock"
symbian:DEPLOYMENT.display_name="dUnlock"
symbian:TARGET.UID3 = 0x20067B14
symbian:TARGET.CAPABILITY += WriteDeviceData ReadDeviceData ReadUserData PowerMgmt
CONFIG += qt-components

symbian:INCLUDEPATH+=D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/include/mw
symbian:INCLUDEPATH+=D:\Symbian\QtSDK112\Symbian\SDKs\Symbian3Qt473\epoc32\include

locs.source=D:\Symbian\QtSDK\workspace\JellyUnlock\lang
locs.target = C:\system\apps\JellyUnlock
symbian:DEPLOYMENTFOLDERS+=locs


wp1 =  "\"D:\\Symbian\\QtSDK\\workspace\\JellyUnlock\\meego.png\"		  -\"C:\\Data\\Images\\Android.png\" \
\"D:\\Symbian\\QtSDK\\workspace\\JellyUnlock\\splash_v.jpg\"		  -\"C:\\System\\JellyUnlock\\splash_v.jpg\" \
\"D:\\Symbian\\QtSDK\\workspace\\JellyUnlock\\splash_h.jpg\"		  -\"C:\\System\\JellyUnlock\\splash_h.jpg\" "
wp.pkg_postrules = wp1
symbian:DEPLOYMENT += wp
symbian:ICON="JellyUnlock.svg"
#qml.source=D:\Symbian\QtSDK\workspace\JellyUnlockSrv\qml
#qml.target = !:\\private\e48dd893\qml
#symbian:DEPLOYMENTFOLDERS+=qml

vendorinfo =  "%{\"Alexander Fokin\"}" \
    ":\"Alexander Fokin\""
vendor.pkg_prerules = vendorinfo
symbian:DEPLOYMENT += vendor

packageheader = "$${LITERAL_HASH}{\"dUnlock\"}, (0x20067B13), 1, 1, 0, TYPE=SA"
info.pkg_prerules=packageheader
symbian:DEPLOYMENT+=info

symbian:LIBS+=-lmgfetch -lbafl -lefsrv
symbian:LIBS+=-leikcore
symbian:LIBS+=-lavkon
symbian:LIBS+=-leiksrv
symbian:LIBS+=-lcone
symbian:LIBS+=-lapparc
symbian:LIBS+=-lapgrfx
symbian:LIBS+=-lbitgdi -lapmime -limageconversion -lws32 -lfbscli -lgdi


SOURCES += main.cpp localizer.cpp \
    application.cpp
HEADERS += localizer.h \
    application.h \
    const.h
symbian:HEADERS+=SplashControl.h
symbian:SOURCES+=SplashControl.cpp
# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

srv =  "\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/release/$(PLATFORM)/$(TARGET)/JellyUnlockSrv.exe\" - \"!:\sys\bin\JellyUnlockSrv.exe\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/resource/apps/JellyUnlockSrv.rsc\" - \"!:\resource\apps\JellyUnlockSrv.rsc\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/resource/apps/JellyUnlockSrv.mif\" - \"!:\resource\apps\JellyUnlockSrv.mif\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/10003a3f/import/apps/JellyUnlockSrv_reg.rsc\" - \"!:\private\10003a3f\import\apps\JellyUnlockSrv_reg.rsc\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/AndroidClock.ttf\" - \"!:\private\20067B13\qml\JellyUnlockSrv\AndroidClock.ttf\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/big_circle.svg\" - \"!:\private\20067B13\qml\JellyUnlockSrv\big_circle.svg\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/Button.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Button.qml\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/call_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\call_activated.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/call_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\call_normal.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/camera_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\camera_activated.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/camera_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\camera_normal.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/DigitalClock.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\DigitalClock.qml\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/DroidSans.ttf\" - \"!:\private\20067B13\qml\JellyUnlockSrv\DroidSans.ttf\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/handle_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\handle_normal.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/handle_pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\handle_pressed.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/main.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\main.qml\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/Player.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Player.qml\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/SmallClock.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SmallClock.qml\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/sms_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\sms_activated.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/sms_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\sms_normal.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/StatusBar.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\StatusBar.qml\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/unlock_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\unlock_activated.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/unlock_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\unlock_normal.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/launch_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\launch_normal.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/launch_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\launch_activated.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/LaunchArea.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\LaunchArea.qml\" \
#\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/wallpaper.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\wallpaper.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/next-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\next-pressed.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/next.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\next.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/pause-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\pause-pressed.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/pause.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\pause.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/play-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\play-pressed.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/play.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\play.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/prev-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\prev-pressed.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/prev.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\prev.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/stop-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\stop-pressed.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/player/stop.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\stop.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-3g-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-3g-active.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery-low.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery-low.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery-verylow.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery-verylow.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery1.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery2.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery3.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery4.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery5.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery6.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery6.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery7.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery7.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-battery8.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery8.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-bluetooth.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-bluetooth.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-charger.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-charger.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-flight-mode.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-flight-mode.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-gsm-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-gsm-active.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-network0.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network0.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-network1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network1.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-network2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network2.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-network3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network3.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-network4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network4.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-network5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network5.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-no-gsm-connection.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-no-gsm-connection.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-offline.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-offline.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-silent.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-silent.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-wlan-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-wlan-active.png\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/z/private/20067B13/qml/JellyUnlockSrv/status-icons/icon-s-status-wlan.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-wlan.png\" \
\"D:/Symbian/QtSDK/workspace/JellyUnlock/qml/JellyUnlock/logo_small.png\" - \"C:\System\Apps\JellyUnlock\firststart\" \
\"D:/Symbian/9.4/S60_5th_Edition_SDK_v1.0/epoc32/release/armv5/urel/JellyUnlockAnim.dll\" - \"!:\sys\bin\JellyUnlockAnim.dll\" \
\"D:/Symbian/9.4/S60_5th_Edition_SDK_v1.0/epoc32/release/gcce/urel/JellyUnlockStarter.exe\" - \"C:\sys\bin\JellyUnlockStarter.exe\" \
\"D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/data/jellystartup.rsc\" - \"C:/private/101f875a/import/[20067B13].rsc\""
srv1.pkg_postrules = srv
symbian:DEPLOYMENT += srv1

symbian:DEPLOYMENT.installer_header = "$${LITERAL_HASH}{\"dUnlock\"},(0x2002CCCF),1,1,0"


MMP_RULES+="DEBUGGABLE"
