import QtQuick 2.15
import Quickshell
import Quickshell.Wayland

import "../"

PanelWindow {
    id: root;
    color: "transparent";
    anchors.top: true;
    // BackgroundEffect.blurRegion: Region { item: root.contentItem }
    WlrLayershell.layer: "Top";
    margins.top: 10;
    exclusiveZone: 0;
    implicitHeight: 125;

    Rectangle {
        id: rectCont;
        width: 100;
        height: root.implicitHeight;
        color: window.primaryColor;
        radius: 6;
        border.color: "black";
        opacity: 0;

        states: State {
            name: "visible"; when: topClock.containsMouse;
            PropertyChanges { target: rectCont; opacity: 0.8; }
        }

        transitions: Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad }
        }


        Rectangle {
            id: clockFace;
            width: 90;
            height: 90;
            color: window.secondaryColor;
            radius: 180;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.verticalCenterOffset: -10;
            border.color: "black";
            border.width: 1;

            Text {
                color: "black";
                font.family: window.primaryFont;
                font.bold: true;
                font.pointSize: 11;
                text: Time.date;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.verticalCenterOffset: 55;
            }

            Rectangle {
                id: clockCenter;
                width: 5;
                height: 5;
                color: "black";
                radius: 180;
                anchors.centerIn: parent;
            }

            Rectangle {
                id: hourHand;
                transformOrigin: Item.Bottom;
                width: 1;
                height: (clockFace.height) / 4;
                color: "black";

                x: (clockFace.width / 2) - (width / 2);
                y: (clockFace.height / 2) - height;
                rotation: (Time.hours / 60) * 360;
            }

            Rectangle {
                id: minuteHand;
                transformOrigin: Item.Bottom;
                width: 2;
                height: (clockFace.height / 2);
                color: "black";

                x: (clockFace.width / 2) - (width / 2);
                y: (clockFace.height / 2) - height;
                rotation: (Time.minutes / 60) * 360;
            }

            Rectangle {
                id: secondHand;
                transformOrigin: Item.Bottom;
                width: 1;
                height: (clockFace.height) / 2;
                color: "black";

                x: (clockFace.width / 2) - (width / 2);
                y: (clockFace.height / 2) - height;
                rotation: (Time.seconds / 60) * 360;
            }

        }
    }
}
