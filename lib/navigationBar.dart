import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:cyrs_1/pages/favourits.dart';
import 'package:cyrs_1/registartation%20&%20login/main.dart';
import 'package:cyrs_1/pages/profile.dart';
import 'package:cyrs_1/registartation%20&%20login/register.dart';
import 'package:cyrs_1/pages/shopList.dart';
import 'package:cyrs_1/pages/shoppingCard.dart';
import 'package:cyrs_1/custom%20classes/user.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals/globals.dart' as globals;

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}



class _CatalogState extends State<Catalog> {
  List<dynamic> titlesArray = ["Каталог", "Корзина", "Избранное", "Профиль"];
  int _selectedIndex = 0;
  PageController pageController = PageController();
  final TextEditingController test = TextEditingController();


  final List<Widget> _children = [
    ShopList(),
    ShoppingCard(),
    Favourites(),
    Profile()
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);

    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: _children,
        onPageChanged: (index) {
          _selectedIndex = index;
          setState(() {});
        },
      ),
      // body: _children[_selectedIndex],

      bottomNavigationBar: FluidNavBar(
        style: const FluidNavBarStyle(
            barBackgroundColor: Color.fromRGBO(144, 205, 249, 1),
            iconSelectedForegroundColor: Colors.black,
            iconUnselectedForegroundColor: Colors.black), // (1)
        icons: [
          // (2)
          FluidNavBarIcon(
            icon: Icons.home,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          ),
          FluidNavBarIcon(
            icon: Icons.shopping_cart,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          ),
          FluidNavBarIcon(
            icon: Icons.favorite_border,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          ), // (3)
          FluidNavBarIcon(
            icon: Icons.account_circle_outlined,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          ),
        ],
        onChange: onTapped, // (4)
      ),
    );
  }
}
//   items:  <BottomNavigationBarItem>[
//     BottomNavigationBarItem(
//         icon: Icon(Icons.home), label: 'Каталог'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.shopping_cart), label: 'Корзина'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.favorite_border), label: 'Избранное'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.account_circle_outlined), label: 'Профиль')
//   ],
//   currentIndex: _selectedIndex,
//   selectedItemColor: Colors.blue,
//   unselectedItemColor: Colors.grey,
//   onTap: onTapped,
// ),
