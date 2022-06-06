import 'package:cyrs_1/buttons/amazingLikeButton.dart';
import 'package:cyrs_1/buttons/amazingRemoveFromCardButton.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

Widget ShoppingCardListView(context, int index, Function reload) {
  if (shoppingCard[index]) {
    return Card(
        child: Container(
      width: 300,
      height: 154,
      margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(144, 205, 249, 1),
          border: Border.all(
            color: const Color.fromRGBO(144, 205, 249, 1),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25, left: 10),
            child: Container(
              width: 120,
              height: 85,
              margin:
                  const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: SizedBox(
                width: 120,
                height: 85,
                child: Image.network(test[index].urlToImg),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 25),
            child: SizedBox(
                width: 200,
                child: Text(
                  test[index].name,
                  maxLines: 3,
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 85),
            child: SizedBox(
                width: 200,
                child: Text(
                  "${test[index].cost} руб.",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 255),
            child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: SizedBox(
                  child: AmazingRemoveFromCardButton(context, index, reload),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 225),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 225),
            child: AmazingLikeButton(id: (index+1).toString())
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 285),
            child: Container(
              width: 90,
              height: 24,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 285),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Transform.scale(
                scale: 3,
                child: IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 6,
                    color: Colors.red,
                  ),
                  tooltip: null,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 350),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Transform.scale(
                scale: 3,
                child: IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 6,
                    color: Colors.red,
                  ),
                  tooltip: null,
                  onPressed:
                      () {},
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 327, top: 113),
            child: Text("lol2"),
          )
        ],
      ),
    ));
  } else {
    return const Card();
  }
}
