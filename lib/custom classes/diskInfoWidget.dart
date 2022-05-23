import 'package:cyrs_1/custom%20classes/diskProreties.dart';
import 'package:flutter/material.dart';

Widget diskInfoView(DiskProp? disk) {
  List<String> options = [
    (disk?.formfactor as String),
    (disk?.capacity as String),
    (disk?.speed as String),
    (disk?.interfaces as String),
    (disk?.deadworktime as String),
    (disk?.size as String),
  ];
  List<String> russNames = [
    "Форм-фактор: ",
    "Емкость: ",
    "Скорость: ",
    "Интерфейс: ",
    "Время наработки на отказ: ",
    "Габариты: "
  ];
  return SizedBox(
    height: 150,
    width: 280,
    child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20,
            width: 200,
            child: Column(children: [
              Row(
                children: [
                  Text(
                    russNames[index].toString(),
                    style: TextStyle(
                      color: Colors.black12.withOpacity(0.7),
                      shadows: const <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 50.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "${options[index]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(195, 0, 70, 1),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 25.0,
                          color: Color.fromARGB(220, 0, 0, 0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]),
          );
        }),
  );

  // child: Center(
  //   child: Column(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(bottom: 0),
  //         child: Row(
  //           children: [
  //           Text("Емкость: "),
  //           Text("${disk?.capacity}",style: TextStyle(color: Colors.red),)
  //           ],
  //         ),
  //         // child: Text("Емкость: " "${disk?.capacity}",textAlign: TextAlign.left,),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.all(0),
  //         child: Text("Форм-фактор: " "${disk?.formfactor}",textAlign: TextAlign.left),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.all(0),
  //         child: Text("Скорость : " "${disk?.speed}",textAlign: TextAlign.left),
  //       ),
  //     ],
  //   ),
  //
  //
  // ),
}
