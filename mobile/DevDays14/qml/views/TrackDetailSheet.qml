import QtQuick 2.3
import "../utils" as Utils

Slide {
    id: root
    sourceComponent: Item {
        id: _Item
        Header {
            id: _Header
            z: 3
            enableLeftAndRightContainers: true
            leftContent: Utils.ClickGuard {
                Utils.BaseIcon {
                    source: "../img/icon-back.png"
                    color: "#222222"
                    anchors.centerIn: parent
                }
                onClicked: root.close()
            }

            Label {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                text: root.getProperty('session')
                Utils.Fill { color: "blue" }
            }
            Utils.ClickGuard {
                onClicked: {
                    root.close()
                }
            }
        }
        Flickable {
            id: _Flickable
            anchors.top: _Header.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 40
            contentWidth: width
            contentHeight: _Item_Container.height + 100
            z: 1
            Item {
                id: _Item_Container
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                Column {
                    width: parent.width
                    height: childrenRect.height
                    Label {
                        id: _Label_Title
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.pixelSize: 40
                        text: root.getProperty('presentation').title
                    }
                    Utils.VerticalSpacer { height: 30 }
                    Row {
                        id: _Row_TrackColor
                        width: parent.width
                        height: 60
                        Rectangle {
                            id: _Rectangle_TrackColor
                            width: 60
                            height: 60
                            radius: 10
                            color: root.getProperty('presentation').track.color
                            visible: _Label_TrackTitle !== ""
                            Rectangle {
                                radius: parent.radius
                                anchors.fill: parent
                                opacity: 0.25
                                border { width: 2; color: Qt.darker(_Rectangle_TrackColor.color) }
                            }
                        }
                        Utils.HorizontalSpacer { width: 30 }
                        Label {
                            id: _Label_TrackTitle
                            anchors.verticalCenter: _Rectangle_TrackColor.verticalCenter
                            text: root.getProperty('presentation').track.title
                            color: "#222222"
                        }
                    }
                    Utils.VerticalSpacer { height: 30; visible: _Row_TrackColor.visible }
                    Label {
                        id: _Label_Abstract
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.pixelSize: 30
                        text: root.getProperty('presentation').abstract
                    }
                    Utils.VerticalSpacer { height: 60 }
                    Rectangle {
                        width: parent.width
                        height: 1
                        color: __theme.lightGreyAccentSecondary
                    }
                    Rectangle {
                        width: parent.width
                        height: 1
                        color: __theme.lightGreyAccent
                    }
                    Utils.VerticalSpacer { height: 60 }
                    Item {
                        width: parent.width
                        height: 120
                        Rectangle {
                            id: _Rectangle_PresenterBackfill
                            height: parent.height
                            width: height
                            color: __theme.lightGrey
                            clip: true
                            Image {
                                id: _Image_Presenter
                                anchors.fill: parent
                                sourceSize.width: width
                                sourceSize.height: height
                                source: root.getProperty('presenter').image
                            }
                        }
                        Column {
                            anchors.left: _Rectangle_PresenterBackfill.right
                            anchors.leftMargin: 36
                            anchors.right: parent.right
                            height: childrenRect.height
                            anchors.verticalCenter: _Rectangle_PresenterBackfill.verticalCenter
                            Label {
                                id: _Label_PresenterName
                                width: parent.width
                                wrapMode: Text.WordWrap
                                elide: Text.ElideRight
                                maximumLineCount: 2
                                font.pixelSize: 36
                                visible: text!==""
                                text: root.getProperty('presenter').name
                                lineHeight: 0.85
                                Utils.Fill { color: "red" }
                            }
                            Label {
                                id: _Label_PresenterOrganization
                                width: parent.width
                                wrapMode: Text.WordWrap
                                elide: Text.ElideRight
                                maximumLineCount: 2
                                font.italic: true
                                visible: text!==""
                                text: root.getProperty('presenter').organization
                                Utils.Fill { color: "purple" }
                            }
                        }
                    }
                    Utils.VerticalSpacer { height: 40 }
                    Label {
                        id: _Label_PresenterBio
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.pixelSize: 30
                        text: root.getProperty('presenter').bio
                    }
                }

                Utils.Fill { color: "yellow" }

            }
        }
    }
}
