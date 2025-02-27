// CardDelegate.qml

import QtQuick
import QtQuick.Controls

Item {
    width: SwipeView.view.width
    height: SwipeView.view.height

    // Свойства, которые должны быть в cardsModel
    property string imagePath: model.imagePath // Путь к картинке
    property string word: model.word           // Название картинки
    property bool showWord: model.showWord     // Видимость текста
    property string userAnswer: model.userAnswer // Ответ пользователя
    property bool resultVisible: model.resultVisible // Видимость результата

    Column {
        anchors.centerIn: parent
        spacing: 20

        Image {
            id: cardImage
            source: imagePath // Используем imagePath из модели
            width: 400
            height: 300
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: wordLabel
            text: word // Используем word из модели
            font.pixelSize: 32
            visible: showWord // Используем showWord из модели
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: answerInput
            visible: !showWord
            placeholderText: "Type the word here"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            onTextChanged: userAnswer = text // Обновляем userAnswer
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
