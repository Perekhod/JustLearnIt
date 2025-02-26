import QtQuick
import QtQuick.Controls

Item {
    width: SwipeView.view.width
    height: SwipeView.view.height

    property bool showWord: model.showWord
    property string resultText: ""
    property bool resultVisible: model.resultVisible

    Column {
        anchors.centerIn: parent
        spacing: 20

        Image {
            id: cardImage
            source: model.imagePath
            width: 400
            height: 300
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: wordLabel
            text: model.word
            font.pixelSize: 32
            visible: showWord
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: answerInput
            visible: !showWord
            placeholderText: "Type the word here"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            onTextChanged: model.userAnswer = text
        }

        Button {
            text: showWord ? "Start Test" : "Check Answer"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (showWord) {
                    model.showWord = false
                    model.resultVisible = false
                } else {
                    model.resultVisible = true
                    model.showWord = true
                }
            }
        }

        Label {
            text: model.userAnswer === model.word ? "Correct!" : "Wrong! Correct answer: " + model.word
            color: model.userAnswer === model.word ? "green" : "red"
            visible: model.resultVisible
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
