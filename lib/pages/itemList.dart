import 'package:cyrs_1/buttons/amazingToCardButton.dart';
import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:cyrs_1/custom%20classes/diskInfoWidget.dart';
import 'package:cyrs_1/custom%20classes/diskProreties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key, required this.disk}) : super(key: key);
  final AppsProps? disk;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  TextEditingController get controller =>
      TextEditingController(text: "Функция не доступна");
  String dropdownvalue = "beri.shop";
  int cost = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUltraCoolAppBar(
          controller, "Подробная информация о товаре", const Color.fromRGBO(144, 205, 249, 1), true),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: Text(
                  widget.disk?.name as String,
                  style: TextStyle(
                    color: Colors.black12.withOpacity(0.7),
                    fontSize: 18,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                      width: 120,
                      height: 64,
                      child: Image.network(widget.disk?.urlToImg as String)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  child: diskInfoView(widget.disk),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(144, 205, 249, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DropdownButton(
                      dropdownColor: Color.fromRGBO(144, 205, 249, 1),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          switch (dropdownvalue) {
                            case "beri.shop":
                              var mod = 0;
                              cost = ((widget.disk?.cost as int) + mod);
                              break;
                            case " mobicomshop.ru":
                              var mod = 300;
                              cost = (widget.disk?.cost as int) + mod;
                              break;
                            case "comparema":
                              var mod = 500;
                              cost = (widget.disk?.cost as int) + mod;
                              break;
                            case "sly.ru":
                              var mod = 700;
                              cost = (widget.disk?.cost as int) + mod;
                              break;
                            default:
                              break;
                          }
                        });
                      },
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: shopList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 0),
                  child: Text(
                    "Цена:    $cost руб.",
                    style: const TextStyle(
                      fontSize: 18,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 60.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.only(left: 200, top: 0),
            child: AmazingShopButton(id: (widget.disk?.id).toString(),))
          ],
        ),
      ),
    );
  }
}
