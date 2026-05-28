import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "popouts"

Scope {
  id: root

    Variants {
      model: Quickshell.screens;

        PanelWindow {
          id: window;
          property real barHeight: screen.height * 0.025;
          property real offset: 0.95;

          readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.screen);
          property bool monitorIsFocused: (Hyprland.focusedMonitor?.id == monitor?.id);

          readonly property string primaryColor: "#dedbce"; // "#d1ccc1"; // "#ae8d75";
          readonly property string secondaryColor: "#bc3e2c"; // "#cd9528"; //"#dea795";
          readonly property string primaryShadowColor: "#3e294a" // "black";
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
            color: window.primaryColor;
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

          Rectangle {
            id: workspacesCont;
            x: (window.width * 0.88);
            y: 4;
            radius: 6;
            width: 200;
            height: bar.height - 8;
            border.color: window.primaryShadowColor;
            color: "black";
            visible: false;
          }

          Workspaces {
            anchors.horizontalCenter: workspacesCont.horizontalCenter;
            anchors.verticalCenter: workspacesCont.verticalCenter;
            anchors.horizontalCenterOffset: +3;
          }

        }
      }
}