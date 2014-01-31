#include "notifyprovider.h"
#include <tz.h>
#include <qcontactdetailfilter.h>
#include <qcontactphonenumber.h>
#include <qcontactname.h>
#include <qDebug>
#include "LogsUiCmdStarter.h"
#include <centralrepository.h>
#include <eikenv.h>
#include <w32std.h>
#include <aknappui.h>
#include <apgcli.h>
#include <const.h>

NotifyProvider::NotifyProvider(QObject *parent) :
    QObject(parent)
{
    iSMSCount=0;
    iCallsCount=0;
    iLogs=CLogMonitor::NewL(this);
    iSMS=CSMSReceiver::NewL(*this);
    iCallCounter=CCenRepObserver::NewL(KCallsNotifUid,KCallsNotifKey,*this);
    iCallCounter->StartObservingL();
    iSMSCounter=CCenRepObserver::NewL(KSMSNotifUid,KSMSNotifKey,*this);
    iSMSCounter->StartObservingL();
    contacts= new QContactManager(this);
}

void NotifyProvider::LogEventL(const CLogEvent &event)
{
    // store new call
    QString number=QString::fromRawData(reinterpret_cast<const QChar*>(event.Number().Ptr()),event.Number().Length());
    QString direction=QString::fromRawData(reinterpret_cast<const QChar*>(event.Direction().Ptr()),event.Direction().Length());
    QString description=QString::fromRawData(reinterpret_cast<const QChar*>(event.Description().Ptr()),event.Description().Length());
    if (description.contains("Voice call")&&direction.contains("Missed call"))
    {
        TTime times=event.Time();
        RTz tzsession;
        tzsession.Connect();
        tzsession.ConvertToLocalTime(times);
        tzsession.Close();
        TDateTime dts=times.DateTime();
        QDate d; QTime t;
        d.setYMD(dts.Year(),dts.Month()+1,dts.Day()+1);
        t.setHMS(dts.Hour(),dts.Minute(),dts.Second());
        QDateTime dt; dt.setDate(d); dt.setTime(t);
        dt=dt.toLocalTime();
        QString time=dt.toString("d.M.yy hh:mm");

        TNotifyInfo info;
        info.time=time;
        info.timeStamp=dt;
        info.sender=number;
        info.text=findContact(number);
        info.id=-1;
        info.type=EMissedCall;
        iNotifiers.insert(0,info);
        qDebug()<<"store call from"<<info.sender;
        prepareNotifier(EMissedCall);
    }
}

void NotifyProvider::GotSMSMessageL(QString txt, const TPtrC aSender,TInt32 id)
{
    // new sms
    QString number=QString::fromRawData(reinterpret_cast<const QChar*>(aSender.Ptr()),aSender.Length());
    //QString txt=QString::fromRawData(reinterpret_cast<const QChar*>(aMessage.Ptr()),aMessage.Length());;
    QDateTime dt=QDateTime::currentDateTime();
    dt=dt.toLocalTime();
    TNotifyInfo info;
    info.time=dt.toString("dd.M.yy hh:ss");
    info.timeStamp=dt;
    info.sender=findContact(number);
    info.text=txt;
    info.type=ESMS;
    info.id=id;
    iNotifiers.insert(0,info);
    qDebug()<<"store sms from"<<info.sender<<info.text;
    qDebug()<<"id"<<id;
    prepareNotifier(ESMS);
}

void NotifyProvider::ValueChanged(TUid uid, TUint32 key, TInt aValue, TInt aErr)
{
    qDebug()<<"NotifyProvider::ValueChanged"<<aValue<<aErr;
    if (uid==KSMSNotifUid)
    {
        //new sms
        // prepare here and send signal from iNotifiers if current count is bigger than old
        iSMSCount=aValue;
        emit updateSMSCount(aValue);
        if (aValue==0)
        {
            clearNotifiers(ESMS);
        }
        qDebug()<<"sms count changed:"<<aValue;
    }
    if (uid==KCallsNotifUid)
    {
        //new call
        iCallsCount=aValue;
        emit updateCallCount(aValue);
        if (aValue==0)
        {
            clearNotifiers(EMissedCall);
        }
        qDebug()<<"calls count changed:"<<aValue;
    }
}

