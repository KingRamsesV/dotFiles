import QtQuick
import Quickshell
import Quickshell.Widgets


Rectangle {
    implicitWidth: 150
    implicitHeight: (screen.height * 0.025) - 8
    color: "#dea795"
    radius: 20


    Text {
        anchors.centerIn: parent
        text: (Battery.batteryPercentage) * 100
        font: "Terminess Nerd Font"
    }

    IconImage {
        anchors.centerIn: parent
        Image {
            // var path = "/usr/share/icons/Adawaita/symbolic/status/battery-level-" << Math.round((Battery.batteryPercentage * 100)/10) * 10 << "-symbolic.svg"
            // var intermediate = Math.round((Battery.batteryPercentage * 100)/10) * 10
            id: batteryIcon
            source: path.arg(intermediate)
        }
    }
}