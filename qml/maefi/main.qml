import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }


    function loadAboutDialog() {
        return instantiateComponent("AboutDialog.qml", {})
    }

    function instantiateComponent(file, properties) {
        console.log("createComponent", file)
        var component = Qt.createComponent(file)
        console.log("/createComponent", file)

        if (component.status == Component.Ready) {
            console.log("createObject", file)
            var comp = component.createObject(mainPage, properties)
            console.log("/createObject", file)
            return comp
        }
        else
            console.log("Error loading component:", component.errorString());

    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            //MenuItem { text: "Settings"; onClicked:  pageStack.push(Qt.resolvedUrl("Settings.qml")) }
            MenuItem { text: "Instructions"; onClicked:  pageStack.push(Qt.resolvedUrl("Instructions.qml")) }
            MenuItem { text: "About Mae-Fi"; onClicked: loadAboutDialog().open() }
        }

    }
}
