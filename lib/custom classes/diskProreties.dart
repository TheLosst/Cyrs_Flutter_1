import 'package:flutter/cupertino.dart';

class DiskProp
{
  const DiskProp({Key? key,required this.id, required this.name, required this.description, required this.cost});
  final int id;
  final String name;
  final String description;
  final int cost;

  factory DiskProp.fromJson(Map<String, dynamic> json) {
    return DiskProp(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      cost: json['cost']
    );
  }
}