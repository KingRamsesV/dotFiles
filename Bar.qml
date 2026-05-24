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
          readonly property string primaryShadowColor: "black";
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

          implicitHeight: barHeight + 5;


          margins {
            left: 8;
            right: 8;
            top: 8;
          }

          Rectangle {
            id: barShadow;
            width: window.width - 10;
            height: window.barHeight;
            color: window.primaryShadowColor;
            radius: 6;
            border.color: "black";
            border.width: 1;
            anchors.centerIn: bar;
            anchors.verticalCenterOffset: +5;
            anchors.horizontalCenterOffset: +5;
          }

          Rectangle {
            id: bar;
            width: window.width - 10;
            height: window.barHeight;
            color: "#ae8d75";
            radius: 6;
            border.color: "black";
            border.width: 1;
          }

          BatteryWidget {
            id: topBattery;
          }


          ClockWidget {
            id: topClock;
            anchors.centerIn: bar;
          }

          ClockDetail {
          }

        }
      }
}