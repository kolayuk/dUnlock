import QtQuick 1.0

Rectangle {
    color:"transparent"
    id:root;
    visible: false
    Component.onCompleted: {player.CheckPlayerState();}
    Connections{
    target:player;
    signal restart;
    onWidthChanged:{
        if (songtxt.paintedWidth>root.width)
        {
            scrollLeft.to=(root.width-songtxt.paintedWidth);
            scrollLeft.duration=200*(root.width-songtxt.paintedWidth);
            scrollRight.duration=200*(root.width-songtxt.paintedWidth);
            songtxt.horizontalAlignment=Text.AlignLeft;
            scrolling.start();
        }
        else {scrolling.stop(); songtxt.horizontalAlignment=Text.AlignHCenter;}

    }

    onPlayerStarted:{
        root.visible=true;
        progress.anchors.rightMargin=maxlen.width;
        if (pl) {play.visible=true; pause.visible=false;pause.icon="pause";proxy.GetState();}
        else {play.visible=false; pause.visible=true;pause.icon="stop";}
    }
    onPlayerClosed:{root.visible=true;playerwidget.visible=false;}
    onChangeTrackInfo:{var art=artist==""?strings[19]:artist;songtxt.text=song+" - "+art;}
    onPlaying:{pause.visible=true;play.visible=false;}
    onPaused:{pause.visible=false;play.visible=true;}
    onStopped:{pause.visible=false;play.visible=true;}
    onChangePos:{
        progress.anchors.rightMargin=maxlen.width-(val/len)*maxlen.width;
    }
    }
    SequentialAnimation{
        id:scrolling;
        loops: Animation.Infinite;
        alwaysRunToEnd: true;
        NumberAnimation {id: scrollLeft;target: songtxt; property: "anchors.leftMargin"; to: 0; duration: 5000; easing.type: Easing.Linear; }
        NumberAnimation {id: scrollRight;target: songtxt; property: "anchors.leftMargin"; to: 5; duration: 5000; easing.type: Easing.Linear; }
    }



    Column{
        anchors.right: root.right;
        anchors.left: root.left
        spacing: 10
        Row{
            anchors.centerIn: parent
                spacing:(root.width-3*play.width)/3;
                Button{
                    icon:"prev";
                    onPress:{proxy.Previous();}
                    onLongPress:{proxy.SeekBack();}
                    onRelease:{proxy.StopSeeking();}
                }
                Button{
                    visible:true;
                    id:play
                    icon:"play";
                    onPress:{proxy.Play();}
                    onLongPress:{player.ClosePlayer();}
                }
                Button{
                    visible:false;
                    id:pause
                    icon:"pause";
                    onPress:{proxy.Pause();}
                    onLongPress:{player.ClosePlayer();}
                }
                Button{
                    icon:"next";
                    onPress:{proxy.Next();}
                    onLongPress:{proxy.SeekForward();}
                    onRelease:{proxy.StopSeeking();}
                }
            }
        Rectangle{
            color:"transparent"
            height: 10;
            width: parent.width
        }
        Item{
            anchors.right: parent.right
            anchors.left: parent.left
            height: 4
            clip:false;
            Rectangle{
                id: maxlen
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.leftMargin: -10
                anchors.rightMargin: -10;
                height: 4
                visible:true
                opacity: 0.2
                color:"#00f0ff"
            }
            Rectangle{
                id: progress
                opacity: 0.5
                width: 0;
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.leftMargin: -10
                anchors.rightMargin: -10;
                height: 4
                visible:true
                color:"#006cff"
            }
            MouseArea{
                anchors.fill: maxlen;
                anchors.bottomMargin: -10;
                anchors.topMargin: -15;
                onClicked: {
                    var percent=(mouse.x/width)*100;
                    if (percent>100) percent=100;
                    proxy.SeekToPos(percent);
                }
            }
        }
            Text{
                id:songtxt
                clip:true
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                horizontalAlignment: Text.AlignHCenter
                color:"white";
                font.pixelSize: 20;
                text:""
                MouseArea{
                    id: m
                    anchors.fill: parent
                    onClicked: {application.Hide(); player.GoToNowPlaying();}
                    /*
                    onClicked: {
                        var percent=(mouse.x/width)*100;
                        if (percent>100) percent=100;
                        proxy.SeekToPos(percent);
                    }
                    */
                }
                onTextChanged: {
                    if (paintedWidth>root.width)
                    {
                        scrollLeft.to=(root.width-songtxt.paintedWidth);
                        scrollLeft.duration=200*(root.width-songtxt.paintedWidth);
                        scrollRight.duration=200*(root.width-songtxt.paintedWidth);
                        songtxt.horizontalAlignment=Text.AlignLeft;
                        scrolling.start();
                    }
                    else {scrolling.stop(); songtxt.horizontalAlignment=Text.AlignHCenter;}
                }
            }
          }
}
