import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bands/services/socketService.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    //socketService.socket.emit(event);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("server status ${socketService.serverStatus}")],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //emitir mensaje
          socketService.socket.emit('emitir-mensaje',
              {'nombre': 'flutter', 'mensaje': 'hola desde flutter'});
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
