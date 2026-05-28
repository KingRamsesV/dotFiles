import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

RowLayout {

    spacing: 5;

    Repeater {
        model: 9;

        Rectangle {
            id: wsRect;
            radius: 6;
            width: 15;
            height: 15;
            border.width: 1;
            border.color: "black";
            color: ws.MouseArea.containsMouse ? window.primaryColor : window.secondaryColor;
                /* {
                if (ws.MouseArea.containsMouse) {
                    window.primaryColor;
                } else if (wsText.isActive) {
                    window.primaryShadowColor;
                } else {
                    window.secondaryColor;
                }
            } */

            MouseArea {
                id: wsMouseArea;
                hoverEnabled: true;
                anchors.fill: wsRect;
                cursorShape: Qt.PointingHandCursor;
                onClicked:
                    Hyprland.dispatch("workspace " + (index + 1))
            }


            Text {
                id: wsText;
                property var ws:
                    Hyprland.workspaces.values.find(w => w.id === index + 1);
                property bool isActive:
                    Hyprland.focusedWorkspace?.id === (index + 1);
                font.family: window.primaryFont;

                anchors.centerIn: wsRect;
                anchors.horizontalCenterOffset: -1;
                anchors.verticalCenterOffset: -1;
                text: index + 1;
                color: wsMouseArea.containsMouse ? "black" : window.primaryColor;
            }
        }

    }

    Repeater {
        model: 9;

        Rectangle {
            id: wsShadow;
            radius: wsRect.radius;
            width: wsRect.width;
            height: wsRect.height;
            border.color: wsRect.border.color;
        }
    }

    Item {
    Layout.fillWidth: true;
    }
}

