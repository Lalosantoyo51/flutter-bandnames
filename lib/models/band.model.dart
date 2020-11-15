import 'package:flutter/foundation.dart';

class BandModel {
  String id;
  String name;
  int votes;

  BandModel({this.name,this.id,this.votes});

  factory BandModel.fromMap (Map <String,dynamic> obj)=> BandModel(
    id: obj['id'],
    name: obj['name'],
    votes: obj['votes']
  );

}
