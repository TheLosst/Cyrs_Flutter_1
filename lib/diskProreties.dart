import 'package:flutter/cupertino.dart';

class DiskProp
{
  DiskProp({Key? key,required this.id, required this.name, required this.description, required this.cost});
  int id;
  String name;
  String description;
  int cost;

  void setID(int id){
    this.id = id;
  }

  void setName(String name){
    this.name = name;
  }

  void setDescription(String description){
    this.description = description;
  }

  void setCost(int cost){
    this.cost = cost;
  }
}