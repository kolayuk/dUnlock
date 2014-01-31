#ifndef NOTIFYPROVIDER_H
#define NOTIFYPROVIDER_H

#include <QObject>
#include <logmonitor.h>
#include <SMSReciever.h>
#include <QDateTime>
#include <CenRepObserver.h>
#include <qcontactfetchrequest.h>
#include <QSettings>
#include <const.h>
QTM_USE_NAMESPACE

const TUid KSMSNotifUid={0x101F87A8};
const TUint32 KSMSNotifKey=0x6;
const TUid KCallsNotifUid={0x101F874E};
const TUint32 KCallsNotifKey=0x6;

enum TNotifType{
    ESMS=2,
    EEmail=4,
    EMissedCall=5,
    ETwitter=1
};

struct TNotifyInfo
{
    QString sender;
    QString text;
    QString time;
    QDateTime timeStamp;
    TNotifType type;
    TInt32 id;
};

class NotifyProvider : public QObject,public MLogMonitor, public MSMSRecCallBack, public MCRCallBack
{
    Q_OBJECT
private:
    CCenRepObserver* iCallCounter;
    CCenRepObserver* iSMSCounter;
    CLogMonitor* iLogs;
    CSMSReceiver* iSMS;
    QList<TNotifyInfo> iNotifiers;
    void prepareNotifier(TNotifType type);
    void clearNotifiers(TNotifType type);
    QString findContact(QString number);
    QContactManager* contacts;
    int iSMSCount;
    int iCallsCount;
public:
    explicit NotifyProvider(QObject *parent = 0);
    void ValueChanged(TUid uid, TUint32 key, TInt aValue, TInt aErr);
    void LogEventL(const CLogEvent& event);
    void GotSMSMessageL(QString aMessage,const TPtrC aSender,TInt32 id);
    void MarkSMSRead(TInt32 aId);
     void TextValueChanged(TUid uid,TUint32 key,TPtrC aVal,TInt aErr);
signals:
    void addNotifier(QString from,QString text,QString time, QString icon,int type);
    void removeNotifier(int index);
    void Unlock();
    void updateCallCount(int count);
    void updateSMSCount(int count);
public slots:
    void openViewer(int index);
};

#endif // NOTIFYPROVIDER_H
