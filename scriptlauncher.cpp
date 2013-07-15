#include "scriptlauncher.h"
#include <fstream>
#include <string.h>
#include <iostream>

ScriptLauncher::ScriptLauncher(QObject *parent) :
    QObject(parent),
    m_process(new QProcess(this))

{
}

void ScriptLauncher::launchScript()
{
    m_process->start("sh /home/user/.config/maefi/eyefiserver start");
}

void ScriptLauncher::stopScript()
{
    m_process->start("sh /home/user/.config/maefi/eyefiserver stop");
}

void ScriptLauncher::launchHotspot()
{
    m_process->start("invoker --type=m --splash=/opt/joikuspot/hotspot_splashscreen.png --splash-landscape=/opt/joikuspot/hotspot_splashscreen_landscape.png /opt/joikuspot/joikuspot");
}

void ScriptLauncher::launchGallery()
{
    m_process->start("/usr/bin/invoker --type=m /usr/bin/gallery");
}

QString ScriptLauncher::serverStatus()
{
    m_process->execute("sh /home/user/.config/maefi/server_status.sh");
    m_process->waitForFinished(-1);
    QString p_stdout = m_process->readAllStandardOutput();
    if (p_stdout.contains("Stopping EyeFiServer."))
        return "Server Stopped";
    else
        return "Server Running";


}

void ScriptLauncher::updateKey(QString newkey)
{
    m_process->execute("sh /home/user/.config/maefi/change_key.sh "+newkey);
    m_process->waitForFinished(-1);
    QString p_stdout = m_process->readAllStandardOutput();

}

QString ScriptLauncher::currentKey()
{
    m_process->execute("sh /home/user/.config/maefi/change_key.sh false");
    std::ifstream stream("/home/user/.config/maefi/newkey.txt");
    std::string Line;
    std::getline(stream, Line);
    std::string key = Line.substr (11);
    QString qstr = QString::fromStdString(key);

    return qstr;

}


