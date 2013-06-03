#ifndef CONFIG_H
#define CONFIGct>
#include <QProcess>

class Config : public QObject
{

    Q_OBJECT

public:
    explicit Config(QObject *parent = 0);
    Q_INVOKABLE void changeKey();

private:
    QProcess *p_process;
};

#endif
