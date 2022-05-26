import 'dart:core';


class DiskProp
{
  DiskProp({required this.id, required this.name,required this.formfactor, required this.capacity, required this.speed, required this.interfaces, required this.deadworktime, required this.size, required this.cost, required this.urlToImg});
  late int id;
  late String name;
  late String formfactor;
  late String capacity;
  late String speed;
  late String interfaces;
  late String deadworktime;
  late String size;
  late int cost;
  late String urlToImg;



  static DiskProp fromJson(json) =>
      DiskProp(id: json['id'], name: json['name'], formfactor: json['formfactor'], capacity: json['capacity'], speed: json['speed'], interfaces: json['interfaces'], deadworktime: json['deadworktime'], size: json['size'], cost: json['cost'], urlToImg: json['urlToImg']);

}