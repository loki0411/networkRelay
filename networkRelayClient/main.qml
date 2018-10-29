import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
//导入注册的C++类
import Tcpclient.module 1.0

Window {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("网络继电器控制")
    property string theCmd: "0"
    property string theOnPrefix: "start"
    property string theOffPrefix: "close"
    Column
    {
        id:mainColumn
        anchors.centerIn: parent
        spacing: 8

        Row{
            id:row1
            spacing: 2
            Text {
                id: netipText
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("有线ip地址")
            }
            TextField{
                id:netipTextInput
                anchors.verticalCenter: netipText.verticalCenter
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("192.168.1.199")
                onEditingFinished: internetTcpclient.serverAddress = text
            }
        }

        Row{
            id:row2
            spacing: 2
            Text {
                id: netportText
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("有线端口号")
            }
            TextField{
                id:netportTextInput
                anchors.verticalCenter:netportText.verticalCenter
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("5000")
            }
        }

        Row{
            id:row3
            spacing: 2
            Text {
                id: wifiipText
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("无线ip地址")
            }
            TextField{
                id:wifiipTextInput
                anchors.verticalCenter:wifiipText.verticalCenter
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("192.168.43.22")
                onEditingFinished: wifiTcpclient.serverAddress = text
            }
        }

        Row{
            id:row4
            spacing: 2
            Text {
                id: wifiportText
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("无线端口号")
            }
            TextField{
                id:wifiportTextInput
                anchors.verticalCenter:wifiportText.verticalCenter
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("5000")
            }
        }
        Row{
            id:row5
            spacing: 8
            Text {
                id: netconnectText
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("有线控制")
            }
            Button{
                id:netconnectBtn
                anchors.verticalCenter:netconnectText.verticalCenter
                text: qsTr("打开")
                onClicked: {
                     internetTcpclient.enter()
                     internetTcpclient.serverStatus?netconnectBtn.text=qsTr("关闭"):netconnectBtn.text=qsTr("打开")
                }
            }
        }

        Row{
            id:row6
            spacing: 8
            Text {
                id: wificonnectText
                font.family: "Helvetica"
                font.pointSize: 15
                text: qsTr("无线控制")
            }
            Button{
                id:wificonnectBtn
                anchors.verticalCenter:wificonnectText.verticalCenter
                text: qsTr("打开")
                onClicked: {
                    wifiTcpclient.enter()
                    wifiTcpclient.serverStatus?wificonnectBtn.text=qsTr("关闭"):wificonnectBtn.text=qsTr("打开")
                }
            }
        }
        Row{
            id:row7
            spacing: 8

            Column
            {
                id:relay1Column
                spacing: 8

                Switch{
                   id:relay1                   
                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay1.checked=!relay1.checked
                              theCmd="1";
                              if(relay1.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay1Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("1号继电器")
                }
            }

            Column
            {
                id:relay2Column
                spacing: 8

                Switch{
                   id:relay2

                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay2.checked=!relay2.checked
                              theCmd="2";
                              if(relay2.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay2Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("2号继电器")
                }
            }
            Column
            {
                id:relay3Column
                //anchors.centerIn: parent
                spacing: 8

                Switch{
                   id:relay3

                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay3.checked=!relay3.checked
                              theCmd="3";
                              if(relay3.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay3Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("3号继电器")
                }
            }
            Column
            {
                id:relay4Column
                //anchors.centerIn: parent
                spacing: 8

                Switch{
                   id:relay4

                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay4.checked=!relay4.checked
                              theCmd="4";
                              if(relay4.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay4Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("4号继电器")
                }
            }
        }

        Row{
            id:row8
            spacing: 8

            Column
            {
                id:relay5Column
                spacing: 8

                Switch{
                   id:relay5

                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay5.checked=!relay5.checked
                              theCmd="5";
                              if(relay5.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay5Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("5号继电器")
                }
            }

            Column
            {
                id:relay6Column
                spacing: 8

                Switch{
                   id:relay6

                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay6.checked=!relay6.checked
                              theCmd="6";
                              if(relay6.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay6Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("6号继电器")
                }
            }
            Column
            {
                id:relay7Column
                spacing: 8

                Switch{
                   id:relay7

                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay7.checked=!relay7.checked
                              theCmd="7";
                              if(relay7.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay7Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("7号继电器")
                }
            }
            Column
            {
                id:relay8Column
                spacing: 8

                Switch{
                   id:relay8

                   MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              relay8.checked=!relay8.checked
                              theCmd="8";
                              if(relay8.checked){
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOnPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOnPrefix,theCmd)
                              }
                              else{
                                  if(wifiTcpclient.serverStatus)
                                    wifiTcpclient.send(theOffPrefix,theCmd)
                                  else
                                    internetTcpclient.send(theOffPrefix,theCmd)
                              }
                          }
                      }
                }

                Text {
                    id: relay8Text
                    font.family: "Helvetica"
                    font.pointSize: 15
                    text: qsTr("8号继电器")
                }
            }
        }
    }

    Tcpclient{
            id:internetTcpclient  //Tcpclient类的实例
            serverAddress:"192.168.1.199"
            serverPort: 5000
            serverStatus: false
        }
    Tcpclient{
            id:wifiTcpclient  //Tcpclient类的实例
            serverAddress:"192.168.43.22"
            serverPort: 5000
            serverStatus: false
        }

}
