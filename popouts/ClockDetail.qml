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
    implicitHeight: 150;
    implicitWidth: 125;
    readonly property real transitionOpacity: 1;

    Rectangle {
        id: rectShadow;
        width: rectCont.width;
        height: rectCont.height;
        color: window.primaryShadowColor;
        radius: rectCont.radius;
        border.color: window.primaryShadowColor;
        opacity: 0;
        anchors.centerIn: rectCont;
        anchors.verticalCenterOffset: +5;
        anchors.horizontalCenterOffset: +5;

        states: State {
            name: "visible"; when: topClock.containsMouse;
            PropertyChanges { target: rectShadow; opacity: root.transitionOpacity; }
        }

        transitions: Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad }
        }
    }

    Rectangle {
        id: rectCont;
        width: 100;
        height: 125;
        color: window.primaryColor;
        radius: 6;
        border.color: window.primaryShadowColor;
        opacity: 0;

        states: State {
            name: "visible"; when: topClock.containsMouse;
            PropertyChanges { target: rectCont; opacity: root.transitionOpacity; }
        }

        transitions: Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad }
        }

        Rectangle {
            id: clockFaceShadow;
            width: clockFace.width;
            height: clockFace.height;
            color: window.primaryShadowColor;
            radius: 180;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.verticalCenterOffset: -8;
            anchors.horizontalCenterOffset: +2;
            border.color: window.primaryShadowColor;
            border.width: 1;
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
                text: "12";
                anchors.centerIn: clockFace;
                anchors.verticalCenterOffset: -33;
                color: window.primaryShadowColor;
                font.family: window.primaryFont;
                font.bold: true;
                font.pointSize: 8;
            }

            Text {
                text: "3";
                anchors.centerIn: clockFace;
                anchors.horizontalCenterOffset: 33;
                color: window.primaryShadowColor;
                font.family: window.primaryFont;
                font.pointSize: 8;
            }

            Text {
                text: "6";
                anchors.centerIn: clockFace;
                anchors.verticalCenterOffset: 33;
                color: window.primaryShadowColor;
                font.family: window.primaryFont;
                font.pointSize: 8;
            }

            Text {
                text: "9";
                anchors.centerIn: clockFace;
                anchors.horizontalCenterOffset: -33;
                color: window.primaryShadowColor;
                font.family: window.primaryFont;
                font.pointSize: 8;
            }

            Text {
                id: clockDate;
                color: window.primaryShadowColor;
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
                color: window.primaryShadowColor;
                radius: 180;
                anchors.centerIn: parent;
            }

            Rectangle {
                id: hourHand;
                transformOrigin: Item.Bottom;
                width: 2;
                height: (clockFace.height) / 4;
                color: window.primaryShadowColor;

                x: (clockFace.width / 2) - (width / 2);
                y: (clockFace.height / 2) - height;
                rotation: (Time.hours / 12) * 360;
            }

            Rectangle {
                id: minuteHand;
                transformOrigin: Item.Bottom;
                width: 2;
                height: (clockFace.height / 2);
                color: window.primaryShadowColor;

                x: (clockFace.width / 2) - (width / 2);
                y: (clockFace.height / 2) - height;
                rotation: (Time.minutes / 60) * 360;
            }

            Rectangle {
                id: secondHand;
                transformOrigin: Item.Bottom;
                width: 1;
                height: (clockFace.height) / 2;
                color: window.primaryShadowColor;

                x: (clockFace.width / 2) - (width / 2);
                y: (clockFace.height / 2) - height;
                rotation: (Time.seconds / 60) * 360;
            }

        }
    }
}
