import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bands/services/socketService.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService  =Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(),
    );
  }
}
