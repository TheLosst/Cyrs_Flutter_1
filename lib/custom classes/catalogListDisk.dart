import 'package:cyrs_1/buttons/amazingLikeButton.dart';
import 'package:cyrs_1/buttons/amazingToCardButton.dart';
import 'package:cyrs_1/custom%20classes/diskProreties.dart';
import 'package:cyrs_1/pages/diskPropPage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

Widget DisplayCatalogItem(DiskProp? disk, context) {
  return Card(
    child: Container(
      width: 300,
      height: 154,
      margin: const EdgeInsets.only(bottom: 3, left: 0, right: 0, top: 5),
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
                child: Image.network(disk?.urlToImg as String, scale: 7),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 150, top: 25),
            child: SizedBox(
                width: 200,
                child: Text(
                  disk?.name as String,
                  maxLines: 3,
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 150, top: 85),
            child: SizedBox(
                width: 200,
                child: Text(
                  "${disk?.cost as int}" " руб.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
              padding: EdgeInsets.only(top: 110, left: 245),
              child: AmazingLikeButton( id: ((disk?.id).toString()),)),
          Padding(
            padding: EdgeInsets.only(top: 70, left: 275),
            child: Container(
                width: 107,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(195, 0, 70, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(195, 0, 70, 1),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(195, 0, 70, 1))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DiskPropPage(disk: disk),
                    ));
                  },
                  child: const Text("Подробнее"),
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
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: AmazingShopButton()),
          ),
        ],
      ),
    ),
  );
}
