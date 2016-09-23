import QtQuick 2.7

import 'qrc:/ui/components/form'
import 'qrc:/ui/components/image'

import 'qrc:/ui/style' as Style

// ===================================================================

Item {
    property bool isCollapsed: false

    signal collapsed (bool collapsed)

    function collapse () {
        isCollapsed = !isCollapsed
        collapsed(isCollapsed)
        rotate.start()
    }

    ActionButton {
        anchors.centerIn: parent
        background: Style.CollapseStyle.background
        icon: 'collapse'
        iconSize: 32
        id: button
        onClicked: collapse()
    }

    RotationAnimation {
        direction: RotationAnimation.Clockwise
        duration: 200
        from: isCollapsed ? 0 : 180
        id: rotate
        property: 'rotation'
        target: button
        to: isCollapsed ? 180 : 0
    }
}
