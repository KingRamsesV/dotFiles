import QtQuick
import Quickshell
import Quickshell.Wayland



MouseArea {
    id: timeArea
    hoverEnabled: true;
    cursorShape: Qt.PointingHandCursor;
    height: parent.height;
    width: timeRect.width + 50;
    readonly property alias clockHover: timeArea.containsMouse

    Rectangle {
        id: shadowRect;
        width: timeRect.width;
        height: timeRect.height;
        anchors.centerIn: timeRect;
        color: window.primaryShadowColor;
        radius: timeRect.radius;
        border.color: window.primaryShadowColor;
        border.width: timeRect.border.width;
        anchors.verticalCenterOffset: +2;
        anchors.horizontalCenterOffset: +2;
    }

    Rectangle {
        id: timeRect
        width: 50
        height: (screen.height * 0.025) - 8
        anchors.centerIn: parent
        color: timeArea.containsMouse ? window.primaryColor : window.secondaryColor;
        radius: 6
        border.color: window.primaryShadowColor;
        border.width: 1;
    }

    Text {
        anchors.centerIn: timeRect;
        text: Time.time
        font: "Terminess Nerd Font"
        color: timeArea.containsMouse ? window.primaryShadowColor : window.primaryColor;
    }
}
