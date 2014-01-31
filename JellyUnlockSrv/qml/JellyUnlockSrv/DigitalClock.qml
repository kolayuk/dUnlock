import Qt 4.7

Item {
    id: clock
    width : parent.width
    height : columnLayout.height
    property color textColor : "white"
    property int fontSize : 60
    property int fontSizeDate: 15
    property variant hours : "00:00"
    property variant minutes : "00"
    property variant seconds : ""

    property string date: ""
    property variant shift : 0
    property bool showSeconds : true
    property bool showDate : true
    property int customfont: 0;
    function changeCharging(charge, percent)
    {
        if (charge)
        {
            charging.visible=true;
            charging.text=strings[34]+", "+percent+"%";
            columnLayout.spacing=4;
            charging.height=charging.paintedHeight;
        }
        else
        {
            charging.visible=false;
            charging.text="";
            columnLayout.spacing=10;
            charging.height=0;
        }

    }

    function timeChanged() {
        // To be fixed to fit locale
        var Month = new Array(strings[7], strings[8], strings[9], strings[10],strings[11], strings[12],strings[13],strings[14], strings[15],strings[16], strings[17],strings[18]);
        var Days = new Array(strings[6],strings[0], strings[1], strings[2], strings[3],strings[4], strings[5],"gg");
        var d = new Date;
        timer.interval=calcSecsToMin()*1000;
        var h=application.getTime();
        clock.hours=h.toString().split(" ")[0];
        var t=h.toString().split(" ")[1];
        amText.text=t?t:" ";
        amText.font.pixelSize=t?clock.fontSize/4:1;
        date=lang!=16?application.GetDate():Days[d.getDay()]+", "+d.getDate() + " " + Month[d.getMonth()] + " " + d.getFullYear();
    }

    function checkTime(i) {
        return (i<10) ? "0"+i : i;
    }
    function calcSecsToMin(){
    var d = new Date;
    console.log(60-d.getSeconds())
    return 60-d.getSeconds();
    }

    Timer {
        id: timer;
        interval: calcSecsToMin()*1000; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    FontLoader { id: fixedFont; source: "AndroidClock.ttf" }
    FontLoader { id: dateFont; source: "DroidSans.ttf" }
    Column {
        anchors.right: clock.right
            id: columnLayout
            spacing: 10;
            Text {
                id: amText
                text: " "
                width: paintedWidth
                height: hoursText.paintedHeight-10;
                color: clock.textColor
                font {family: settings[6]==0?dateFont.name:proxy.GetFont(); bold: false; pixelSize: clock.fontSize/4; italic: false; capitalization: Font.SmallCaps }
                anchors.right: parent.right
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignBottom
                clip: false;
                Text {
                    id: hoursText
                    text: clock.hours
                    width: clock.width
                    color: clock.textColor
                    font { family: settings[6]==0?fixedFont.name:proxy.GetFont(); bold: true; pixelSize: clock.fontSize; italic: false; capitalization: Font.SmallCaps }
                    anchors.right: amText.left
                    anchors.rightMargin: 5;
                    horizontalAlignment: Text.AlignRight
                }
            }
            Text {
                id : dateText
                width: clock.width
                anchors.right: amText.right
                text: clock.date
                horizontalAlignment: Text.AlignRight
                color: clock.textColor
                //font.pixelSize: clock.fontSizeDate
                font { family: settings[6]==0?dateFont.name:proxy.GetFont(); bold: false; pixelSize: clock.fontSizeDate; italic: false;}
                visible : clock.showDate
                Component.onCompleted: {timeChanged();}
            }
            Text {
                id : charging
                width: clock.width
                anchors.right: amText.right
                text: ""
                horizontalAlignment: Text.AlignRight
                color: clock.textColor
                //font.pixelSize: clock.fontSizeDate
                font {family: settings[6]==0?dateFont.name:proxy.GetFont(); bold: false; pixelSize: clock.fontSizeDate; italic: false;}
                visible : false
            }
    }
}

/*
                font.bold: true;
                font.pixelSize: clock.fontSize;
                font.italic: false;
                font.capitalization: Font.SmallCaps
                font.family: settings[6]==0?fixedFont.name:proxy.GetFont();
 */
