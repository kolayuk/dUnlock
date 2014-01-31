import QtQuick 1.0
Rectangle {
    id:root;
    property int smth:0
    color:"black"
    height: 24;
    signal changeOperator(string opsos);
    signal changeCharging(int charge, int percent);
    property int rightSide:clockex.paintedWidth
    Text {
        visible:false;
        id: clockex
        text: cl.hours
        font.pixelSize: 18;
    }
     Connections{
     target: application;
    onUpdateStatusBar:{
        var bat=(Math.floor(battery/10));
        switch (bat){
            case 0: imgbattery.source="status-icons/icon-s-status-battery-verylow.png";break;
            case 1: imgbattery.source="status-icons/icon-s-status-battery-low.png";break;
            case 2: imgbattery.source="status-icons/icon-s-status-battery1.png";break;
            case 3: imgbattery.source="status-icons/icon-s-status-battery2.png";break;
            case 4: imgbattery.source="status-icons/icon-s-status-battery3.png";break;
            case 5: imgbattery.source="status-icons/icon-s-status-battery3.png";break;
            case 6: imgbattery.source="status-icons/icon-s-status-battery4.png";break;
            case 7: imgbattery.source="status-icons/icon-s-status-battery5.png";break;
            case 8: imgbattery.source="status-icons/icon-s-status-battery5.png";break;
            case 9: imgbattery.source="status-icons/icon-s-status-battery8.png";break;
            case 10: imgbattery.source="status-icons/icon-s-status-battery8.png";break;
        }
        changeCharging(charging,battery);
        if (charging){imgbattery.source="status-icons/icon-s-status-charger.png";}
        var sig=Math.floor(network_signal/15);
        switch (sig){
            case 0:imgsignal.source="status-icons/icon-s-status-no-gsm-connection.png";break;
            case 1:imgsignal.source="status-icons/icon-s-status-network2.png";break;
            case 2:imgsignal.source="status-icons/icon-s-status-network2.png";break;
            case 3:imgsignal.source="status-icons/icon-s-status-network3.png";break;
            case 4:imgsignal.source="status-icons/icon-s-status-network3.png";break;
            case 5:imgsignal.source="status-icons/icon-s-status-network4.png";break;
            case 6:imgsignal.source="status-icons/icon-s-status-network5.png";break;
        }
        switch (mode){
            case 0: imggsm.source="status-icons/icon-s-status-gsm-active.png";break;
            case 1: imggsm.source="status-icons/icon-s-status-3g-active.png";break;
        }
        if (mode==2) imgwlan.source="status-icons/icon-s-status-wlan.png";
        else imgwlan.source="";
        switch (profile){
            case 1: imgprofile.source="status-icons/icon-s-status-silent.png";break;
            case 5: imgprofile.source="status-icons/icon-s-status-offline.png";break;
            default: imgprofile.source="";break;
        }
        if (bt){imgbt.source="status-icons/icon-s-status-bluetooth.png";}
        else {imgbt.source="";}
        changeOperator(opsos);
    }
    }
    Row{
        spacing:5
        anchors.rightMargin: 0;
        anchors.right: root.right

        Image{
            id:imgbt
            source:""
        }
        Image{
            id:imgprofile
            source:""
        }
        Image {
            id: imgwlan
            source: ""
        }
        Image{
            id:imgsignal;
            source: ""
            Image {
                id: imggsm
                source: ""
                anchors.fill: imgsignal
            }
        }
        Image{
            id:imgbattery;
            source: "";
        }
        SmallClock{
            id: cl;
            showDate: false
            showSeconds: false
            fontSize: 18;
            width: clockex.paintedWidth;
            textColor: "#3791b3"
        }
    }
}