void NotifyProvider::prepareNotifier(TNotifType type)
{
    if (iNotifiers.count()<=0) return;
    TNotifyInfo info=iNotifiers[0];
    QString icon;
    if (info.type==ESMS) icon=QString("notify/sms.png");
    else if (info.type==EMissedCall) icon=QString("notify/call.png");
    qDebug()<<"prepareNotifier();"<<info.type<<info.time<<info.sender<<info.text;
    emit addNotifier(info.sender,info.text,info.time,icon,(int)info.type);
}

QString NotifyProvider::findContact(QString number)
{
        qDebug()<<"findContact";
        QContactDetailFilter f;
        f.setDetailDefinitionName(QContactPhoneNumber::DefinitionName,QContactPhoneNumber::FieldNumber);
        f.setValue(number);
        QList<QContact> list=contacts->contacts(f);
        if (list.length()>0)
        {
            QContactName name=list[0].detail<QContactName>();
            return name.lastName()+" "+name.firstName();
        }
        else
        {return number;}
}


void NotifyProvider::openViewer(int index)
{
    TNotifType type;
    if (index==-1) type=EMissedCall;
    else if (index==-2) type=ESMS;
    else if (index>=0) type=iNotifiers[index].type;
    qDebug()<<"openViewer, thread"<<RThread().Id().Id();
    emit Unlock();
    CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
    if (type==ESMS)
    {//open sms
        TInt conversationview = 0;
        CRepository* cr=CRepository::NewL(KCRUidMuiuSettings);
        cr->Get(KMuiuMceDefaultView,conversationview);
        delete cr;
        CCoeEnv::Static()->AppUi()->CreateActivateViewEventL(KMessagingCentreView, TUid::Uid( KMsvGlobalInBoxIndexEntryIdValue),KNullDesC8 );

        //iSMS->openSMS(iNotifiers[index].id);
        //if (conversationview == 1 )
        //   {CCoeEnv::Static()->AppUi()->CreateActivateViewEventL(KConversationView, TUid::Uid( KConversationListViewid ),KNullDesC8 );}
        //else
        //   {CCoeEnv::Static()->AppUi()->CreateActivateViewEventL(KMessagingCentreView, TUid::Uid( KMsvGlobalInBoxIndexEntryIdValue ),KNullDesC8 );}
    }
    else if (type==EEmail)
    {
    RApaLsSession session;
    session.Connect();
    CApaCommandLine* cmdLine = CApaCommandLine::NewLC();
    cmdLine->SetExecutableNameL(_L("FreestyleEmailUi.exe"));
    cmdLine->SetCommandL(EApaCommandRun);
    User::LeaveIfError( session.StartApp(*cmdLine) );
    CleanupStack::PopAndDestroy(cmdLine);
    session.Close();
    }
    else if (type==EMissedCall)
    {//open calls
        LogsUiCmdStarter::CmdStartL( LogsUiCmdStarterConsts::KMissedView() );
    }
}

void NotifyProvider::MarkSMSRead(TInt32 aId)
{
    qDebug()<<(int)aId<<"was read";
    for (int i=0;i<iNotifiers.count();i++)
    {
        if (iNotifiers[i].type==ESMS&&iNotifiers[i].id==aId)
        {
            removeNotifier(i);
            iNotifiers.removeAt(i);
            i--;
        }
    }
}

void NotifyProvider::TextValueChanged(TUid uid, TUint32 key, TPtrC aVal, TInt aErr)
{
}

void NotifyProvider::clearNotifiers(TNotifType type)
{
    for (int i=0;i<iNotifiers.count();i++)
    {
        if (iNotifiers[i].type==type)
        {
            removeNotifier(i);
            iNotifiers.removeAt(i);
            i--;
        }
    }
}

