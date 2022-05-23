import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:cyrs_1/custom%20classes/diskInfoWidget.dart';
import 'package:cyrs_1/custom%20classes/diskProreties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiskPropPage extends StatefulWidget {
  const DiskPropPage({Key? key, required this.disk}) : super(key: key);
  final DiskProp? disk;
  @override
  State<DiskPropPage> createState() => _DiskPropPageState();
}





class _DiskPropPageState extends State<DiskPropPage> {

  var shopList = ["beri.shop", " mobicomshop.ru", "comparema", "sly.ru"];

  TextEditingController get controller =>
      TextEditingController(text: "Функция не доступна");

  String dropdownvalue = 'beri.shop';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyUltraCoolAppBar(
            controller, " ", const Color.fromRGBO(144, 205, 249, 1), true),
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 600),
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
                child: diskInfoView(widget?.disk),
              ),
              DropdownButton(
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: shopList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      );
}