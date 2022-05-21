import 'dart:core';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class DiskProp
{
  DiskProp({required this.id, required this.name, required this.description, required this.cost, required this.urlToImg});
  late int id;
  late String name;
  late String description;
  late int cost;
  late String urlToImg;



  static DiskProp fromJson(json) =>
      DiskProp(id: json['id'], name: json['name'], description: json['description'], cost: json['cost'], urlToImg: json['urlToImg']);

}