import 'dart:ffi';

import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';

class MyUltraCoolAppBar extends AppBar {
    MyUltraCoolAppBar(TextEditingController controller, String titleName,Color color, {Key? key}):super(key: key,
        iconTheme: IconThemeData(
            color: color, //change your color here
        ),
        backgroundColor: Color.fromRGBO(144, 205, 249, 1),
        title: Text(
            "this is app bar",
            style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
                  Center(
                    child: AnimationSearchBar(
                        isBackButtonVisible: false,
                        centerTitle: titleName,
                        onChanged: (text) => debugPrint(text),
                        searchTextEditingController: controller,
                        horizontalPadding: 5)
                        ),
        ],
    );
}


// import 'package:animation_search_bar/animation_search_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// AppBar MyUltaCoolAppBar(TextEditingController controller, String titleName) {
//   return AppBar(
//       child: PreferredSize(
//         preferredSize: const Size(double.infinity, 65),
//         child: SafeArea(
//             child: Container(
//                 decoration: const BoxDecoration(
//                     color: Color.fromRGBO(144, 205, 249, 1),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 5,
//                           spreadRadius: 0,
//                           offset: Offset(0, 5))
//                     ]),
//                 child: Center(
//                     child: AnimationSearchBar(
//                         isBackButtonVisible: false,
//                         centerTitle: titleName,
//                         onChanged: (text) => debugPrint(text),
//                         searchTextEditingController: controller,
//                         horizontalPadding: 5)
//                         ),
//                         ),
//                         ),
//                         ),
//                         );
//
// }
