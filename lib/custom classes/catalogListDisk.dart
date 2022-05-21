import 'package:flutter/material.dart';

Widget DisplayCatalogItem(int? id, String? name, int? cost, String? imgPath){
      return Container(
        width: 300,
        height: 154,
        margin:
        const EdgeInsets.only(bottom: 3, left: 0, right: 0, top: 5),
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
                margin: const EdgeInsets.only(
                    bottom: 0, left: 0, right: 0, top: 0),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(20))),
                child: SizedBox(
                  width: 120,
                  height: 85,
                  child: Image.network(imgPath!, scale: 3),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 150, top: 25),
              child: SizedBox(
                  width: 200,
                  child: Text(
                    name!,
                    maxLines: 3,
                    style:
                    TextStyle(color: Colors.black.withOpacity(0.5)),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 150, top: 85),
              child: SizedBox(
                  width: 200,
                  child: Text(
                    "$cost" " руб.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 110, left: 245),
              child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5))),
                  child: Transform.scale(
                    scale: 3,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        size: 6,
                      ),
                      tooltip: null,
                      onPressed:
                          () {}, //TODO: Добавить смену иконки при нажатии и отправлять пост запрос на добавление id в бд для избранного и корзины
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 105, left: 280),
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
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
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
      );
    }