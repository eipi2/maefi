import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

Page {
    id: mainPage
    tools: commonTools

    ButtonRow{
        id: serverButtons
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 75
        }

        Button {
            id: button1
            style: NegativeButtonStyle {}
            text: "Stop"
            onClicked: {
                button1.enabled=false;
                button2.enabled=true;
                scriptLauncher.stopScript()
                label.text=scriptLauncher.serverStatus()
            }
         }


        Button {
            id: button2
            style: PositiveButtonStyle {}
            text: "Start"
            onClicked: {
                button2.enabled=false;
                button1.enabled=true;
                scriptLauncher.launchScript()
                label.text=scriptLauncher.serverStatus()
                config.changeJey();
            }

        }

    }


    Label {
        id: label
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: serverButtons.top
            bottomMargin:10
        }
        text: "Server Stopped"
    }

    Button{
        id: button3
        anchors {
            top: serverButtons.bottom
            topMargin: 90
            horizontalCenter: parent.horizontalCenter
        }
        text: qsTr("Wi-Fi Hotspot")
        iconSource: "/opt/joikuspot/share/icons/hotspot.svg";
        onClicked: scriptLauncher.launchHotspot()

    }

    Button{
        id: button4
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: button3.bottom
            topMargin: 90
        }
        text: qsTr("Photo Gallery")
        iconSource: "image://theme/icon-l-gallery";
        onClicked: scriptLauncher.launchGallery()

    }

}
