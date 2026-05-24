// Time.qml

pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property int hours: clock.hours;
    readonly property int minutes: clock.minutes;
    readonly property int seconds: clock.seconds;

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm")
    }

    readonly property string date: {
        Qt.formatDateTime(clock.date, "MMMM dd, yyyy")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
