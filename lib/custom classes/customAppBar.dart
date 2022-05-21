import 'dart:ffi';

import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';

class MyUltraCoolAppBar extends AppBar {
    MyUltraCoolAppBar(TextEditingController controller, String titleName,Color color, bool isBackButtonVisible, {Key? key}):super(key: key,
        backgroundColor: Color.fromRGBO(144, 205, 249, 1),
        automaticallyImplyLeading: false,
        actions: <Widget>[
                  Center(
                    child: AnimationSearchBar(
                        searchIconColor: color,
                        isBackButtonVisible: isBackButtonVisible,
                        centerTitle: titleName,
                        onChanged: (text) => debugPrint(text),
                        searchTextEditingController: controller,
                        horizontalPadding: 5)
                        ),
        ],
    );
}
