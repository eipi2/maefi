#include "config.h"

Config::Config(QObject *parent) :
    QObject(parent),
    p_process(new QProcess(this))

{
}
void Config::changeKey()
{
    p_process->start("sh /home/user/.config/maefi/change_key.sh");
    //m_process->start("sh");
    //m_process->write("/home/user/.config/maefi/change_key.sh");
    //m_process->waitForFinished();
    //QByteArray output = m_process->readAll();
    //m_process->close();

}

