#include "tcpclient.h"
#include <QHostInfo>

Tcpclient::Tcpclient(QObject *parent):
 QObject(parent)
{
    //this->setServerAddress("192.168.1.199");
    //this->setServerPort(5000);
    //this->setServerStatus(false);

    connect(this,SIGNAL(serverAddressChanged()),this,SLOT(print()));

    m_serverIP =new QHostAddress();

    //connect(this,SIGNAL(connectInteServer()),this,SLOT(inteEnter()));
    //connect(this,SIGNAL(sendCmd(QString theCmd)),this,SLOT(send(QString theCmd)));

    //sendBtn->setEnabled(false);
}

void Tcpclient::enter()
{

    if(!m_serverStatus)
    {
        if(!m_serverIP->setAddress(m_serverAddress))
        {
            //QMessageBox::information(this,tr("error"),tr("server ip address error!"));
            qDebug() << tr("error,server ip address error!")<<endl;
            return;
        }

        m_tcpSocket = new QTcpSocket(this);
        connect(m_tcpSocket,SIGNAL(connected()),this,SLOT(connected()));
        connect(m_tcpSocket,SIGNAL(disconnected()),this,SLOT(disconnected()));
        connect(m_tcpSocket,SIGNAL(readyRead()),this,SLOT(dataReceived()));

        m_tcpSocket->connectToHost(*m_serverIP,m_serverPort);
        m_serverStatus=true;
    }
    else
    {
        int length=0;
        QString msg=tr("connect close!");
        if((length=m_tcpSocket->write(msg.toLatin1(),msg.length()))!=msg. length())
        {
            return;
        }
        m_tcpSocket->disconnectFromHost();
        m_serverStatus=false;
        qDebug() << tr("connect close!")<<endl;
    }
}

void Tcpclient::connected()
{
    //sendBtn->setEnabled(true);
    //enterBtn->setText(tr("离开"));
    emit serverConnected();
    qDebug() << tr("connect connected!")<<endl;
    int length=0;
    QString msg=tr("connect open");
    if((length=m_tcpSocket->write(msg.toLatin1(),msg.length()))!=msg.length())
    {
        return;
    }
}

void Tcpclient::disconnected()
{
    //sendBtn->setEnabled(false);
    emit serverDisconnected();
    qDebug() << tr("disconnected!")<<endl;
    //enterBtn->setText(tr("进入聊天室"));

}

void Tcpclient::dataReceived()
{

    while(m_tcpSocket->bytesAvailable()>0)
    {
        QByteArray datagram;
        datagram.resize(m_tcpSocket->bytesAvailable());

        m_tcpSocket->read(datagram.data(),datagram.size());

        QString msg=datagram.data();
        qDebug() << tr("received message:")<<endl<<msg.left(datagram.size())<<endl;

    }
}

void Tcpclient::send(QString thePrefix,QString theCmd)
{
    /*
    if(sendLineEdit->text()=="")
    {
        return ;
    }
    */
    QString msg=thePrefix+theCmd+"end";
    m_tcpSocket->write(msg.toLatin1(),msg.length());
    //sendLineEdit->clear();

}


