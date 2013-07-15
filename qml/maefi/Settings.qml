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

    id: settings
    tools: navigationToolbar1

    ToolBarLayout {
        id: navigationToolbar1
        visible: false
        ToolIcon { iconId: "toolbar-back"; onClicked: pageStack.pop(); }

    }

    Text{
        id: switchText
        anchors {horizontalCenter: parent.horizontalCenter; top: parent.top; topMargin: 75}
        font.pointSize: 14
        text: "Use switch to allow input of new upload key.\nEnter new key by typing or copying it into the box below."
    }

    Switch {
        id: switch1
        anchors {horizontalCenter: parent.horizontalCenter; top: switchText.top; topMargin: 75}
        checked: false
        platformStyle: SwitchStyle {
            inverted: false
        }

        onCheckedChanged:
          if(checked){
            updatekey.enabled=true;
            uploadkey.readOnly=false;
            clearButton.enabled=true;
            }
          else{
              updatekey.enabled=false;
              uploadkey.readOnly=true;
              clearButton.enabled=false;
          }

    }


    TextField {
        id: uploadkey
        readOnly: true;
        anchors {left: parent.left; right: parent.right; top: switch1.bottom; topMargin: 75}
        height: 75
        platformSipAttributes: SipAttributes { actionKeyHighlighted: true }
        placeholderText: "Enter Upload Key"
        text: qsTr(scriptLauncher.currentKey())

        platformStyle: TextFieldStyle { paddingRight: clearButton.width }
        Image {
            id: clearButton
            enabled: false;
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            source: "image://theme/icon-m-input-clear"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    inputContext.reset();
                    uploadkey.text = "";

                }
            }
        }

   }


    Button{
           id: updatekey
           enabled: false
           anchors.left: parent.left
           anchors.right: parent.right
           anchors.top: uploadkey.bottom
           anchors.topMargin: 5
           text: qsTr("UpdateKey")
           onClicked: {
               var t = scriptLauncher.updateKey(qsTr(uploadkey.text));
               switch1.checked=false;
           }

    }

 }
