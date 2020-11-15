import 'dart:io';

import 'package:bands/models/band.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BandModel> bands = [
    BandModel(id: '1', name: "Doble v", votes: 5),
    BandModel(id: '2', name: "kase o", votes: 3),
    BandModel(id: '3', name: "metalica", votes: 2),
    BandModel(id: '4', name: "heroes del solencio", votes: 5),
    BandModel(id: '5', name: "cpv", votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BandNmes',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, i) => _bandTile(bands[i])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: () => addNewBand(),
      ),
    );
  }

  Widget _bandTile(BandModel band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print('${direction}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
            child: Text(
          "Delete band",
          style: TextStyle(color: Colors.white),
        )),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text("${band.name.substring(0, 2)}"),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          "${band.votes}",
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          print('${band.name}');
        },
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      //android
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("new band name:"),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  child: Text("add"),
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () => addBandToList(textController.text),
                ),
              ],
            );
          });
    } else {
      showCupertinoDialog(
          context: context,
          builder: (_) {
            return CupertinoAlertDialog(
              title: Text("new band name:"),
              content: CupertinoTextField(
                controller: textController,
              ),
              actions: [
                CupertinoDialogAction(
                    child: Text("add"),
                    isDefaultAction: true,
                    onPressed: () => addBandToList(textController.text)),
                CupertinoDialogAction(
                    child: Text("Dismiss"),
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context)),
              ],
            );
          });
    }
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      print('${name}');
      this.bands.add(
          new BandModel(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
