import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:cyrs_1/pages/favourits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: SafeArea(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(144, 205, 249, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: Offset(0, 5))
                      ]),
                  child: Center(
                      child: AnimationSearchBar(
                          isBackButtonVisible: false,
                          centerTitle: 'Избранное',
                          onChanged: (text) => debugPrint(text),
                          searchTextEditingController: controller,
                          horizontalPadding: 5))))),
      body: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 12),
        child: ListView.separated(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 300,
              height: 154,
              margin:
                  const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
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
                        child: Image.asset("assets/images/hdd_template.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 150, top: 25),
                    child: SizedBox(
                        width: 200,
                        child: Text(
                          "Избранное текст",
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
                          "6666" + " руб.",
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
                              Icons.highlight_remove,
                              size: 6,
                            ),
                            tooltip: null,
                            onPressed:
                                () {}, //TODO: Реализовать удаление товара из бд пользователя
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 365),
                    child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(144, 205, 249, 1),
                            border: Border.all(
                              color: const Color.fromRGBO(144, 205, 249, 1),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Transform.scale(
                          scale: 3,
                          child: IconButton(
                            icon: Icon(
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
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 3,
          ),
        ),
      ),
    );
  }
}
