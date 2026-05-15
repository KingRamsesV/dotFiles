import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Io

PanelWindow {
  id: window
  property real barHeight: screen.height * 0.025
  property real offset: 0.95
  property string primaryColor: "transparent"
  anchors {
    left: true
    right: true
    top: true
  }

  implicitHeight: barHeight
  /*
  margins {
    left: screen.width * 0.0075
    right: screen.width * 0.0075
    top: screen.height * 0.015
  } */


  Rectangle {
    width: window.width
    height: window.height
    color: "steelblue"
    radius: 20
  }

  Text {
    id: clock
    anchors.centerIn: parent
    color: "black"

    Process {
      id: dateProc
      command: ["date"]
      running: true
      stdout: StdioCollector {
        onStreamFinished: clock.text = this.text
      }
    }

    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: dateProc.running = true
    }
  }
  color: primaryColor

  /*
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
      property real widthOffset: window.width * .997
      property real heightOffset: window.height * window.offset
      fillColor: "#222266"
      strokeColor: "transparent"
      startX: 0 ; startY: 0 // top-left
      PathLine { x: path.widthOffset; y: 0 }  // top-right
      PathLine { x: path.widthOffset; y: path.heightOffset }  // bottom-right
      PathLine { x: 0; y: path.heightOffset} //bottom-left
    }
  }*/
}

