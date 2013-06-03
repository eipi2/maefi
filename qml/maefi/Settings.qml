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

    TextField {
        id: uploadkey
        anchors {left: parent.left; right: parent.right; topMargin: 75}
        height: 75
        platformSipAttributes: SipAttributes { actionKeyHighlighted: true }
        placeholderText: "Enter Upload Key"
        platformStyle: TextFieldStyle { paddingRight: clearButton.width }
        Image {
            id: clearButton
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            source: "image://theme/icon-m-input-clear"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    inputContext.reset();

                }
            }
        }
    }

}
