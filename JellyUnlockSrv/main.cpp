#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "qmlapplicationviewer.h"
#include "Application.h"
#include <QDeclarativeContext>

#include <QtDebug>
#include <QFile>
#include <QTextStream>
#ifdef Q_OS_SYMBIAN
#include <e32debug.h>
#endif
#include <suspender.h>
#include <proxy.h>
#include <aknappui.h>
#include <eikenv.h>
#include <QTime>
#include <iconprovider.h>
#include <QDeclarativeEngine>
#include <skinbgprovider.h>
void myMessageHandler(QtMsgType type, const char *msg)
{
        QString txt;
        QTime t=QTime::currentTime();
        QString st=t.toString("hh:mm:ss");
        switch (type) {
        case QtDebugMsg:
                txt = QString(" %1").arg(msg);
                break;
        case QtWarningMsg:
                txt = QString(" Warning: %1").arg(msg);
        break;
        case QtCriticalMsg:
                txt = QString(" Critical: %1").arg(msg);
        break;
        case QtFatalMsg:
                txt = QString(" Fatal: %1").arg(msg);
                abort();
        }
        txt=st+txt;
        QFile outFile("C:\\System\\Apps\\JellyUnlock\\jellyunlocksrv.txt");
        outFile.open(QIODevice::WriteOnly | QIODevice::Append);
        QTextStream ts(&outFile);
        ts << txt << endl;
#ifdef Q_OS_SYMBIAN
        TPtrC des (reinterpret_cast<const TText*>(txt.constData()),txt.length());
        RDebug::Print(des);
#endif
}

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());
    QFile file("C:\\System\\Apps\\JellyUnlock\\jellyunlocksrv.txt");
    if (file.exists()){file.remove();}
    qInstallMsgHandler(myMessageHandler);

    Application* myapp=new Application(*viewer.data());
    qDebug()<<"app obj created";
    Proxy* proxy=new Proxy(myapp);
    proxy->moveToThread(myapp);

    Suspender* susp=new Suspender(proxy);
    qDebug()<<"Main thread:"<<RThread().Id().Id();
    QObject::connect(myapp,SIGNAL(setQMLFile(Application*)),susp,SLOT(setupQML(Application*)));
    QObject::connect(myapp,SIGNAL(Suspend(int)),susp,SLOT(Suspend(int)));
    QObject::connect(myapp,SIGNAL(unSuspend()),susp,SLOT(unSuspend()));
    QObject::connect(susp,SIGNAL(sendId(int)),myapp,SLOT(setThrID(int)));
    QObject::connect(app.data(),SIGNAL(aboutToQuit()),myapp,SLOT(deleteLater()));


    QObject::connect(proxy,SIGNAL(sigHide()),myapp,SLOT(Unlock()),Qt::QueuedConnection);
    QObject::connect(proxy,SIGNAL(sigRestartTimer()),myapp,SLOT(restartTimer()),Qt::QueuedConnection);
    QObject::connect(proxy,SIGNAL(sigMovingChanged(bool)),myapp,SLOT(MovingChanged(bool)),Qt::QueuedConnection);
    //QObject::connect(myapp,SIGNAL(changeSize()),proxy,SLOT(screenChanged()),Qt::QueuedConnection);
    viewer->rootContext()->setContextProperty("proxy",proxy);

    viewer->setStyleSheet("background:transparent;");
    viewer->setAttribute(Qt::WA_TranslucentBackground);
    viewer->viewport()->setAutoFillBackground(false);
    viewer->rootContext()->setContextProperty("lang",User::Language());
    viewer->engine()->addImageProvider(QLatin1String("icons"), new IconProvider);
    viewer->engine()->addImageProvider(QLatin1String("skin"), new SkinBgProvider);
    /*
    RWindow *rWindow = static_cast<RWindow*>(viewer->winId()->DrawableWindow());
    TInt alpha;
    alpha=0;
    TRgb backgroundColour = KRgbWhite; // for example
    if(KErrNone == rWindow->SetTransparencyAlphaChannel()){backgroundColour.SetAlpha(alpha);qDebug()<<"transp supported";}
    else {qDebug()<<"transp not supported";}
    rWindow->SetBackgroundColor(backgroundColour);
    rWindow->SetExtent(TPoint(0,0),TSize(100,100));
    */

/*
    viewer->rootContext()->setContextProperty("application",obj);
    viewer->rootContext()->setContextProperty("strings",lst);
    viewer->rootContext()->setContextProperty("player",obj);
    viewer->rootContext()->setContextProperty("notify",obj);

    viewer->setMainQmlFile(QLatin1String("qml/SwipeUnlockSrv/main.qml"));
    viewer->showExpanded();

   */
    qDebug()<<"int main end";
    return app->exec();
}
