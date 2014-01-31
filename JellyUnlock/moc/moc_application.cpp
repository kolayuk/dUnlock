/****************************************************************************
** Meta object code from reading C++ file 'application.h'
**
** Created: Fri 21. Dec 16:08:18 2012
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../application.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'application.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Application[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
      30,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      18,       // signalCount

 // signals: signature, parameters, type, tag, flags
      22,   13,   12,   12, 0x05,
      42,   13,   12,   12, 0x05,
      71,   64,   12,   12, 0x05,
      95,   13,   12,   12, 0x05,
     119,   13,   12,   12, 0x05,
     136,   13,   12,   12, 0x05,
     156,   13,   12,   12, 0x05,
     185,  181,   12,   12, 0x05,
     206,  181,   12,   12, 0x05,
     227,  181,   12,   12, 0x05,
     248,  181,   12,   12, 0x05,
     269,  181,   12,   12, 0x05,
     290,  181,   12,   12, 0x05,
     311,  181,   12,   12, 0x05,
     337,   13,   12,   12, 0x05,
     363,   13,   12,   12, 0x05,
     389,   13,   12,   12, 0x05,
     413,   12,   12,   12, 0x05,

 // slots: signature, parameters, type, tag, flags
     447,  440,   12,   12, 0x0a,
     465,   12,   12,   12, 0x0a,
     495,  490,   12,   12, 0x0a,
     523,   12,  519,   12, 0x0a,
     547,  490,  519,   12, 0x0a,
     577,   12,   12,   12, 0x0a,

 // methods: signature, parameters, type, tag, flags
     599,  590,   12,   12, 0x02,
     631,   12,   12,   12, 0x02,
     641,   12,   12,   12, 0x02,
     654,  648,  519,   12, 0x02,
     672,   12,  519,   12, 0x02,
     694,  682,   12,   12, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Application[] = {
    "Application\0\0newstate\0appWorkChanged(int)\0"
    "autostartChanged(int)\0newpic\0"
    "pictureChanged(QString)\0playerAlbumChanged(int)\0"
    "zoomChanged(int)\0hideSMSChanged(int)\0"
    "useWallpaperChanged(int)\0app\0"
    "app1Changed(QString)\0app2Changed(QString)\0"
    "app3Changed(QString)\0app4Changed(QString)\0"
    "app5Changed(QString)\0app6Changed(QString)\0"
    "cameraAppChanged(QString)\0"
    "useSystemFontChanged(int)\0"
    "notificationsChanged(int)\0"
    "orientationChanged(int)\0"
    "showAppPanelNotification()\0filter\0"
    "SortApps(QString)\0KillAnotherLockScreens()\0"
    "name\0KillLockScreen(QString)\0int\0"
    "GetAnotherLockscreens()\0"
    "isLockScreenLaunched(QString)\0"
    "HideSplash()\0id,value\0"
    "ChangeSetting(QString,QVariant)\0"
    "EditPic()\0Exit()\0index\0isKeyChecked(int)\0"
    "keysLen()\0key,checked\0checkKey(int,bool)\0"
};

const QMetaObject Application::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Application,
      qt_meta_data_Application, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Application::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Application::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Application::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Application))
        return static_cast<void*>(const_cast< Application*>(this));
    return QObject::qt_metacast(_clname);
}

int Application::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: appWorkChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: autostartChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: pictureChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: playerAlbumChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: zoomChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: hideSMSChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: useWallpaperChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: app1Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: app2Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 9: app3Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 10: app4Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: app5Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 12: app6Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 13: cameraAppChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 14: useSystemFontChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 15: notificationsChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 16: orientationChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 17: showAppPanelNotification(); break;
        case 18: SortApps((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 19: KillAnotherLockScreens(); break;
        case 20: KillLockScreen((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 21: { int _r = GetAnotherLockscreens();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 22: { int _r = isLockScreenLaunched((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 23: HideSplash(); break;
        case 24: ChangeSetting((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QVariant(*)>(_a[2]))); break;
        case 25: EditPic(); break;
        case 26: Exit(); break;
        case 27: { int _r = isKeyChecked((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 28: { int _r = keysLen();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 29: checkKey((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        default: ;
        }
        _id -= 30;
    }
    return _id;
}

// SIGNAL 0
void Application::appWorkChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Application::autostartChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void Application::pictureChanged(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void Application::playerAlbumChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void Application::zoomChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void Application::hideSMSChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void Application::useWallpaperChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void Application::app1Changed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}

// SIGNAL 8
void Application::app2Changed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 8, _a);
}

// SIGNAL 9
void Application::app3Changed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 9, _a);
}

// SIGNAL 10
void Application::app4Changed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 10, _a);
}

// SIGNAL 11
void Application::app5Changed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 11, _a);
}

// SIGNAL 12
void Application::app6Changed(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 12, _a);
}

// SIGNAL 13
void Application::cameraAppChanged(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 13, _a);
}

// SIGNAL 14
void Application::useSystemFontChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 14, _a);
}

// SIGNAL 15
void Application::notificationsChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 15, _a);
}

// SIGNAL 16
void Application::orientationChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 16, _a);
}

// SIGNAL 17
void Application::showAppPanelNotification()
{
    QMetaObject::activate(this, &staticMetaObject, 17, 0);
}
QT_END_MOC_NAMESPACE
