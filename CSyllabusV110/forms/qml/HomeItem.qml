import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0
import "./components"

StackView{
    property alias syStackView: syStackViewContainer
    id: syStackViewContainer
    initialItem: SyHomeForm{

    }
}
