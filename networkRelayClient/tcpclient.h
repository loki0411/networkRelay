#ifndef TCPCLIENT_H
#define TCPCLIEN_H

#include <QObject>
#include <QTcpSocket>
#include <QString>
#include <QDebug>

class Tcpclient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString serverAddress READ serverAddress WRITE setServerAddress NOTIFY serverAddressChanged)
    Q_PROPERTY(bool serverStatus READ serverStatus WRITE setServerStatus NOTIFY serverStatusChanged)
    Q_PROPERTY(int serverPort READ serverPort WRITE setServerPort NOTIFY serverPortChanged)
public:
    explicit Tcpclient(QObject *parent = nullptr);
    QString serverAddress(){
        return  this->m_serverAddress;
    }
    bool serverStatus(){
        return  this->m_serverStatus;
    }
    int serverPort(){
       return  this->m_serverPort;
    }

    void setServerAddress(const QString &theServerAddress){
        if (theServerAddress == m_serverAddress)
            return;
        else{
            m_serverAddress = theServerAddress;
            emit serverAddressChanged();
        }
    }

    void setServerPort(const int &theServerPort){
        if (theServerPort == m_serverPort)
            return;
        else{
            m_serverPort = theServerPort;
            emit serverPortChanged();
        }
    }

    void setServerStatus(const bool &theServerStatus){
        if (theServerStatus == m_serverStatus)
            return;
        else{
            m_serverStatus = theServerStatus;
            emit serverStatusChanged();
        }
    }


public slots:
    void print(){
         qDebug() << "serverAddress:"<<serverAddress()<<endl;
    }
    void enter();
    void connected();
    void disconnected();
    void dataReceived();
    void send(QString thePrefix,QString theCmd);
signals:
    void serverAddressChanged();
    void serverStatusChanged();
    void serverPortChanged();

    void sendCmd(QString theCmd);
    void serverConnected();
    void serverDisconnected();
private:
    QString m_serverAddress;
    bool m_serverStatus;
    QHostAddress *m_serverIP;
    QTcpSocket *m_tcpSocket;
    int m_serverPort;
};

#endif // TCPCLIEN_H
