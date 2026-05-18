import QtQuick

MouseArea {
    id: timeArea
    hoverEnabled: true;
    cursorShape: Qt.PointingHandCursor;
    implicitHeight: parent.height;
    implicitWidth: timeRect.implicitWidth + 5;
    function onClicked() {
        timeArea.color = "purple";
    }

    Rectangle {
        id: timeRect
        implicitWidth: 50
        implicitHeight: (screen.height * 0.025) - 8
        anchors.centerIn: parent
        color: timeArea.containsMouse ? "white" : "#dea795"
        radius: 6

        Text {
        anchors.centerIn: parent
        text: Time.time
        font: "Terminess Nerd Font"
        }
    }

}
