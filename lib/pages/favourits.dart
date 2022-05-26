import 'package:cyrs_1/custom%20classes/favouritesListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom classes/customAppBar.dart';
import '../globals/globals.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }
    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUltraCoolAppBar(controller,"Избранное", Colors.black, true),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: ListView.builder(itemBuilder: (BuildContext context, int index) => FavouritesCatalogView(context, index, rebuildAllChildren), itemCount: like.length,),
      ),
    );
  }
}
