import QtQuick

Rectangle {
    implicitWidth: 150
    implicitHeight: (screen.height * 0.025) - 8
    color: "#dea795"
    radius: 20

    Text {
        anchors.centerIn: parent
        text: Time.time
        font: "Terminess Nerd Font"
    }
}

