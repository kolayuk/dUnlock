#ifndef CONST_H
#define CONST_H
#ifdef Q_OS_SYMBIAN
   #define KLangSettingFile "C:\\system\\apps\\JellyUnlock\\lang\\lang.setting"
   #define KLangFile "C:\\system\\apps\\JellyUnlock\\lang\\strings.l"
   #define KConfigFile "C:\\System\\Apps\\JellyUnlock\\config.ini"
   #define KFirstStart "C:\\System\\Apps\\JellyUnlock\\firststart"
#else
   #define KLangSettingFile "D:\\Symbian\\QtSDK\\workspace\\JellyUnlock\\lang\\lang.setting"
   #define KLangFile "D:\\Symbian\\QtSDK\\workspace\\JellyUnlock\\lang\\strings.l"
   #define KConfigFile "config.ini"
   #define KFirstStart "firststart"
#endif
#ifdef Q_OS_SYMBIAN
_LIT(KMyServer,"JellyUnlockSrv.exe");
_LIT(KMyServerStarter,"JellyUnlockStarter.exe");
#endif


const bool KAutostart=true;
const bool KWork=true;
const int KPlayer=1;
#define KPicture "file:///C:\\Data\\Images\\Android.png"
const int KZoom=1;
const int KUseSystemFont=0;
const QString app1="101F4CCE";
const QString app2="101F4CD5";
const QString app3="10005901";
const QString app4="102072C3";
const QString app5="10008D39";
const QString app6="10005902";
const QString camapp="101F857A";
#endif // CONST_H
