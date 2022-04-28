import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class User{
  User({Key? key,required this.phone,required this.username,required this.password});
  String username;
  String password;
  String phone;

  void setName(String name){
    username = name;
  }
  void setEmail(String phone){
    this.phone = phone;
  }
  void setPassword(String password){
    this.password = password;
  }

}