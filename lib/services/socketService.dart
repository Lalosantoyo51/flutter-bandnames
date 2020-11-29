import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


enum ServerStatus{
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  SocketService(){
  this._initConfig();
  }
  void _initConfig(){
    var ulr = "http://192.168.100.7:3000";
    print("$ulr");
    IO.Socket socket = IO.io('http://192.168.100.7:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.onConnect((_) {
      print('connect');
    });
    socket.onDisconnect((_) => print('disconnect'));
    socket.connect();

  }


}