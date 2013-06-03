#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "scriptlauncher.h"
#include "qdeclarativecontext.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QmlApplicationViewer viewer;


    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/maefi/main.qml"));
    viewer.showExpanded();

    ScriptLauncher launcher;
    QDeclarativeContext *context = viewer.rootContext();
    context->setContextProperty("scriptLauncher", &launcher);

    return app->exec();
}
