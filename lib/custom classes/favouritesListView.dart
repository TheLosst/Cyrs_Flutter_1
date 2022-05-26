import 'package:cyrs_1/buttons/amazingRemoveFromFavourtitesButton.dart';

import 'package:flutter/material.dart';

import '../globals/globals.dart';

Widget FavouritesCatalogView(context, int index, rebuild) {
  print(index);
  if (like[index]) {
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
              padding: const EdgeInsets.only(top: 25, left: 10),
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
                  child: Image.network(test[index].urlToImg, scale: 7),
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
                    "${test[index].cost}" + " руб.",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 110, left: 245),
              child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: AmazingRemoveFromFavourtitesButton(
                      context, index, rebuild)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 365),
              child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(144, 205, 249, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(144, 205, 249, 1),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Transform.scale(
                    scale: 3,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        size: 6,
                        color: Colors.red,
                      ),
                      tooltip: null,
                      onPressed:
                          () {}, //TODO: Реализовать удаление товара из бд пользователя
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 105, left: 280),
              child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(195, 0, 70, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(195, 0, 70, 1),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(195, 0, 70, 1))),
                    onPressed: () {},
                    //TODO: Добавить пост запрос на добавление ид в бд при нажатии на кнопку
                    child: const Text("В корзину"),
                  )),
            ),
          ],
        ),
      ),
    );
  } else {
    return const Card();
  }
}