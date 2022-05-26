import 'package:cyrs_1/globals/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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

