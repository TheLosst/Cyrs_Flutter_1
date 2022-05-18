import 'dart:math';

import 'package:flutter/cupertino.dart';

class DiskProp
{
  DiskProp({required this.id, required this.name, required this.description, required this.cost});
  late String id;
  late String name;
  late String description;
  late int cost;

  factory DiskProp.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final name = json['name'] as String;
    final description = json['description'] as String;
    final cost = json['cost'] as int;
    return DiskProp(id: id, name: name, description: description, cost: cost);
  }

  void setID(String data){
    id = data;
  }

  void setName(String data){
    name = data;
  }

  void setDescription(String data){
    description = data;
  }

  void setCost(int data){
    cost = data;
  }

}