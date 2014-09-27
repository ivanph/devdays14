import QtQuick 2.0
import "../utils" as Utils

Rectangle {
    id: root
    property alias rowWidth : _Row.width
    width: _Row.width
    height: 52
    anchors.verticalCenter: parent.verticalCenter
    radius: 10
    color: __theme.qtColorMediumGreen
    transformOrigin: Item.Center
    // There is a painting delay if we hide this icon
    // when not in use. It stutters the animation
    // visible: opacity>0
    clip: true
    layer.enabled: true
    layer.smooth: true
    Row {
        id: _Row
        height: parent.height
        width: childrenRect.width
        Utils.BaseIcon {
            anchors.centerIn: undefined
            anchors.verticalCenter: parent.verticalCenter
            source: "../img/icon-clock-filled.png"
            color: "#ffffff"
            width: 24
            Utils.Fill { color: "pink" }
        }
        Utils.HorizontalSpacer { width: 12 }
        Label {
            id: _Label_Now
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 1
            font.pixelSize: 24
            font.weight: Font.DemiBold
            color: "#ffffff"
            text: qsTr("NOW")
        }
        Utils.HorizontalSpacer { width: 18 }
    }
}
