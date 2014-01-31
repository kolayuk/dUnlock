import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
//import QtQuick 1.1

Item {
    anchors.fill: parent
    id:m
    property int handleSize: 65
    signal hideLaunch;
    property int margin:0;
    MouseArea{
        anchors.fill: parent;
        onClicked: hideLaunch();
    }
    Image {
        id: app5
        source: "image://icons/"+apps[5]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:Math.round((m.height/2)-(m.height/2)*Math.sin((Math.PI/180.0)*45))-height/2
        x:Math.round((m.width/2)+(m.width/2)*Math.cos((Math.PI/180.0)*45))-width/2
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[5]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app4
        source: "image://icons/"+apps[4]
        width: m.handleSize
        height: m.handleSize
        visible:true
        anchors.verticalCenter: m.verticalCenter
        anchors.horizontalCenter: m.right
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[4]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app3
        source: "image://icons/"+apps[3]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:Math.round((m.height/2)-(m.height/2)*Math.sin((Math.PI/180.0)*-45))-height/2
        x:Math.round((m.width/2)+(m.width/2)*Math.cos((Math.PI/180.0)*45))-width/2
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[3]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app2
        source: "image://icons/"+apps[2]
        width: m.handleSize
        visible:true
        height: m.handleSize
        y:Math.round((m.height/2)-(m.height/2)*Math.sin((Math.PI/180.0)*-45))-height/2
        x:Math.round((m.height/2)-(m.width/2)*Math.cos((Math.PI/180.0)*-45))-width/2
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[2]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app1
        source: "image://icons/"+apps[1]
        width: m.handleSize
        height: m.handleSize
        visible:true
        anchors.verticalCenter: m.verticalCenter
        anchors.horizontalCenter: m.left
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[1]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }

    }
    Image {
        id: app0
        source: "image://icons/"+apps[0]
        width: m.handleSize
        visible:true
        height: m.handleSize
        y:Math.round((m.height/2)-(m.height/2)*Math.sin((Math.PI/180.0)*45))-height/2
        x:Math.round((m.height/2)-(m.width/2)*Math.cos((Math.PI/180.0)*-45))-width/2
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[0]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }

}
