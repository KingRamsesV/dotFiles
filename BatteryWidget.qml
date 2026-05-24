import QtQuick
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Widgets


MouseArea {
    id: root
    width: 150
    height: bar.height
    anchors.left: bar.left;
    anchors.leftMargin: 8;
    anchors.verticalCenter: bar.verticalCenter;
    hoverEnabled: true;
    cursorShape: Qt.PointingHandCursor;
    readonly property alias batteryHover: root.containsMouse;

    property UPowerDevice bat:
        UPower.displayDevice

    Rectangle {
        width: 150;
        height: parent.height - 8;
        color: batteryHover ? window.primaryColor : window.secondaryColor;
        radius: 6;
        border.color: "black";
        border.width: 1;
        anchors.centerIn: parent;
    }

    Text {
        anchors.centerIn: parent
        text: {
            const pct = Math.round(bat.percentage * 100);
            const icon = bat.state === UPowerDeviceState.Charging ? "⚡" : pct > 60 ? "big harge" : pct > 20 ? "wittle charg" : "❗";
            return bat.isPresent ? icon + " " + pct + "%" : "...";
        }
        font.family: window.primaryFont;
    }
}