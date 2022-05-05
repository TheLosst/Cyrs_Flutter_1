import 'dart:convert';

import 'package:cyrs_1/iconsCustom.dart';
import 'package:cyrs_1/main.dart';
import 'package:cyrs_1/profile.dart';
import 'package:cyrs_1/register.dart';
import 'package:cyrs_1/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<dynamic> titlesArray = ["Каталог","Корзина","Избранное","Профиль"];
  int _selectedIndex = 0;
  PageController pageController = PageController();
  final TextEditingController test = TextEditingController();

  final List<Widget> _children = [
    Registration(),
    LoginPage(title: '',),
    Registration(),
    Profile()
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 100), curve: Curves.easeOutQuart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlesArray[_selectedIndex]),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){},
          child: Icon(Icons.search_rounded),
        ),
      ),

      body: _children[_selectedIndex],


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Каталог'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Корзина'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Избранное'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Профиль')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
