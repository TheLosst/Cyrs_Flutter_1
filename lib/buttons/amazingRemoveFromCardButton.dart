import 'package:cyrs_1/globals/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget AmazingRemoveFromCardButton(BuildContext context, int id) {
  return Transform.scale(
    scale: 3,
    child: IconButton(
      icon: const Icon(
        Icons.highlight_remove,
        size: 6,
      ),
      tooltip: null,
      onPressed: () {
        if (!shoppingCard[id]) {
          shoppingCard[id] = true;
        } else {
          shoppingCard[id] = false;
        }
      },
    ),
  );
}
