/*Main.qml*/

import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import com.example 1.0

ApplicationWindow {
    id: window
    width: 850
    height: 700
    visible: true
    title: "Vocabulary Trainer"

    ListModel {
        id: cardsModel
    }

    Component.onCompleted: {
        imageLoader.setImageFolder("C:/Users/USER/Documents/JustLearnIt!/JustLearnIt/pictures")
    }

    Connections {
        target: imageLoader
        function onImagesChanged() {
            cardsModel.clear()
            for (var i = 0; i < imageLoader.images.length; i++) {
                var imagePath = imageLoader.images[i]
                var fileName = imagePath.split("/").pop().split(".")[0]
                cardsModel.append({
                              "imagePath"     : imagePath,
                              "word"          : fileName,
                              "showWord"      : true,
                              "userAnswer"    : "",
                              "resultVisible" : false
                                })
                console.log("Added card:", imagePath,fileName)
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
    }
}
