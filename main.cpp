/*main.cpp*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "imageloader.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    qmlRegisterType<ImageLoader>("com.example", 1, 0, "ImageLoader");
    ImageLoader imageLoader;
    engine.rootContext()->setContextProperty("imageLoader",&imageLoader);


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("JustLearnIt", "Main");

    return app.exec();
}
