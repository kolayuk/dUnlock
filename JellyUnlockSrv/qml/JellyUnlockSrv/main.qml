import QtQuick 1.0

Rectangle {
    id:root;
    width: 360
    height: 640
    color: "transparent"
    property int smsCount:0;
    property int callsCount:0;
    property int coverDisplay: 0;

    Connections{
        target:application
        onSetToZero:{
            handle.x=handle.centerX;
            handle.y=handle.centerY;
            handle.source="handle_normal.png";
            handle.visible=true;
            mainContainer.opacity=1;
            launchContainer.opacity=0;

        }
        onUpdateWallpaper:{
            console.log("set wallpaper "+wallpaper)
            if (wallpaper.length<9){errtxt.visible=true; errcolor.color="black"; console.log("image error"); errtxt.text=strings[48];}
            else
            {
               if (!coverDisplay) wp.source=wallpaper;
               errtxt.visible=false;
               errcolor.color="transparent";
               console.log("no err in wallpaper");
            }
        }
        onChangeSize:{
            root.width=w;
            root.height=h;
            if (h>w){ // portrait
                clock.anchors.right=clock.parent.right;
                clock.anchors.left=undefined;
                playerwidget.anchors.right=playerwidget.parent.right;
                playerwidget.anchors.left=playerwidget.parent.left;
                playerwidget.anchors.leftMargin=10
                playerwidget.anchors.rightMargin=10
                m.anchors.verticalCenter=undefined;
                m.anchors.top=undefined;
                m.anchors.left=root.left
                m.anchors.leftMargin=camera.width/2+5;
                m.anchors.right=root.right
                m.anchors.rightMargin=unlock.width/2+5;
                m.anchors.bottom=root.bottom;
                m.anchors.horizontalCenter=root.horizontalCenter;
                m.anchors.bottomMargin=35;
                m.height=m.width;
                handle.x=handle.centerX;
                handle.y=handle.centerY;
                handle.source="handle_normal.png";
                handle.visible=true;
                mainContainer.opacity=1;
                launchContainer.opacity=0;
            }
            else{ //landscape
                clock.anchors.left=clock.parent.left;
                clock.anchors.right=clock.parent.horizontalCenter;
                playerwidget.anchors.right=clock.right;
                playerwidget.anchors.left=playerwidget.parent.left;
                playerwidget.anchors.leftMargin=10
                playerwidget.anchors.rightMargin=10
                m.anchors.bottom=undefined;
                m.anchors.horizontalCenter=undefined;
                m.anchors.left=clock.right
                m.anchors.leftMargin=camera.width/2-5;
                m.anchors.right=root.right
                m.anchors.rightMargin=35
                m.anchors.verticalCenter=root.verticalCenter
                m.anchors.verticalCenterOffset=camera.width/2-5;
                m.width=m.height;
                //m.anchors.top=root.top;
                //m.anchors.topMargin=camera.width+5;
                m.anchors.bottomMargin=undefined;
                //m.anchors.Margin:35;
                handle.x=handle.centerX;
                handle.y=handle.centerY;
                handle.source="handle_normal.png";
                handle.visible=true;
                mainContainer.opacity=1;
                launchContainer.opacity=0;
            }
        }

    }
    Connections{
        target: notify
        onUpdateCallCount:{
            root.callsCount=count;
        }
        onUpdateSMSCount:{
            root.smsCount=count;
        }
    }

    Connections{
         target: player;
         onPlayerStarted:{
             playerwidget.visible=true;
             if (!pl)
             {
                 coverDisplay=0;
                 wp.source=wallpaper;
                 playerblack.visible=false;
                 wp.fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
             }
         }
         onPlayerClosed:{
             playerwidget.visible=false;
             wp.source=wallpaper;
             playerblack.visible=false;
             coverDisplay=0;
         }
         onUpdateAlbumArt:{
             console.log("update cover");
             if (show&&settings[3]==1) {
                 wp.source="image://album/"+Math.random(10);
                 playerblack.visible=true;
                 //wp.fillMode=Image.PreserveAspectCrop;
                 wp.fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
                 coverDisplay=1;
             }
             else {
                 wp.source=wallpaper;
                 playerblack.visible=false;
                 wp.fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
                 coverDisplay=0;
             }
         }
         }

    function collision(a, b) {
        var c = Math.abs((a.x+a.width/2) - (b.x+b.width/2)),
            d =Math.abs((a.y+a.height/2) - (b.y+b.height/2)),
            e =Math.max(a.height,a.width)/2 + Math.max(b.height,b.width)/2;
        return Math.sqrt(c * c + d * d) <= e*(1-0.7)&&a.visible&&b.visible
    }

    Rectangle{
        anchors.fill: parent
        id: errcolor;
        color:"transparent"
        Text {
            id: errtxt
            visible: false
            text: strings[48]
            font.pixelSize: 20;
            width: parent.width
            wrapMode: Text.WordWrap;
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            color:"white"
        }
    }

    Image {
        id:wp;
        asynchronous: true;
        anchors.fill: parent
        clip:true
        sourceSize.height: root.height==640?root.height:0//640;
        sourceSize.width: root.height==640?0:root.width//360;
        Component.onCompleted: {
            fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
            source=wallpaper;
            console.log("image ready");
        }
        onStatusChanged: {
        console.log("image status"+wp.status);
        if (wp.status==Image.Ready) console.log("image ready");
        if (wp.status==Image.Error||wp.status==Image.Null) {errtxt.visible=true; errcolor.color="black"; console.log("image error");}
        else {errtxt.visible=false; errcolor.color="transparent"; console.log("no err in image");}
        }
    }
    Rectangle{
        id:playerblack
        opacity: 0.7
        visible: false
        anchors.fill: parent;
        color:"black"
    }
    FontLoader { id: opFont; source: "DroidSans.ttf" }
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        id: operator
        text: ""
        color:"white"
        font { family: settings[6]==0?opFont.name:proxy.GetFont(); bold: false; pixelSize: 17; italic: false;}

    }
    DigitalClock{
        id:clock
        fontSize:75
        showDate:true
        anchors.right: parent.right
        anchors.rightMargin:40
        anchors.top: sb.bottom;
        anchors.topMargin: 40;
    }
    Player{
        id:playerwidget
        anchors.right: parent.right
        anchors.rightMargin:10
        anchors.left: parent.left
        anchors.leftMargin:10
        anchors.top: clock.bottom;
        anchors.topMargin: 0;
    }


    MouseArea{
        id:m
        anchors.left: root.left
        anchors.leftMargin: camera.width/2+5;
        anchors.right: root.right
        anchors.rightMargin: unlock.width/2+5;
        anchors.bottom: root.bottom;
        anchors.bottomMargin:35;
        //width:  250;
        height: width;
        ParallelAnimation{
            id: toCenter;
            NumberAnimation {target: handle; property: "x"; to: handle.centerX; duration: 200; easing.type: Easing.OutQuad }
            NumberAnimation {target: handle; property: "y"; to: handle.centerY; duration: 200;easing.type: Easing.OutQuad }
        }
        ParallelAnimation{
            id: showLaunch;
            NumberAnimation {target: mainContainer; property: "opacity"; to: 0; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: launchContainer; property: "opacity"; to: 1; duration: 500;easing.type: Easing.OutQuad }
        }
        ParallelAnimation{
            id: hideLaunch;
            NumberAnimation {target: mainContainer; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: launchContainer; property: "opacity"; to: 0; duration: 500;easing.type: Easing.OutQuad }
        }
        anchors.horizontalCenter: parent.horizontalCenter
        drag.target: handle
        drag.axis: Drag.XandYAxis;
        drag.onActiveChanged: {
            if (!drag.active) toCenter.start();

        }
        onPressedChanged: {
            if (pressed)  handle.source="handle_pressed.png";
            else handle.source="handle_normal.png";
            proxy.MovingChanged(pressed);
            if (!pressed){
                if (collision(handle,camera)) {application.Hide(); application.Launch(settings[4]);}
                if (collision(handle,unlock)) application.Hide();
                if (collision(handle,sms)) notify.openViewer(-2);
                if (collision(handle,calls)) notify.openViewer(-1);
                if (collision(handle,launch)) {showLaunch.start(); handle.visible=false;}
            }
        }

        Image {
            id: round
            source: "big_circle.svg"
            anchors.fill: m;
            visible: launchContainer.visible?true:m.pressed;
        }
        LaunchArea{
            id:launchContainer;
            anchors.fill: m;
            visible: opacity!=0;
            opacity: 0;
            //handleSize: handle.width
            onHideLaunch: {
                handle.source="handle_normal.png";
                handle.visible=true;
                handle.x=handle.centerX;
                handle.y=handle.centerY;
                hideLaunch.start();
                console.log("hide launch");
            }
        }

        Item{
            visible: opacity!=0;
            opacity: 1;
            id: mainContainer;
            anchors.fill: m
            Image {
                id: unlock
                source: "unlock_normal.png"
                width: handle.width
                height: handle.height
                visible:m.pressed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.right
            }

            Image {
                id: sms
                source: "sms_normal.png"
                width: handle.width
                height: handle.height
                visible: root.smsCount!=0
                y:Math.round((m.height/2)-(m.height/2)*Math.sin((Math.PI/180.0)*45))-height/2
                x:Math.round((m.width/2)+(m.width/2)*Math.cos((Math.PI/180.0)*45))-width/2
            }
            Text{
                id: sms_txt;
                text:root.smsCount;
                visible: sms.visible
                font.pixelSize: 30
                color:"white"
                y:sms.y-font.pixelSize/2+5
                x:sms.x+sms.width-width
            }
            Image {
                id: calls
                source: "call_normal.png"
                width: handle.width
                visible:root.callsCount!=0;
                height: handle.height
                y:Math.round((m.height/2)-(m.height/2)*Math.sin((Math.PI/180.0)*45))-height/2
                x:Math.round((m.height/2)-(m.width/2)*Math.cos((Math.PI/180.0)*-45))-width/2
            }
            Text{
                id: calls_txt;
                color:"white"
                text:root.callsCount;
                visible: calls.visible
                font.pixelSize: 30
                y:calls.y-font.pixelSize/2+5
                x:calls.x-width/2
            }

            Image {
                id: camera
                source: "camera_normal.png"
                width: handle.width
                height: handle.height
                visible:m.pressed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.left

            }
            Image {
                id: launch
                source: "launch_normal.png"
                width: handle.width
                height: handle.height
                visible:m.pressed
                anchors.verticalCenter: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Image{
            id: handle
            source:"handle_normal.png"
            width:85
            height:85;
            property int centerX: parent.width/2-width/2;
            property int centerY: parent.height/2-height/2;
            x: parent.width/2-width/2;
            y: parent.height/2-height/2;
            onXChanged: handleMove(x,y);
            onYChanged: handleMove(x,y);
            function handleMove(x,y){
                if (collision(handle,unlock))
                    unlock.source="unlock_activated.png";
                else unlock.source="unlock_normal.png";
                if (collision(handle,camera))
                    camera.source="camera_activated.png";
                else camera.source="camera_normal.png";
                if (collision(handle,sms))
                    sms.source="sms_activated.png";
                else sms.source="sms_normal.png";
                if (collision(handle,calls))
                    calls.source="call_activated.png";
                else calls.source="call_normal.png";
                if (collision(handle,launch))
                    launch.source="launch_activated.png";
                else launch.source="launch_normal.png";
            }
            Component.onCompleted: {

            }
        }
    }
    StatusBar{
        id: sb;
        anchors.left: root.left
        anchors.right: root.right
        anchors.top: root.top
        onChangeOperator: operator.text=opsos;
        onChangeCharging: {clock.changeCharging(charge,percent);}
    }
}
