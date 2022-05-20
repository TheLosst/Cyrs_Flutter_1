import 'dart:convert';

import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:cyrs_1/custom%20classes/catalogListDisk.dart';
import 'package:cyrs_1/custom%20classes/customAppBar.dart';
import 'package:cyrs_1/custom%20classes/iconsCustom.dart';
import 'package:cyrs_1/registartation%20&%20login/login.dart';
import 'package:cyrs_1/registartation%20&%20login/register.dart';
import 'package:cyrs_1/custom%20classes/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../custom classes/diskProreties.dart';
import '../globals/globals.dart' as globals;
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
    Future<DiskProp> test = createDiskProp();
    print(test);
  }

  Future<DiskProp> createDiskProp() async {
    DiskProp test = await fetchDiskDescr();
    return test;
  }

  // Future<http.Response> getListData() {
  //   return http.get(Uri.parse('$connIp/DiskProp.json'));
  // }

  Future<DiskProp> fetchDiskDescr() async {
    final response = await http.get(Uri.parse('$connIp/DiskProp.json'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return DiskProp.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ойбаный Ёобаный ОБЭМЭ!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUltraCoolAppBar(controller, "Каталог", Colors.black),
      body: Padding(
        padding: EdgeInsets.only(top:1, bottom: 12),
        child: FutureBuilder<DiskProp>(
            future: fetchDiskDescr(),
            builder: (BuildContext context, AsyncSnapshot<DiskProp> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.separated(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return DisplayCatalogItem(snapshot.data?.id, snapshot.data?.name, snapshot.data?.cost);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 3,
                  ),
                );
              } else {
                return Center(child:
                CollectionSlideTransition(
                  children: const <Widget>[
                    Icon(Icons.accessible),
                    Icon(Icons.arrow_right_alt),
                    Icon(Icons.accessible_forward_sharp),
                  ],
                ),
                );
              }
            }),
      ),
    );
  }
}

//
