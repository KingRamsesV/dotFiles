import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

RowLayout {

    spacing: 5;

    Process {
        id: wsProc;
        property int targetId: 0;
        command: ["hyprctl", "dispatch", "focus({})", targetId.toString()];
    }

    property var sortedWorkspaces: {
        let ws = Hyprland.workspaces.values;
        return ws.slice().sort((a,b) => a.id - b.id);
    }

    Repeater {
        id: repeater;
        model: sortedWorkspaces;

        MouseArea {
            id: wsMouseArea;
            hoverEnabled: true;
            implicitWidth: 15;
            implicitHeight: 15;
            width: 15;
            height: 15;
            cursorShape: Qt.PointingHandCursor;
            onClicked: {
                console.log("clicked workspace", modelData.id);
                wsProc.targetId = modelData.id;
                wsProc.running = true;
                // Hyprland.dispatch("workspace", modelData.id.toString());
            }

            Rectangle {
                id: wsRect;
                anchors.fill: parent;
                // radius: 6;
                border.width: 1;
                border.color: window.primaryShadowColor;
                color: wsMouseArea.containsMouse ? window.primaryColor : window.secondaryColor;

                Text {
                    id: wsText;
                    property var ws:
                        Hyprland.workspaces.values.find(w => w.id === modelData.id);
                    property bool isActive:
                        Hyprland.focusedWorkspace?.id === (modelData.id);
                    font.family: window.primaryFont;

                    anchors.centerIn: wsRect;
                    anchors.horizontalCenterOffset: -1;
                    anchors.verticalCenterOffset: -1;
                    text: modelData.id;
                    color: wsMouseArea.containsMouse ? "black" : window.primaryColor;
                }
            }
        }
/*
        Rectangle {
            id: wsShadow;
            radius: wsRect.radius;
            width: wsRect.width;
            height: wsRect.height;
            border.color: wsRect.border.color;
        }
*/
    }

    Item {
    Layout.fillWidth: true;
    }
}

