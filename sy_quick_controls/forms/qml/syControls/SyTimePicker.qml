import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0


Popup {
    id:clockid
    width: frame.implicitWidth + 10
    height: frame.implicitHeight + 10
    function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }
    signal done(string currentTime)
    Component {
        id: delegateComponent
        Label {
            text: clockid.formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font: Constants.largeFont
        }
    }
    Frame {
        id: frame
        padding: 0
        anchors.centerIn: parent
        property string currentTime: hoursTumbler.currentItem.text + ":" + minutesTumbler.currentItem.text + " " + amPmTumbler.currentItem.text
        Row {
            id: row_clock
            Tumbler {
                id: hoursTumbler
                model: 12
                delegate: delegateComponent
                visibleItemCount: 5
            }
            Tumbler {
                id: minutesTumbler
                model: 60
                delegate: delegateComponent
                visibleItemCount: 5
            }
            Tumbler {
                id: amPmTumbler
                model: ["AM", "PM"]
                delegate: delegateComponent
            }
        }
    }
    RowLayout{
        id: timePickerActions
        width: clockid.width
        height: 40
        anchors{
            top: frame.bottom
        }
        Label{
            id: cancelLabel
            text: "Cancel"
            font: Constants.largeFont
            color: Material.color(Material.LightBlue,Material.Shade500)
        }
        Label{
            id: acceptLabel
            text: "OK"
            font: Constants.largeFont
            color: Material.color(Material.LightBlue,Material.Shade500)
            MouseArea{
                anchors.fill: acceptLabel
                onClicked: {
                    clockid.done(frame.currentTime)
                    clockid.close()
                }
            }
        }
    }
}
