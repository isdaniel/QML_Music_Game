#include <QApplication>
#include <VPApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "score.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    VPApplication vplay;
    QQmlApplicationEngine engine;
    vplay.initialize(&engine);
    vplay.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    qmlRegisterType<score>("Myscore",1,0,"Mscore");
    vplay.setContentScaleAndFileSelectors(1);
    engine.load(QUrl(vplay.mainQmlFileName()));
    return app.exec();
}

