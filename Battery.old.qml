pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property real batteryPercentage: {
        if (UPowerDevice.ready) {
            UPowerDevice.percentage
        }
        else if(UPowerDeviceState.toString() === "Charging"){
            "Charging"
        }
    }

    function f(batteryPercentage) {
        console.log("battery is ", a)
    }

    readonly property string isCharging: {
        if (UPowerDeviceState.toString() === "Charging") {
            "Charging"
        }
        else if (UPowerDeviceState.toString() === "Discharging") {
            "Not Charging"
        }
        else if (UPowerDeviceState.toString() === "FullyCharged") {
            "Fully Charged"
        }
        else {
            ""
        }
    }
}

