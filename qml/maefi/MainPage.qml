/**********************************************************************
 * Copyright 2013 Sanjeev Visvanatha
 *
 * This file is part of Mae-Fi.
 *
 * Mae-Fi is a Simple Eye-Fi Application for Nokia's MeeGo Harmattan
 *
 * Mae-Fi makes use of the eyefiserver python script created by
 * Jeff Tchang (http://code.google.com/p/eyefiserver/).
 *
 * Mae-Fi is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * Mae-Fi is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Mae-Fi.  If not, see <http://www.gnu.org/licenses/>
 *
 ***********************************************************************/
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
