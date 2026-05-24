import QtQuick 2.15
import Quickshell
import Quickshell.Wayland

import "../"

PanelWindow {
    id: root;
    color: "transparent";
    anchors.top: true;
    WlrLayershell.layer: "Top";
    margins.top: 10;
    exclusiveZone: 0;
    implicitHeight: 100;

    Rectangle {
        id: rectCont;
        width: 100;
        height: 125;
        color: window.primaryColor;
        radius: 6;
        border.color: "black";
        opacity: 1;

        states: State {
            name: "visible"; when: topBattery.containsMouse;
            PropertyChanges { target: rectCont; opacity: 0.8; }
        }

        transitions: Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad }
        }

        Rectangle {
            width: rectCont.width;
            height: rectCont.height;
            color: window.primaryColor;
        }
    }

}
