import 'package:cyrs_1/custom%20classes/diskProreties.dart';
import 'package:cyrs_1/globals/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom classes/favouritesListView.dart';


  Widget AmazingRemoveFromFavourtitesButton(BuildContext context, int id, rebuild) {
    return Transform.scale(
      scale: 3,
      child: IconButton(
        icon: const Icon(
          Icons.highlight_remove,
          size: 6,
        ),
        tooltip: null,
        onPressed: () {
          if (!like[id]) {
            like[id] = true;
            rebuild;
          } else {
            like[id] = false;
            rebuild;
          }
        },
      ),
    );
  }

