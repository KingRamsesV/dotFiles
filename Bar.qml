import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

import "popouts"

Scope {
  id: root

    Variants {
      model: Quickshell.screens;

        PanelWindow {
          id: window;
          property real barHeight: screen.height * 0.025;
          property real offset: 0.95;
          readonly property string primaryColor: "#ae8d75";
          readonly property string secondaryColor: "#dea795";
          readonly property string primaryFont: "Terminess Nerd Font";
          required property var modelData;
          screen: modelData;
          color: "transparent";

          anchors {
            left: true;
            right: true;
            top: true;
            bottom: false;
          }

          implicitHeight: barHeight;


          margins {
            left: 8;
            right: 8;
            top: 8;
          }

          Item {
            id: content;
              Rectangle {
                width: window.width;
                height: window.height;
                color: "#ae8d75";
                radius: 6;
                border.color: "black";
                border.width: 1;
              }
          }

          BatteryWidget {
            id: topBattery;
          }


          ClockWidget {
            id: topClock;
            anchors.centerIn: parent;
          }

          ClockDetail {
          }

        }
      }
}