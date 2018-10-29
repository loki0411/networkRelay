#include "tcpclient.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    //注册C++类型Tcpclient
    qmlRegisterType<Tcpclient>("Tcpclient.module",1,0,"Tcpclient");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
