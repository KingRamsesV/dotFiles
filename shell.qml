import QtQuick
import QtQuick.Shapes
import Quickshell

PanelWindow {
  id: window
  property real barHeight: screen.height * 0.05
  property real offset: 0.75
  property string primaryColor: "purple"
  anchors {
    left: true
    right: true
    top: true
  }

  implicitHeight: barHeight

  margins {
    left: screen.width * 0.05
    right: screen.width * 0.05
    top: screen.height * 0.015
  }

  Text {
    anchors.centerIn: parent
    text: "hello"
  }
  color: primaryColor
  Shape {
    // main bar on top
    ShapePath {
      fillColor: "#ffffff"
      strokeColor: "transparent"
      PathLine { x: 0;   y: 0  }
      PathLine { x: window.width; y: 0  }
      PathLine { x: window.width; y: window.barHeight }
      PathLine { x: 0;   y: window.barHeight }
    }
    ShapePath {
      id: path
      property real widthOffset: window.width * 0.75
      property real heightOffset: window.height * window.offset
      fillColor: "#222266"
      strokeColor: "transparent"
      startX: (window.width - path.widthOffset); startY: 0
      PathLine { x: window.width; y: 0 }  // top-right
      PathLine { x: window.width; y: path.heightOffset }  // bottom-right
      PathLine { x: window.width - path.widthOffset; y: path.heightOffset} //bottom-left
    }
  }
}

