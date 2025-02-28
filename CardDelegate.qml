// CardDelegate.qml

import QtQuick
import QtQuick.Controls

Item {
    width: ListView.view.width
    height: ListView.view.height

    property string imagePath: model.imagePath
    property string word: model.word
    property bool showWord: model.showWord
    property string userAnswer: model.userAnswer
    property bool resultVisible: model.resultVisible

    Column {
        anchors.centerIn: parent
        spacing: 20

        Image {
            id: cardImage
            source: imagePath
            width: 400
            height: 300
            //fillMode: Image.PreserveAspectFit
        }

        Label {
            id: wordLabel
            text: word
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
            onTextChanged: userAnswer = text
        }

        Button {
            text: showWord ? "Start Test" : "Check Answer"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (showWord) {
                    showWord = false
                    resultVisible = false
                } else {
                    resultVisible = true
                    showWord = true
                }
            }
        }

        Label {
            text: userAnswer === word ? "Correct!" : "Wrong! Correct answer: " + word
            color: userAnswer === word ? "green" : "red"
            visible: resultVisible
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
