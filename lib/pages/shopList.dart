import 'dart:convert';

import 'package:cyrs_1/custom%20classes/catalogListDisk.dart';
import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../custom classes/diskProreties.dart';
import '../globals/globals.dart';
import 'package:http/http.dart' as http;

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  late TextEditingController controller = TextEditingController();
  late Future<DiskProp> futureDiskProp;

  @override
  initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  Future<List<DiskProp>> createDiskProp() async {
    //List<DiskProp> test = await fetchDiskDescr();
    test = await fetchDiskDescr();
    return test;
  }

  // Future<http.Response> getListData() {
  //   return http.get(Uri.parse('$connIp/DiskProp.json'));
  // }

  Future<List<DiskProp>> fetchDiskDescr() async {
    final response = await http.get(Uri.parse('$connIp/DiskProp.json'));
    if (response.statusCode == 200) {
      var buff = json.decode(response.body);
      print(buff);
      return buff.map<DiskProp>(DiskProp.fromJson).toList();
    } else {
      throw Exception('Все сломалось!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUltraCoolAppBar(controller, "Каталог", Colors.black, false),
      body: FutureBuilder<List<DiskProp>?>(
          future: createDiskProp(),
          builder:
              (BuildContext context, AsyncSnapshot<List<DiskProp>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data?.length as int,
                  itemBuilder: (BuildContext context, int index) =>
                      displayCatalogItem(
                          snapshot.data?[index],
                          context));
            } else {
              return Center(
                child: CollectionSlideTransition(
                  children: const <Widget>[
                    Icon(Icons.accessible),
                    Icon(Icons.arrow_right_alt),
                    Icon(Icons.accessible_forward_sharp),
                  ],
                ),
              );
            }
          }),
    );
  }
}
