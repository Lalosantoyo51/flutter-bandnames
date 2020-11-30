import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';


enum ServerStatus{
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;
  IO.Socket get socket => this._socket;
  ServerStatus get serverStatus => this._serverStatus;


  SocketService(){
  this._initConfig();
  }
  void _initConfig(){
    var ulr = "http://192.168.100.7:3000/";
    print("$ulr");
    _socket = IO.io('http://192.168.100.7:3000/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.onConnect((_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    socket.connect();
  }

}