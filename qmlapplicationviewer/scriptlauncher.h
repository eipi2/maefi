#ifndef SCRIPTLAUNCHER_H
#define SCRIPTLAUNCHER_H

#include <QObject>
#include <QProcess>

class ScriptLauncher : public QObject
{

    Q_OBJECT

public:
    explicit ScriptLauncher(QObject *parent = 0);
    Q_INVOKABLE void launchScript();
    Q_INVOKABLE void stopScript();
    Q_INVOKABLE void launchHotspot();
    Q_INVOKABLE void launchGallery();
    Q_INVOKABLE QString serverStatus();
    Q_INVOKABLE void changeKey();

private:
    QProcess *m_process;
    QProcess *p_process;
};

#endif
