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
        contentHeight: 2200
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
