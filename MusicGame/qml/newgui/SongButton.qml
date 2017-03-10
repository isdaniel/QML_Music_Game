import VPlay 2.0
import QtQuick 2.3
import "../game1"
Item {
    id: button
    width:80
    height:30
    signal pressed
    signal released
    signal clicked
    signal doubleclick
    property alias source: sprite.source
    MultiResolutionImage {
        anchors.fill:button
        id: sprite
    }
    MouseArea {
        id: mouseArea
        enabled: button.enabled
        anchors.fill: button
        hoverEnabled: true
        onClicked: button.clicked()
        onPressed: button.pressed()
        onReleased: button.released()
        onDoubleClicked:doubleclick()
    }
    onPressed: {
        opacity = 0.5
    }
    onReleased: {
        opacity = 1.0
    }
}

