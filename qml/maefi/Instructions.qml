import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
import QtWebKit 1.0


Page {
    id: instructions
    tools: navigationToolbar1

    ToolBarLayout {
        id: navigationToolbar1
        visible: false
        ToolIcon { iconId: "toolbar-back"; onClicked: pageStack.pop(); }

    }
    Flickable{
        id: flick
        clip:  true
        width: parent.width; height:parent.height
        contentWidth: parent.width
        contentHeight: 2000
        WebView {
            id: webView
            preferredWidth: parent.width
            preferredHeight: parent.height
            anchors {left: parent.left; right: parent.right; top: parent.top; topMargin:5}
            url: 'instructions.html'
        }

    }

    ScrollDecorator {
        id: scrollDecorator
        flickableItem: flick
    }

}
