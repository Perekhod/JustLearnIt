import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

ApplicationWindow {
    id: window
    width: 800
    height: 600
    visible: true
    title: "Vocabulary Trainer"

    ListModel {
        id: cardsModel
    }

    FileDialog {
        id: fileDialog
        title: "Select an image"
        nameFilters: ["Image files (*.png *.jpg *.jpeg)"]
        onAccepted: {
            addDialog.open()
        }
    }

    Dialog {
        id: addDialog
        title: "Add New Card"
        anchors.centerIn: parent
        standardButtons: Dialog.Ok | Dialog.Cancel

        property string imagePath: ""
        property string englishWord: ""

        Column {
            spacing: 10
            TextField {
                id: wordInput
                placeholderText: "Enter English word"
            }
        }

        onAccepted: {
            cardsModel.append({
                "imagePath": fileDialog.selectedFile,
                "word": wordInput.text,
                "showWord": true,
                "userAnswer": "",
                "resultVisible": false
            })
            wordInput.text = ""
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        Repeater {
            model: cardsModel
            delegate: CardDelegate {}
        }
    }

    Button {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
        text: "Add New Card"
        onClicked: fileDialog.open()
    }
}
