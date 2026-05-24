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
        id: timeRect
        width: 50
        height: (screen.height * 0.025) - 8
        anchors.centerIn: parent
        color: timeArea.containsMouse ? window.primaryColor : window.secondaryColor;
        radius: 6
        border.color: "black";
        border.width: 1;

        Text {
        anchors.centerIn: parent
        text: Time.time
        font: "Terminess Nerd Font"
        }
    }
}
