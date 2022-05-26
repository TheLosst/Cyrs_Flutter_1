import 'package:cyrs_1/buttons/amazingToCardButton.dart';
import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:cyrs_1/custom%20classes/diskInfoWidget.dart';
import 'package:cyrs_1/custom%20classes/diskProreties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class DiskPropPage extends StatefulWidget {
  const DiskPropPage({Key? key, required this.disk}) : super(key: key);
  final DiskProp? disk;

  @override
  State<DiskPropPage> createState() => _DiskPropPageState();
}

class _DiskPropPageState extends State<DiskPropPage> {
  TextEditingController get controller =>
      TextEditingController(text: "Функция не доступна");
  String dropdownvalue = "beri.shop";
  int cost = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUltraCoolAppBar(
          controller, " ", const Color.fromRGBO(144, 205, 249, 1), true),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 590),
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
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: SizedBox(
                  width: 120,
                  height: 64,
                  child: Image.network(widget.disk?.urlToImg as String)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 120),
              child: diskInfoView(widget.disk),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, top: 210),
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
                          var mod = 1;
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
              padding: EdgeInsets.only(left: 240, top: 222),
              child: Text(
                "Цена:    $cost руб.",
                style: TextStyle(
                  fontSize: 18,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 60.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 240, top: 250),
            child: AmazingShopButton(id: (widget.disk?.id).toString(),))
          ],
        ),
      ),
    );
  }
}
